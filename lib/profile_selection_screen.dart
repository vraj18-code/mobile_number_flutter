import 'package:flutter/material.dart';

class ProfileSelectionScreen extends StatefulWidget {
  @override
  _ProfileSelectionScreenState createState() => _ProfileSelectionScreenState();
}

class _ProfileSelectionScreenState extends State<ProfileSelectionScreen> {
  String? _selectedProfile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Please select your profile'),
        backgroundColor: Color(0xFF1D1E33),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            RadioListTile(
              title: Text('Shipper'),
              value: 'shipper',
              groupValue: _selectedProfile,
              onChanged: (String? value) {
                setState(() {
                  _selectedProfile = value;
                });
              },
            ),
            RadioListTile(
              title: Text('Transporter'),
              value: 'transporter',
              groupValue: _selectedProfile,
              onChanged: (String? value) {
                setState(() {
                  _selectedProfile = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF1D1E33),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              onPressed: () {
                // Handle profile selection
              },
              child: Text('CONTINUE', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
