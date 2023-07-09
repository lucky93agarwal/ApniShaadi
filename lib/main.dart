import 'package:apnishaadi/rountes/rountes.dart';
import 'package:apnishaadi/screen/NavigationService.dart';
import 'package:apnishaadi/screen/splash/splash_bloc.dart';
import 'package:apnishaadi/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
//
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeModel().lightTheme,
      darkTheme: ThemeModel().lightTheme,
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: "/splash",
    );
  }
}
