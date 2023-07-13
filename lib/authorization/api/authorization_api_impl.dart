import 'dart:convert';

import 'package:authorization_test/authorization/api/authorization_api.dart';
import 'package:authorization_test/authorization/models/authorization_data.dart';
import 'package:authorization_test/constants/app_keys.dart';
import 'package:authorization_test/method/show_modal_popup.dart';
import 'package:http/http.dart' as http;

class AuthorizationApiImpl extends AuthorizationApi {
  @override
  Future<AuthorizationData> getTokens({required String email, required String password}) async {
    try {
      final response = await http.post(
        Uri.parse('http://45.10.110.181:8080/api/v1/auth/login'),
        body: {
          "email": email,
          "password": password,
        },
      );

      final AuthorizationData authorizationData =
          AuthorizationData.fromJson(json.decode(response.body));
      return authorizationData;
    } catch (e) {
      showDialog("Errore: ${e.toString()}", AppKeys.authorizationStateKey);
      throw Exception(e);
    }
  }

  // @override
  // Future signIn({required String accessToken}) async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse('http://45.10.110.181:8080/api/v1/auth/login/profile'),
  //       headers: {
  //         "accessToken": accessToken,
  //       },
  //     );
  //     print(response);
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  @override
  Future fetchUserData() {
    // TODO: implement fetchUserData
    throw UnimplementedError();
  }

  @override
  Future refreshToken({required String refreshToken}) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future<bool> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
