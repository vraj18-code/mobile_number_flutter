import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'mobile_number_screen.dart';
import 'wave_painter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Language Selector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LanguageSelectorScreen(),
    );
  }
}

class LanguageSelectorScreen extends StatefulWidget {
  @override
  _LanguageSelectorScreenState createState() => _LanguageSelectorScreenState();
}

class _LanguageSelectorScreenState extends State<LanguageSelectorScreen> {
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200,
              width: double.infinity,
              child: CustomPaint(
                painter: WavePainter(color: Colors.lightBlue,opacity: 0.3, isLeftAligned: true),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 180,
              width: double.infinity,
              child: CustomPaint(
                painter: WavePainter(color: Color(0xFF1D1E33), opacity: 0.6, isLeftAligned: false),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.language, size: 100, color: Colors.black),
                  SizedBox(height: 20),
                  Text(
                    'Please select your Language',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'You can change the language at any time.',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 30),
                  DropdownButton<String>(
                    isExpanded: true,
                    value: _selectedLanguage,
                    items: <String>['English', 'Spanish', 'French', 'German']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedLanguage = newValue!;
                      });
                    },
                    hint: Text('Select Language'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MobileNumberScreen()),
                      );
                    },
                    child: Text('NEXT', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1D1E33),
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
