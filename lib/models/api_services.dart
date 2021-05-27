import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:bookstore/utils/validator.dart';

import 'package:bookstore/config.dart';
import 'package:bookstore/models/customer.dart';

//create a method i.e createCustomer
class APIService {
  Future<bool> createCustomer(CustomerModel model) async {
    //generate auth token on the basis of key and secret key
    var authToken = base64.encode(
      utf8.encode(Config.key + ":" + Config.secret),
    );

//by default this is false (return)
    bool ret = false;

    //try catch method
    try {
      var response = await Dio().post(Config.url + Config.customerurl,
          data: model.tojson(),
          options: new Options(headers: {
            HttpHeaders.authorizationHeader: 'Basic $authToken',
            HttpHeaders.contentTypeHeader: "application/json"
          }));

      //user created succesfully
      if (response.statusCode == 201) {
        ret = true;
      }
    } on DioError catch (e) {
      //user duplicated

      if (e.response.statusCode == 404) {
        ret = false;
      } else {
        ret = false;
      }
    }

    return ret;
  }
}
