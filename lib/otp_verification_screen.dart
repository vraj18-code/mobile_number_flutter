import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'profile_selection_screen.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String verificationId;

  OTPVerificationScreen({required this.verificationId});

  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Phone'),
        backgroundColor: Color(0xFF1D1E33),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'OTP',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF1D1E33),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              onPressed: () async {
                try {
                  print('Attempting to verify OTP: ${_otpController.text}');
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: widget.verificationId,
                    smsCode: _otpController.text,
                  );

                  await FirebaseAuth.instance.signInWithCredential(credential);
                  print('OTP verification successful');
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileSelectionScreen()),
                  );
                } catch (e) {
                  print('Failed to sign in: $e');
                }
              },


              child: Text('VERIFY AND CONTINUE', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
