import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiny_poof/core/factory/shared_preference_factory.dart';
import 'package:tiny_poof/core/routes/app_routes.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tiny_poof/screens/main/camera/camera_view_model.dart';
import 'package:tiny_poof/screens/main/diary/diary_view_model.dart';
import 'package:tiny_poof/screens/main/home/home_view_controller.dart';
import 'package:tiny_poof/screens/main/main_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();

  await SharedPreferenceFactory.init();
  if (SharedPreferenceFactory.getUserData() != null) {}

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CameraViewModel()),
      ChangeNotifierProvider(create: (_) => DiaryViewModel()),
      ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ChangeNotifierProvider(create: (_) => MainViewModel()),
    ],
    child: const MyApp(),
  ));
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
