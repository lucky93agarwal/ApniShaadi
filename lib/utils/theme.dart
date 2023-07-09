
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:apnishaadi/utils/color.dart';
import 'package:apnishaadi/utils/config.dart';

class ThemeModel {
  final lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: Colors.pink,
    primaryColor: Config().appThemeColor,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    shadowColor: Colors.grey[200],
    brightness: Brightness.light,
    fontFamily: 'Manrope',
    colorScheme: ColorScheme.light(
        primary: Colors.black,
        //text
        secondary: Colors.grey[700]!,
        //text
        onPrimary: Colors.white,
        //card -1
        onSecondary: Colors.grey[100]!,
        //card color -4
        surface: Colors.grey[300]!,
        //shadow color -1
        onBackground: Colors.grey[300]! //loading card color
    ),
    dividerColor: Colors.grey[300],
    iconTheme: IconThemeData(color: Colors.grey[900]),
    primaryIconTheme: IconThemeData(
      color: Colors.grey[900],
    ),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
          fontFamily: 'Nexa',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.7,
          color: Colors.grey[900]),
      iconTheme: IconThemeData(color: Colors.grey[900]),
      actionsIconTheme: IconThemeData(color: Colors.grey[900]),
      centerTitle: false,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Config().appThemeColor,
      unselectedItemColor: Colors.blueGrey[200],
    ),
    popupMenuTheme: PopupMenuThemeData(
      textStyle: TextStyle(
          fontFamily: 'Manrope',
          color: Colors.grey[900],
          fontWeight: FontWeight.w500),
    ),
    textTheme: TextTheme(
      displayLarge: const TextStyle(color: Color(0xffafb0bc), fontSize: 13,letterSpacing: 1.0, fontWeight: FontWeight.w900,),
      displayMedium: const TextStyle(color: Color(0xff323042), fontWeight: FontWeight.w900, fontSize: 25,),
      displaySmall: TextStyle(color: kTextColor, fontSize: 18,fontFamily: "Raleway",fontWeight: FontWeight.w900),
      headlineMedium: const TextStyle(color: Color(0xff323142), fontWeight: FontWeight.w900, fontSize: 14,),
      headlineSmall: const TextStyle(color: Colors.black38, fontSize: 13, fontWeight: FontWeight.normal),
      titleLarge: const TextStyle(color: Colors.lightBlue, fontSize: 15,),
      titleMedium: const TextStyle(color: Color(0xff202e55), fontSize: 14,letterSpacing: 0.5, fontWeight: FontWeight.w600,),
      titleSmall: TextStyle(color: kTextColor, fontSize: 18,fontFamily: "Raleway",fontWeight: FontWeight.w900),
      bodyLarge: const TextStyle(color: Color(0xff202e55), fontSize: 18,),
      bodyMedium: const TextStyle(color: Color(0xffe2e2e2), fontSize: 13, fontWeight: FontWeight.w900,),
      bodySmall: TextStyle(color: kTextColor, fontSize: 13, fontWeight: FontWeight.normal),
      labelLarge:  TextStyle(fontSize: 13.3, color: kWhiteColor,),
      labelMedium: TextStyle(fontSize: 13.3, color: kWhiteColor),
      labelSmall:TextStyle(fontSize: 13.3, color: kWhiteColor),
    ),
    cardTheme: const CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2)),
        ),
        color: Colors.white),
  );

  final darkTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: Colors.pink,
    primaryColor: Config().appThemeColor,
    backgroundColor: const Color(0xff16161e),
    scaffoldBackgroundColor: const Color(0xff0d0d11),
    shadowColor: Colors.grey[850],
    brightness: Brightness.dark,
    fontFamily: 'Manrope',
    colorScheme: ColorScheme.dark(
        primary: Colors.white,
        //text
        secondary: Colors.grey[400]!,
        //text
        onPrimary: Colors.grey[800]!,
        //card color -1
        onSecondary: Colors.grey[800]!,
        //card color -4
        surface: const Color(0xff303030),
        //shadow color - 1
        onBackground: Colors.grey[800]! //loading card color

    ),
    dividerColor: Colors.grey[300],
    iconTheme: const IconThemeData(color: Colors.white),
    primaryIconTheme: const IconThemeData(
      color: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
        color: Color(0xff0d0d11),
        elevation: 0,
        titleTextStyle: TextStyle(
            fontFamily: 'Nexa',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.7,
            color: Colors.white),
        iconTheme: IconThemeData(color: Colors.white),
        actionsIconTheme: IconThemeData(color: Colors.white),
        centerTitle: false,
        systemOverlayStyle: SystemUiOverlayStyle.light),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey[800],
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey[500],
    ),
    popupMenuTheme: const PopupMenuThemeData(
      textStyle: TextStyle(
          fontFamily: 'Nexa',
          color: Colors.white,
          fontWeight: FontWeight.w500),
    ),
    textTheme: TextTheme(
      displayLarge: const TextStyle(color: Color(0xffafb0bc), fontSize: 13,letterSpacing: 1.0, fontWeight: FontWeight.w900,),
      displayMedium: const TextStyle(color: Color(0xff323042), fontWeight: FontWeight.w900, fontSize: 25,),
      displaySmall: TextStyle(color: kTextColor, fontSize: 18,fontFamily: "Raleway",fontWeight: FontWeight.w900),
      headlineMedium: const TextStyle(color: Color(0xff323142), fontWeight: FontWeight.w900, fontSize: 14,),
      headlineSmall: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold,),
      titleLarge: const TextStyle(color: Colors.lightBlue, fontSize: 15,),
      titleMedium: const TextStyle(color: Color(0xff202e55), fontSize: 14,letterSpacing: 0.5, fontWeight: FontWeight.w600,),
      titleSmall: TextStyle(color: kTextColor, fontSize: 18),
      bodyLarge: const TextStyle(color: Color(0xff202e55), fontSize: 18,),
      bodyMedium: const TextStyle(color: Color(0xffe2e2e2), fontSize: 13, fontWeight: FontWeight.w900,),
      bodySmall: TextStyle(color: kTextColor, fontSize: 13, fontWeight: FontWeight.normal),
      labelLarge:  TextStyle(fontSize: 13.3, color: kWhiteColor,),
      labelMedium: TextStyle(fontSize: 13.3, color: kWhiteColor),
      labelSmall:TextStyle(fontSize: 13.3, color: kWhiteColor),
    ),
    cardTheme: CardTheme(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
      color: Colors.grey[800],
    ),
  );

//text style of continue bottom bar
  final TextStyle bottomBarTextStyle = TextStyle(
      fontSize: 15.0,
      color: kWhiteColor,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans');
}