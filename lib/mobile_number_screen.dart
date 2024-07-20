import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'otp_verification_screen.dart';

class MobileNumberScreen extends StatefulWidget {
  @override
  _MobileNumberScreenState createState() => _MobileNumberScreenState();
}

class _MobileNumberScreenState extends State<MobileNumberScreen> {
  final _phoneController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Please enter your mobile number'),
        backgroundColor: Color(0xFF1D1E33),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefixText: '+91 ',
                labelText: 'Mobile Number',
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
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: '+91${_phoneController.text}',
                    verificationCompleted: (PhoneAuthCredential credential) async {
                      await FirebaseAuth.instance.signInWithCredential(credential);
                    },
                    verificationFailed: (FirebaseAuthException e) {
                      print('Verification failed: ${e.message}');
                      if (e.code == 'invalid-phone-number') {
                        print('The provided phone number is not valid.');
                      } else if (e.code == 'reCAPTCHA-check-failed') {
                        print('reCAPTCHA check failed.');
                      } else {
                        print('Phone verification failed: ${e.code}');
                      }
                    },
                    codeSent: (String verificationId, int? resendToken) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OTPVerificationScreen(verificationId: verificationId),
                        ),
                      );
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                } catch (e) {
                  print('Failed to Verify Phone Number: $e');
                }
              },

              child: Text('CONTINUE', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
