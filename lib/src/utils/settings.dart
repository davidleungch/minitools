import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Settings'),
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close '))
          ],
        ),
      ),
    );
  }
}
