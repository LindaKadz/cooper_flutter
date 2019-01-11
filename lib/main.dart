import 'package:flutter/material.dart';
import 'package:validate/validate.dart';
// import 'package:dio/dio.dart';
// import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
// import 'dart:io';
// import 'dart:convert';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Cooper';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: RegistrationForm(),    
      ),
    );
  }
}

 class _RegistrationData {
          String name = '';
          String email = '';
          String nickname = '';
          String password = '';
          String confirmPassword = '';
   } 

class RegistrationForm extends StatefulWidget {
  @override 
  RegistrationFormState createState() {
    return RegistrationFormState();
      }
    }

class RegistrationFormState extends State <RegistrationForm> {
  final _formKey = GlobalKey<FormState> ();
  _RegistrationData _data = new _RegistrationData();

  String _validateEmail(String value) {
    try {
      Validate.isEmail(value);
    } catch (e) {
      return 'The E-mail Address must be a valid email address.';
    }

    return null;
  }

  String _validatePassword(String value) {
    if (value.length < 8) {
      return 'The Password must be at least 8 characters.';
    }

    return null;
  }


  void register() async {
    if (this._formKey.currentState.validate()) {
      print("Creating Profile...");

        http.post("http://localhost:3000/api/v1/auth", 
        body: {"name": "Linda", "email": "achielinda44@gmail.com", "nickname": "kadz", "password": "123456789", "confirmPassword": "123456789"})
            .then((response) {
          print("Response status: ${response.statusCode}");
          print("Response body: ${response.body}");
        });

        print("Done!");
    
    }
}

  @override

  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Name'
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please fill this section';
              }
            },
            onSaved: (String value) {
              this._data.name = value;
            },
          ),

          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email'
            ),
            validator: this._validateEmail,
            onSaved: (String value) {
              this._data.email = value;
            },
          ),

          TextFormField(
            decoration: InputDecoration(
              labelText: 'Nickname'
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please fill this section';
              }
            },
            onSaved: (String value) {
              this._data.nickname = value;
            },
          ),

          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password'
            ),
            validator: this._validatePassword,
            onSaved: (String value) {
              this._data.password = value;
            },
          ),

          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Confirm Password'
            ),
            validator: this._validatePassword,
            onSaved: (String value) {
              this._data.confirmPassword = value;
            },
          ),

        Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: this.register,
              child: Text('Register'),
            ),
          ),
        ],
      ),
    );
  }
}
