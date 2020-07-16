class User {
  String Firstname,Lastname,Location,Telephone,Email,Password;
  User(String firstname,String lastname, String location, String telephone, String email, String password) {
    this.Firstname = firstname;
    this.Lastname = lastname;
    this.Location = location;
    this.Telephone = telephone;
    this.Email = email;
    this.Password = password;
  }

  Map<String, dynamic> toJson() => {
    'first_name': Firstname,
    'last_name': Lastname,
    'location': Location,
    'telephone': Telephone,
    'email': Email,
    'password': Password
  };
  
}