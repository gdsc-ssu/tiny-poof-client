import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiny_poof/core/routes/app_routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      context.pushReplacementNamed(Routes.initStep1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(),
    );
  }
}
