import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = 'register_screen';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> _formKey = GlobalKey();
  FocusNode formFocusNode;
  String _inputValueUsername;
  String _inputValueEmail;
  String _inputValuePassword;
  String _inputValueConfirmPassword;
  TextEditingController _passwordTextController = TextEditingController();

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

  Future<void> _register() async {
    FocusScope.of(context).requestFocus(new FocusNode());
    try {
      if (!_formKey.currentState.validate()) {
        return;
      }
      _formKey.currentState.validate();
      _formKey.currentState.save();
      print(_inputValueUsername);
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
                    'Create a new account',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 23.0),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                        hintText: 'Enter at least 5 characters.',
                      ),
                      validator: (String value) {
                        if (value.isEmpty || value.length < 5) {
                          return 'Please enter at least 5 characters';
                        }
                      },
                      onSaved: (String value) {
                        _inputValueUsername = value;
                      },
                    ),
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
                      controller: _passwordTextController,
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
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirm Password',
                        hintText: 'Confirm your password.',
                      ),
                      validator: (String value) {
                        if (value.isEmpty ||
                            _passwordTextController.text != value) {
                          return 'Passwords do not match!';
                        }
                      },
                      onSaved: (String value) {
                        _inputValueConfirmPassword = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  RaisedButton(
                    onPressed: _register,
                    child: Text('Register'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  FlatButton(
                      child: Text('I already have an account'),
                      onPressed: () {
                        print('Already have an account button clicked');
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
