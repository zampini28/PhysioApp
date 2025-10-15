import 'package:flutter/material.dart';
import 'package:physioapp/navigation/app_navigator.dart';
import 'package:physioapp/routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Page'),
            const SizedBox(height: 5),
            TextButton(
              onPressed: () => AppNavigator.pushReplacementNamed(Routes.login),
              child: const Text('Go to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
