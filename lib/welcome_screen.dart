import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/computadoras');
          },
          child: Text('Bienvenido, ver computadoras'),
        ),
      ),
    );
  }
}
