import 'package:flutter/material.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'dart:io';

class MyTextFormField extends StatefulWidget {
  @override
  _MySpanState createState() => _MySpanState();
}

enum AuthMode { SignUp, Login }

class _MySpanState extends State<MyTextFormField> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  AuthMode _authMode = AuthMode.Login;

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.SignUp;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Text Form Field"),
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: "E-Mail"),
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) {
                        if (val != null) {
                          if (val.isEmpty || !val.contains('@')) {
                            return "Invalid Email";
                          } else {
                            return null;
                          }
                        }
                      },
                      onSaved: (val) {
                        if (val != null) {
                          _authData['email'] = val;
                          print(_authData['email']);
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Password"),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      controller: _passwordController,
                      validator: (val) {
                        if (val != null) {
                          if (val.isEmpty || val.length < 8) {
                            return "Password is too Short";
                          } else {
                            return null;
                          }
                        }
                      },
                      onSaved: (val) {
                        if (val != null) {
                          _authData['password'] = val;
                          print(_authData['password']);
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    if (_authMode == AuthMode.SignUp)
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: "Confirm Password"),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        validator: _authMode == AuthMode.SignUp
                            ? (val) {
                                if (val != null) {
                                  if (val != _passwordController.text) {
                                    return "Password Doesn't Match";
                                  } else {
                                    return null;
                                  }
                                }
                              }
                            : null,
                      ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _summit,
                      child: Text(
                        _authMode == AuthMode.Login ? "Log In" : "Sign Up",
                        style: TextStyle(fontSize: 25),
                      ),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          EdgeInsets.all(15),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                        onPressed: _switchAuthMode,
                        child: Text(_authMode == AuthMode.Login
                            ? "Don't Have Account? SignUp."
                            : "Already Have Account? LogIn."))
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void _summit() {
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      _formKey.currentState!.save();
    }
  }
}
