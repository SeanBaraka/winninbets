class AuthToken {
  final String email, token;

  AuthToken({this.email, this.token});

  factory AuthToken.fromJson(Map<String, dynamic> json) {
    return AuthToken(
      email: json['email'],
      token: json['token']
    );
  }

}