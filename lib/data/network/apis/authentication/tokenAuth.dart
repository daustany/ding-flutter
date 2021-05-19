import 'dart:async';

import 'package:ding/data/network/constants/endpoints.dart';
import 'package:ding/data/network/dio_client.dart';
import 'package:ding/models/responsebody_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class TokenAuth {
  // dio instance
  final DioClient _dioClient;
  // rest-client instance

  // injecting dio instance
  TokenAuth(this._dioClient);

  /// Returns list of post in response
  Future<ResponseBodyModel> authenticate(
      String userNameOrEmailAddress, password) async {
    final res = await _dioClient.post(
      Endpoints.authenticate,
      data: {
        "userNameOrEmailAddress": userNameOrEmailAddress,
        "password": password,
      },
      options: Options(
        followRedirects: false,
        validateStatus: (_status) {
          return (_status ?? 0) < 500;
        },
      ),
    );

    return ResponseBodyModel.fromJson(res);
  }
}