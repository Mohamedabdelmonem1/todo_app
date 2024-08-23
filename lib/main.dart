import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_route/core/my_theme_data.dart';
import 'package:todo_app_route/firebase_options.dart';
import 'package:todo_app_route/views/home_layout.dart';
import 'package:todo_app_route/views/login/login_view.dart';
import 'package:todo_app_route/views/register/register_view.dart';
import 'package:todo_app_route/views/splash/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      themeMode: ThemeMode.light,
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        LoginView.routeName: (context) => LoginView(),
        RegisterView.routeName: (context) => RegisterView(),
        HomeLayout.routeName: (context) => const HomeLayout(),
      },
      initialRoute: SplashView.routeName,
    );
  }
}
