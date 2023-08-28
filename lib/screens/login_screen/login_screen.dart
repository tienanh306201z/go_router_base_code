import 'package:flutter/material.dart';
import 'package:go_router_base_code/navigation/app_route.dart';
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
            final nextPath =
                AppRouter.getCurrentState(context).uri.queryParameters["next"];
            nextPath != null
                ? AppRouter.go(nextPath)
                : AppRouter.goNamed(AppRoute.home);
          },
          child: const Text("Back"),
        ),
      ),
    );
  }
}
