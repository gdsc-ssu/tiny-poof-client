import 'package:flutter/material.dart';
import 'package:tiny_poof/core/factory/shared_preference_factory.dart';
import 'package:tiny_poof/core/routes/app_routes.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();

  await SharedPreferenceFactory.init();
  if (SharedPreferenceFactory.getUserData() != null) {}

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tiny Poof',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: routerConfig,
    );
  }
}
