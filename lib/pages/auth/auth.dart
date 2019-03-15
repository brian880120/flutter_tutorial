import 'package:flutter/material.dart';
import '../../entity/UserCred.dart';

class AuthPage extends StatefulWidget {
    @override
    State<StatefulWidget> createState() {
        return _AuthPageState();
    }
}

class _AuthPageState extends State<AuthPage> {
    final UserCred userCred = new UserCred('', '', false);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Login'),
            ),
            body: ListView(
                children: <Widget>[
                    TextField(
                        controller: TextEditingController(
                            text: userCred.email
                        ),
                        decoration: InputDecoration(
                            labelText: 'E-Mail',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (String value) {
                            userCred.email = value;
                        },
                    ),
                    TextField(
                        controller: TextEditingController(
                            text: userCred.password
                        ),
                        decoration: InputDecoration(
                            labelText: 'Password',
                        ),
                        obscureText: true,
                        onChanged: (String value) {
                            userCred.password = value;
                        },
                    ),
                    SwitchListTile(
                        value: userCred.acceptTerms,
                        title: Text('Accept Terms'),
                        onChanged: (bool value) {
                            userCred.acceptTerms = value;
                        },
                    ),
                    SizedBox(
                        height: 10.0,
                    ),
                    RaisedButton(
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: Text('LOGIN'),
                        onPressed: () {
                            Navigator.pushReplacementNamed(context, '/products');
                        },
                    ),
                ],
            ),
        );
    }
}