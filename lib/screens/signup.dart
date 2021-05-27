import 'package:bookstore/constants.dart';
import 'package:bookstore/default_button.dart';
import 'package:bookstore/models/api_services.dart';
import 'package:bookstore/models/customer.dart';
import 'package:bookstore/screens/home/components/home_screen.dart';
import 'package:bookstore/utils/ProgressHUD.dart';
import 'package:bookstore/utils/formhelper.dart';
import 'package:flutter/material.dart';

import 'package:bookstore/utils/validator.dart';

class SignupPage extends StatefulWidget {
  static String routeName = "signup";
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  APIService apiService;
  CustomerModel model;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool hidePassword = true;
  bool isApiCallProcess = false;

  @override
  void initState() {
    apiService = new APIService();
    model = new CustomerModel();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        automaticallyImplyLeading: true,
        title: Text("Good Health Sign Up"),
      ),
      body: ProgressHUD(
        child: new Form(
          key: globalKey,
          child: _formUI(),
        ),
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
      ),
    );
  }

  Widget _formUI() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHelper.fieldLabel("First Name"),
                FormHelper.textInput(
                    context,
                    model.firstname,
                    (value) => {
                          this.model.firstname = value,
                        }, onValidate: (value) {
                  if (value.toString().isEmpty) {
                    return ' Please enter First Name';
                  }
                  return null;
                }),
                FormHelper.fieldLabel("Last Name"),
                FormHelper.textInput(
                    context,
                    model.lastname,
                    (value) => {
                          this.model.lastname = value,
                        }, onValidate: (value) {
                  if (value.toString().isEmpty) {
                    return 'Please enter last name';
                  }
                  return null;
                }),
                FormHelper.fieldLabel("Email ID"),
                FormHelper.textInput(
                  (context),
                  model.email,
                  (value) => {
                    this.model.email = value,
                  },
                  onValidate: (value) {
                    if (value.toString().isEmpty) {
                      return ' Please enter Email ID';
                    }
                    if (value.isNotEmpty && !value.toString().isValidEmail()) {
                      return 'Please enter valid email id';
                    }
                    return null;
                  },
                ),
                FormHelper.fieldLabel("Password"),
                FormHelper.textInput(
                  context,
                  model.password,
                  (value) => {
                    this.model.password = value,
                  },
                  onValidate: (value) {
                    if (value.toString().isEmpty) {
                      return ' Please enter Password';
                    }
                    return null;
                  },
                  obscureText: hidePassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    color: Theme.of(context).accentColor.withOpacity(0.4),
                    icon: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                new Center(
                  child: FormHelper.saveButton(
                    "Register",
                    () {
                      if (validateAndSave()) {
                        print(model.tojson());
                        setState(() {
                          isApiCallProcess = true;
                        });

                        apiService.createCustomer(model).then(
                          (ret) {
                            setState(() {
                              isApiCallProcess = false;
                            });
                            if (ret) {
                              FormHelper.showMessage(
                                context,
                                "GoodHealth",
                                "Register Sucessful",
                                "OK",
                                () {
                                  Navigator.of(context).pop();
                                },
                              );
                            } else {
                              FormHelper.showMessage(
                                context,
                                "GoodHealth",
                                "Email ID already Registered",
                                "OK",
                                () {
                                  Navigator.pushNamed(
                                      context, HomeScreen.routename);
                                },
                              );
                            }
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
