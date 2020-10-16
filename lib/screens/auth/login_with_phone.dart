import 'package:flutter/material.dart';
import 'package:phone_auth/services/auth_services/phone_number.dart';

class PhoneNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController phoneNumber = TextEditingController();
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
              controller: phoneNumber,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Phone Number',
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
              child: Text("Continue"),
              onPressed: () async {
                await AuthServices()
                    .continueWithPhoneNumber(phoneNumber.text.trim(),context);
              },
            ),
          )
        ],
      )),
    );
  }
}
