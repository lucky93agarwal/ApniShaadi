import 'package:apnishaadi/component/GlobalSnackBar.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';


class InternetCheckScreen extends StatelessWidget {
  const InternetCheckScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool check = false;
    var listener = InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
        if(check){
          check = false;
          GlobalSnackBar.showGreen(context, 'Internet connection is available.');
        }

          break;
        case InternetConnectionStatus.disconnected:
          check = true;
          GlobalSnackBar.show(context, 'You are disconnected from the internet.');
          /*ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("You are disconnected from the internet.")));
          print('You are disconnected from the internet.');*/
          break;
      }
    });
    return const SizedBox();
  }
}
