import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth/screens/wrapper.dart';
import 'package:phone_auth/services/auth_services/phone_number.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Some thing went worong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider<User>.value(
            value: AuthServices().authChange,
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: Wrapper(),
            ),
          );
        }

        return Text('loading...');
      },
    );
  }
}
