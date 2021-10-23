import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/src/configs/app_route.dart';
import 'package:flutterapp/src/configs/app_setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isHidden = false;

  var _usernameController = TextEditingController();
  var _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loin'),
      ),
      backgroundColor: Color(0XFFF00c853),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Image.network(
              'https://www.cmneuro.go.th/meeting/doc_cmneuro/images/login.png',
              width: 100,
              height: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Colors.black, fontSize: 30, fontFamily: 'Pacifico'),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _usernameController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'username',
                        hintText: 'xx@gmail.com',
                        icon: Icon(Icons.person)),
                  ),
                  TextField(
                    controller: _passwordController,
                    obscureText: isHidden,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'password',
                      icon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                          icon: isHidden
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: togglePasswordVisibility),
                    ),
                  ),
                  RaisedButton(
                      onPressed: () async {
                        final username = _usernameController.text;
                        final password = _passwordController.text;
                        if (username == 'u1' && password == 'p1') {
                          print('login success');
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setString(AppSetting.userNameSettiing, username);
                          prefs.setString(AppSetting.passwordSetting, password);
                          Navigator.pushNamed(context, AppRoute.homeRoute);
                        } else {
                          print('login failed');
                          Flushbar(
                            flushbarPosition: FlushbarPosition.TOP,
                            icon: Icon(
                              Icons.cancel,
                              color: Colors.greenAccent,
                            ),
                            backgroundColor: Colors.pink,
                            title:  "Failed",
                            message:  "Login failed try again!",
                            duration:  Duration(seconds: 3),
                          )..show(context);
                        }
                      },
                      child: Text('Login')),
                  //ElevatedButton(onPressed: (){}, child: Text('Login')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void togglePasswordVisibility() => setState(() => isHidden = !isHidden);
}
