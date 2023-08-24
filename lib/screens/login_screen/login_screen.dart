import 'package:flutter/material.dart';
import '../../navigation/app_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Text(AppRouter.getCurrentPath(context)),
            ],
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final nextPath = AppRouter.getCurrentState(context)
                .uri
                .queryParameters["next"] as String;
            AppRouter.go(nextPath);
          },
          child: const Text("Back"),
        ),
      ),
    );
  }
}
