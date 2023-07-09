import 'package:apnishaadi/screen/internetCheck/internetCheck.dart';
import 'package:apnishaadi/screen/splash/splash_bloc.dart';
import 'package:apnishaadi/screen/splash/splash_event.dart';
import 'package:apnishaadi/screen/splash/splash_state.dart';
import 'package:apnishaadi/utils/config.dart';
import 'package:apnishaadi/utils/next_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  final String title;

  const SplashScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  late SplashBloc profileBloc;

  @override
  void didChangeDependencies() {
    profileBloc = BlocProvider.of<SplashBloc>(context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    context.read<SplashBloc>().add(CheckTimingEvent());

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocConsumer<SplashBloc, SplashState>(
        builder: (context, s) {
          return Stack(
            children: [
              const InternetCheckScreen(),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      Config.appName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
              Positioned(
                bottom: 50,
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text("Copyright Ⓒ 2023 ApniShaadi.com",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 10,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Version 0.0.1",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 10,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ))
            ],
          );
        },
        listener: (context, status) {
          if (status is SplashFalseState) {
            if (kDebugMode) {
              print("change 789 = " + status.toString());
            }
          } else if (status is SplashTrueState) {
            nextNameScreen(context, "/login", null);
            /*if (kDebugMode) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Bloc is working")));

            }*/
          }
        },
      ),
    );
  }
}
