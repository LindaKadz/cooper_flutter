import 'package:flutter/material.dart';
// import 'package:validate/validate.dart';

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

class RegistrationForm extends StatefulWidget {
  @override 
  RegistrationFormState createState() {
    return RegistrationFormState();
      }
    }

class RegistrationFormState extends State <RegistrationForm> {
  final _formKey = GlobalKey<FormState> ();
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
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email'
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please fill this section';
              }
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
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password'
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please fill this section';
              }
            },
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Confirm Password'
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please fill this section';
              }
            },
          ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Creating Profile...')));
                }
              },
              child: Text('Register'),
            ),
          ),
        ],
      ),
    );
  }
}
