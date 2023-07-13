import 'package:authorization_test/authorization/models/authorization_data.dart';

abstract class AuthorizationApi {
  Future<AuthorizationData> getTokens({required String email, required String password});
  // Future signIn({required String accesToken});
  Future refreshToken({required String refreshToken});
  Future<bool> signOut();
  Future fetchUserData();
}
