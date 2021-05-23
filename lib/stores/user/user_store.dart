import 'package:ding/models/token/tokenResponsebody_model.dart';
import 'package:ding/stores/error/error_store.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../data/repository.dart';
part 'user_store.g.dart';

@Injectable()
class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  // repository instance
  final Repository _repository;

  // store for handling form errors
  final UserErrorStore userErrorStore = UserErrorStore();

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  // bool to check if current user is logged in
  bool isLoggedIn = false;

  // constructor:---------------------------------------------------------------
  _UserStore(Repository repository) : this._repository = repository {
    // setting up disposers
    _setupDisposers();
    _setupValidations();

    // checking if user is logged in
    repository.isLoggedIn.then((value) {
      this.isLoggedIn = value;
    });
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => tenant, validateTenant),
      reaction((_) => username, validateUsername),
      reaction((_) => password, validatePassword),
      reaction((_) => confirmPassword, validateConfirmPassword)
    ];
  }

  void _setupDisposers() {
    _disposers = [
      reaction((_) => success, (_) => success = false, delay: 200),
    ];
  }

  // empty responses:-----------------------------------------------------------
  static ObservableFuture<TokenResponseBodyModel> emptyLoginResponse =
      ObservableFuture.value(new TokenResponseBodyModel());

  // store variables:-----------------------------------------------------------
  @observable
  bool success = false;

  @observable
  String? errorMessage = "";

  @observable
  ObservableFuture<TokenResponseBodyModel> loginFuture = emptyLoginResponse;

  @computed
  bool get isLoading => loginFuture.status == FutureStatus.pending;

// store variables:-----------------------------------------------------------
  @observable
  String? tenantId;
  @observable
  String tenant = '';
  @observable
  String username = '';
  @observable
  String password = '';
  @observable
  String confirmPassword = '';
  @observable
  bool loading = false;

  @computed
  bool get canLogin =>
      !userErrorStore.hasErrorsInLogin &&
      tenant.isNotEmpty &&
      username.isNotEmpty &&
      password.isNotEmpty;

  @computed
  bool get canRegister =>
      !userErrorStore.hasErrorsInRegister &&
      tenant.isNotEmpty &&
      username.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty;

  @computed
  bool get canForgetPassword =>
      !userErrorStore.hasErrorInForgotPassword && username.isNotEmpty;

  // actions:-------------------------------------------------------------------
  @action
  Future login(String tenant, String username, String password) async {
    final future = _repository.login(tenant, username, password);
    loginFuture = ObservableFuture(future);
    await future.then((_response) async {
      print(_response.success);

      if ((_response.success ?? false) && _response.result?.tenantId != null) {
        _repository.saveIsLoggedIn(true);
        _repository.saveAuthToken(
          _response.result?.tenantId.toString(),
          _response.result?.accessToken,
          _response.result?.encryptedAccessToken,
          _response.result?.refreshToken,
        );
        this.tenantId = _response.result?.tenantId.toString();
        this.isLoggedIn = true;
        this.success = true;
      } else {
        if (_response.result?.tenantId == null && _response.success == true) {
          this.errorMessage = "شرکت مشخص شده وجود ندارد";
        } else
          this.errorMessage = _response.error?.message;

        this.isLoggedIn = false;
        this.success = false;
        _repository.saveIsLoggedIn(false);
        _repository.removeAuthToken();
      }
    }).catchError((error) {
      // errorStore.errorMessage = DioErrorUtil.handleError(error);
      this.isLoggedIn = false;
      this.success = false;
      errorStore.errorMessage = error.message;
      throw Exception(error.message);
    });
  }

  logout() {
    this.isLoggedIn = false;
    _repository.saveIsLoggedIn(false);
    _repository.removeAuthToken();
  }

  @action
  void setTenant(String value) {
    tenant = value;
  }

  @action
  void setUserId(String value) {
    username = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void setConfirmPassword(String value) {
    confirmPassword = value;
  }

  void validateAll() {
    validatePassword(password);
    validateUsername(username);
  }

  @action
  void validateTenant(String value) {
    if (value.isEmpty) {
      userErrorStore.tenant = "نام شرکت خود را مشخص کنید";
    } else {
      userErrorStore.tenant = null;
    }
  }

  @action
  void validateUsername(String value) {
    if (value.isEmpty) {
      userErrorStore.username = "نام کاربری، ایمیل یا موبایل خود را وارد کنید";
    } else {
      userErrorStore.username = null;
    }
  }

  @action
  void validatePassword(String value) {
    if (value.isEmpty) {
      userErrorStore.password = "رمز عبور را وارد نمایید";
    } else if (value.length < 6) {
      userErrorStore.password = "طول رمز عبور حداقل 6 کاراکتر است";
    } else {
      userErrorStore.password = null;
    }
  }

  @action
  void validateConfirmPassword(String value) {
    if (value.isEmpty) {
      userErrorStore.confirmPassword = "Confirm password can't be empty";
    } else if (value != password) {
      userErrorStore.confirmPassword = "Password doen't match";
    } else {
      userErrorStore.confirmPassword = null;
    }
  }

  @action
  Future register() async {}

  @action
  Future forgotPassword() async {}

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}

class UserErrorStore = _UserErrorStore with _$UserErrorStore;

abstract class _UserErrorStore with Store {
  @observable
  String? tenant;

  String? username;

  @observable
  String? password;

  @observable
  String? confirmPassword;

  @computed
  bool get hasErrorsInLogin =>
      username != null || password != null || tenant != null;

  @computed
  bool get hasErrorsInRegister =>
      username != null ||
      password != null ||
      confirmPassword != null ||
      tenant != null;

  @computed
  bool get hasErrorInForgotPassword => username != null;
}
