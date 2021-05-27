
import 'package:bookstore/utils/validator.dart';
class CustomerModel {
  String email;
  String firstname;
  String lastname;
  String password;

  CustomerModel({
    this.email,
    this.firstname,
    this.lastname,
    this.password,
  });

  Map<String, dynamic> tojson() {
    Map<String, dynamic> map = {};

    map.addAll({
      'email': email,
      'first_name': firstname,
      'last_name': lastname,
      'password': password,
      'username': email,
    });
    return map;
  }
}
