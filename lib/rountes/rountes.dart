import 'package:apnishaadi/model/matches.dart';
import 'package:apnishaadi/screen/OtherProfile/OtherProfileScreen.dart';
import 'package:apnishaadi/screen/ProfileImageZoom/profileImageZoom.dart';
import 'package:apnishaadi/screen/ProfileImageZoom/profile_image_bloc.dart';
import 'package:apnishaadi/screen/home/HomeScreen.dart';
import 'package:apnishaadi/screen/login/LoginScreen.dart';
import 'package:apnishaadi/screen/login/login_bloc.dart';
import 'package:apnishaadi/screen/profileList/ProfileList.dart';
import 'package:apnishaadi/screen/splash/SplashScreen.dart';
import 'package:apnishaadi/screen/splash/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Routes {
  static Route? onGenerateRoute(RouteSettings settings){
    switch(settings.name){

      case "/splash": return MaterialPageRoute(builder: (context) =>BlocProvider(create:(context)=> SplashBloc(),child:const SplashScreen( title: "title",),));
      case "/home": return MaterialPageRoute(builder: (context) => const HomeScreen());

      case "/login": return MaterialPageRoute(builder: (context) => BlocProvider(create: (context)=> LoginBloc(),child: const LoginScreen(),));

      case "/otherProfile": ShaadiItem arguments = settings.arguments as ShaadiItem;
      return MaterialPageRoute(builder: (context) => OptherProfileScreen(item: arguments,));


      case "/allList": List<ShaadiItem> arguments = settings.arguments as List<ShaadiItem>;
      return MaterialPageRoute(builder: (context) => ProfileListScreen(title: "New Matches",item: arguments));

      case "/profileImageZoom": List<String> arguments = settings.arguments as List<String>;
      return MaterialPageRoute(builder: (context) => BlocProvider(create:(context)=>  ProfileImageBloc(),child:ProfileImageZoomScreen(profileImg: arguments)));


     /* case "/welcome": Map<String,dynamic> arguments = settings.arguments as Map<String,dynamic>;
      return MaterialPageRoute(builder: (context) => WelcomeScreen(title: arguments['title'],));

      case "/login": return MaterialPageRoute(builder: (context) => BlocProvider(create:(context)=> SignInBloc(),child:const LoginScreen(),));


      case "/api": return MaterialPageRoute(builder: (context) => const APIScreen());*/
    }
  }
}