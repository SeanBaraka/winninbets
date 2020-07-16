class UserLogin {
  String email;
  String password;

  UserLogin(String email, String password){
    this.email = email;
    this.password = password;
  }

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password
  };
}