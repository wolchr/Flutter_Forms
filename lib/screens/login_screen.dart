import 'package:flutter/material.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey();
  FocusNode formFocusNode;
  String _inputValueEmail;
  String _inputValuePassword;

  @override
  void initState() {
    super.initState();
    formFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    formFocusNode.dispose();
  }

  Future<void> _login() async {
    FocusScope.of(context).requestFocus(new FocusNode());
    try {
      if (!_formKey.currentState.validate()) {
        return;
      }
      _formKey.currentState.validate();
      _formKey.currentState.save();
      print(_inputValueEmail);
      print(_inputValuePassword);
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'What\'s in the box',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 23.0),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 5.0),
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Organize what\'s unorganized',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15.0, letterSpacing: 4.0),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter your email address.',
                      ),
                      validator: (String value) {
                        if (value.isEmpty ||
                            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                .hasMatch(value)) {
                          return 'Please enter a valid email address.';
                        }
                      },
                      onSaved: (String value) {
                        _inputValueEmail = value;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Password with at least 8 characters.',
                      ),
                      validator: (String value) {
                        if (value.isEmpty || value.length <= 8) {
                          return 'Please enter at least 8 characters';
                        }
                      },
                      onSaved: (String value) {
                        _inputValuePassword = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  RaisedButton(
                    onPressed: _login,
                    child: Text('Login'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SignInButton(Buttons.Google, onPressed: () {
                    print('sign in with Google clicked');
                  }),
                  SizedBox(
                    height: 50.0,
                  ),
                  FlatButton(
                      child: Text('Forgot Password?'),
                      onPressed: () {
                        print('Forgot password button clicked');
                      }),
                  FlatButton(
                      child: Text('Create a new account.'),
                      onPressed: () {
                        print('Create new account button clicked');
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
