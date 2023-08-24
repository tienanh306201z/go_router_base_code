import 'package:flutter/material.dart';
import '../../navigation/app_route.dart';
import '../../navigation/app_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppRouter.getCurrentPath(context)),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => AppRouter.goNamed(
                AppRoute.home,
              ),
              child: const Text("Home"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => AppRouter.goNamed(
                AppRoute.login,
                queryParameters: {
                  "next": AppRouter.namedLocation(AppRoute.home)
                },
              ),
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
