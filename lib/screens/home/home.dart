import 'package:flutter/material.dart';
import 'package:phone_auth/services/auth_services/phone_number.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Login sucessfully'),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () => AuthServices().logout(),
            child: Text('logut'),
          )
        ],
      )),
    );
  }
}
