class TokensModel {
  final String accessToken;
  final String refreshToken;

  TokensModel({
    required this.accessToken,
    required this.refreshToken,
  });

  factory TokensModel.fromJson(Map<String, dynamic> json) => TokensModel(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}
