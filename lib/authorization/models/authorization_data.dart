import 'package:authorization_test/authorization/models/tokens_model.dart';
import 'package:authorization_test/authorization/models/user_model.dart';

class AuthorizationData {
  final TokensModel tokens;
  final UserModel user;

  AuthorizationData({
    required this.tokens,
    required this.user,
  });

  factory AuthorizationData.fromJson(Map<String, dynamic> json) => AuthorizationData(
        tokens: TokensModel.fromJson(json["tokens"]),
        user: UserModel.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "tokens": tokens.toJson(),
        "user": user.toJson(),
      };
}
