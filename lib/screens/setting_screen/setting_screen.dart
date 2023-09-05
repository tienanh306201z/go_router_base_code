import 'package:flutter/material.dart';
import 'package:go_router_base_code/navigation/app_route.dart';
import 'package:go_router_base_code/navigation/app_router.dart';

class SettingScreen extends StatelessWidget {
  final String name;

  const SettingScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Text(AppRouter.getCurrentPath(context)),
              ],
            ),
          ),
          automaticallyImplyLeading: true,
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () => AppRouter.goNamed(
                    AppRoute.login,
                    queryParameters: {
                      "next": AppRouter.getCurrentState(context).uri.toString(),
                    },
                  ),
              child: Text(name)),
        ),
      ),
    );
  }
}
