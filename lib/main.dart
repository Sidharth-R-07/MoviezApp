import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviez/decorations/mytheme.dart';

import '../pages/home_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moviez',
      darkTheme: MyTheme.darkMode,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightMode,
      home: AnimatedSplashScreen(
          splash: SizedBox(
            
            height: 600,
            width: 400,
            child: Lottie.asset('Assets/lottie/splash lottie.json',fit: BoxFit.cover)),
          duration: 2000,
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.black,
          nextScreen: const HomePage()),
    );
  }
}
