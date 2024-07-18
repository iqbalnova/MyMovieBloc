import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mymoviebloc/config/dio_config.dart';
import 'package:mymoviebloc/routes/app_routes.dart';
import 'package:mymoviebloc/utils/credential.dart';
import 'package:mymoviebloc/utils/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final storage = GetIt.instance<ApiClient>().storage;

  @override
  void initState() {
    checkLoginStatus();
    super.initState();
  }

  Future<void> checkLoginStatus() async {
    await storage.write(key: 'token', value: Credential.accessToken);

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.main);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              Images.splashLogo,
              width: 200,
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}
