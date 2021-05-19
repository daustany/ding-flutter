import 'package:ding/models/responsebody_model.dart';
import 'package:ding/stores/error/error_store.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../data/repository.dart';
import '../form/form_store.dart';

part 'user_store.g.dart';

@Injectable()
class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  // repository instance
  final Repository _repository;

  // store for handling form errors
  final FormErrorStore formErrorStore = FormErrorStore();

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  // bool to check if current user is logged in
  bool isLoggedIn = false;

  // constructor:---------------------------------------------------------------
  _UserStore(Repository repository) : this._repository = repository {
    // setting up disposers
    _setupDisposers();

    // checking if user is logged in
    repository.isLoggedIn.then((value) {
      this.isLoggedIn = value;
    });
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupDisposers() {
    _disposers = [
      reaction((_) => success, (_) => success = false, delay: 200),
    ];
  }

  // empty responses:-----------------------------------------------------------
  static ObservableFuture<ResponseBodyModel> emptyLoginResponse =
      ObservableFuture.value(new ResponseBodyModel());

  // store variables:-----------------------------------------------------------
  @observable
  bool success = false;

  @observable
  String? errorMessage = "";

  @observable
  ObservableFuture<ResponseBodyModel> loginFuture = emptyLoginResponse;

  @computed
  bool get isLoading => loginFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------
  @action
  Future login(String email, String password) async {
    final future = _repository.login(email, password);
    loginFuture = ObservableFuture(future);

    await future.then((_response) async {
      if ((_response.success ?? false)) {
        _repository.saveIsLoggedIn(true);

        _repository.saveAuthToken(
          _response.result?.accessToken,
          _response.result?.encryptedAccessToken,
          _response.result?.refreshToken,
        );

        this.isLoggedIn = true;
        this.success = true;
      } else {
        this.isLoggedIn = false;
        this.success = false;
        this.errorMessage = _response.error?.message;
        _repository.saveIsLoggedIn(false);
        _repository.removeAuthToken();
      }
    });

    // loginFuture = ObservableFuture(future);
    // await future.then((value) async {
    //   if (value) {
    //     _repository.saveIsLoggedIn(true);
    //     this.isLoggedIn = true;
    //     this.success = true;
    //   } else {
    //     print('failed to login');
    //   }
    // }).catchError((e) {
    //   print(e);
    //   this.isLoggedIn = false;
    //   this.success = false;
    //   throw e;
    // });
  }

  logout() {
    this.isLoggedIn = false;
    _repository.saveIsLoggedIn(false);
    _repository.removeAuthToken();
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
