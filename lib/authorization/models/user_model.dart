class UserModel {
  final int id;
  final String email;
  final String nickname;

  UserModel({
    required this.id,
    required this.email,
    required this.nickname,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        nickname: json["nickname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "nickname": nickname,
      };
}
