import 'package:flutter/material.dart';
import '../../entity/UserCred.dart';
import './auth_input.dart';

class AuthPage extends StatefulWidget {
    @override
    State<StatefulWidget> createState() {
        return _AuthPageState();
    }
}

class _AuthPageState extends State<AuthPage> {
    final UserCred userCred = new UserCred('', '', false);
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    _buildBackgroundImage() {
        return DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
            image: AssetImage('assets/demo.jpg'),
        );
    }

    Widget _buildEmailTextField() {
        return AuthInput(
            inputValue: userCred.email,
            label: 'E-Mail',
            inputType: TextInputType.emailAddress,
            validator: (String value) {
                if (value.isEmpty) {
                    return 'Field is Required';
                }
            },
            onInputChanged: (String value) {
                userCred.email = value;
            },  
        );
    }

    Widget _buildPasswordTextField() {
        return AuthInput(
            inputValue: userCred.password,
            label: 'Password',
            isObscureText: true,
            validator: (String value) {
                if (value.isEmpty) {
                    return 'Field is Required';
                }
            },
            onInputChanged: (String value) {
                userCred.password = value;
            },
        );
    }

    Widget _buildAcceptSwitch() {
        return SwitchListTile(
            value: userCred.acceptTerms,
            title: Text('Accept Terms'),
            onChanged: (bool value) {
                userCred.acceptTerms = value;
            },
        );
    }

    void _onSubmit() {
        if (_formKey.currentState.validate() && userCred.acceptTerms) {
            Navigator.pushReplacementNamed(context, '/products');
        }
    }

    @override
    Widget build(BuildContext context) {
        final double deviceWidth = MediaQuery.of(context).size.width;
        final double targetWidth = deviceWidth > 768.0 ? 500.0 : deviceWidth * 0.95;

        return Scaffold(
            appBar: AppBar(
                title: Text('Login'),
            ),
            body: Container(
                decoration: BoxDecoration(
                    image: _buildBackgroundImage(),
                ),
                padding: EdgeInsets.all(10.0),
                child: Form(
                    key: _formKey,
                    child: Center(
                        child: SingleChildScrollView(
                            child: Container(
                                width: targetWidth,
                                child: Column(
                                    children: <Widget>[
                                        _buildEmailTextField(),
                                        SizedBox(height: 10.0),
                                        _buildPasswordTextField(),
                                        _buildAcceptSwitch(),
                                        SizedBox(
                                            height: 10.0,
                                        ),
                                        RaisedButton(
                                            color: Theme.of(context).primaryColor,
                                            textColor: Colors.white,
                                            child: Text('LOGIN'),
                                            onPressed: _onSubmit,
                                        ),
                                    ],
                                ),
                            ),
                        ),
                    ),
                ),
            ),
        );
    }
}