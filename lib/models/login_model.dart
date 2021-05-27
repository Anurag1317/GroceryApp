class LoginResponseModel {
  bool success;
  int statuscode;
  String code;
  String message;
  Data data;
}

class Data {
  String token;
  int id;
  String email;
  String username;
  String firstname;
  String lastname;
  String displayName;

  Data(
      {this.token,
      this.id,
      this.email,
      this.username,
      this.firstname,
      this.lastname,
      this.displayName});
  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    id = json['id'];
    email = json['email'];
    username = json['username'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    displayName = json['displayname'];
  }
}
