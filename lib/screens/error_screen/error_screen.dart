import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String errorPath;

  const ErrorScreen({super.key, required this.errorPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('No route defined for $errorPath')),
    );
  }
}
