import 'package:flutter/material.dart';
import 'package:movies/core/components/constants.dart';
import 'package:movies/core/services/services_locator.dart';
import 'package:movies/core/utils/app_string.dart';

import 'movies/presentation/screens/movies_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      home: const MoviesScreen(),
    );
  }
}
