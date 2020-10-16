import 'package:flutter/material.dart';
import 'package:phone_auth/services/auth_services/phone_number.dart';

class OtpPage extends StatelessWidget {
  final String verificationId;
  final String phoneNumber;

  const OtpPage({Key key, this.verificationId, this.phoneNumber})
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    TextEditingController otp = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Phone Number',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 45),
          Container(
            padding: EdgeInsets.all(15),
            color: Colors.white,
            width: 360,
            child: TextFormField(
              controller: otp,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter OTP',
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 50,
            width: 160,
            child: FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text("Submit"),
              onPressed: () async {
                await AuthServices().conformPhoneNumber(
                    verificationId, otp.text.trim(), context);
                Navigator.pop(context);
              },
            ),
          )
        ],
      )),
    );
  }
}
