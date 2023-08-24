import 'package:flutter/material.dart';
import 'package:go_router_base_code/navigation/app_route.dart';
import 'package:go_router_base_code/navigation/app_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          onPressed: () => AppRouter.goNamed(
            AppRoute.setting,
            pathParameters: {"name": "Alva Tran"},
          ),
          child: const Text("Settings"),
        ),
      ),
    );
  }
}
