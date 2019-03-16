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
            body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
                        image: AssetImage('assets/demo.jpg'),
                    )
                ),
                padding: EdgeInsets.all(10.0),
                child: Center(
                    child: SingleChildScrollView(
                        child: Column(
                            children: <Widget>[
                                TextField(
                                    controller: TextEditingController(
                                        text: userCred.email
                                    ),
                                    decoration: InputDecoration(
                                        labelText: 'E-Mail',
                                        filled: true,
                                        fillColor: Colors.white,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: (String value) {
                                        userCred.email = value;
                                    },
                                ),
                                SizedBox(height: 10.0),
                                TextField(
                                    controller: TextEditingController(
                                        text: userCred.password
                                    ),
                                    decoration: InputDecoration(
                                        labelText: 'Password',
                                        filled: true,
                                        fillColor: Colors.white,
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
                    ),
                ),
            ),
        );
    }
}