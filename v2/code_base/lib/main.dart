import 'package:code_base/data/service_locator.dart';
import 'package:code_base/utils/other/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // * Init environment variables
  await dotenv.load(fileName: ".env");

  //* Config Dependency Injection
  configureDependencies();

  //* Config App
  await AppConfig.initialize();


  
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'Flutter BLoC + Dio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
