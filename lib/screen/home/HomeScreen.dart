import 'dart:io';

import 'package:apnishaadi/component/GlobalSnackBar.dart';
import 'package:apnishaadi/component/ads.dart';
import 'package:apnishaadi/component/matchescomp.dart';
import 'package:apnishaadi/component/option_settings.dart';
import 'package:apnishaadi/component/versioncomp.dart';
import 'package:apnishaadi/model/matches.dart';
import 'package:apnishaadi/utils/config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:apnishaadi/component/download.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ShaadiItem> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items.addAll(ShaadiMatchDataModel.categoryitems);

  }
  late DateTime currentBackPressTime;
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      GlobalSnackBar.showGreen(context, 'Press Back again to exit.');
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title:const Text(
            Config.appName,
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.w900),
          ),
          automaticallyImplyLeading: false,
          actions: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                children: [
                  const Icon(
                    Icons.notification_important_outlined,
                    color: Colors.black,
                  ),
                  Container(
                    width: 7,
                    height: 7,
                    margin: const EdgeInsets.only(left: 15),
                    decoration: const BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                  ),
                ],
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Container(
            width: size.width,
            height: size.height,
            color: const Color(0xFFE3F2FD),
            child: ListView(
              children: [
                // profile
                Container(
                    width: size.width,
                    height: 160,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/menimg.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          color: Color(0x80000000),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    AssetImage('assets/images/menimg.jpg'),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 20, top: 20, bottom: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Lucky Agarwal",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "SH37238825",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          height: 15,
                                          width: 2,
                                          color: Colors.blueAccent,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          "Edit Profile",
                                          style: TextStyle(
                                              color: Colors.lightBlueAccent,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const Text(
                                      "Account - Platinum Plus",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const Text(
                                      "Expiry - 24-Aug-23",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),

                // Download
                DownloadComp(size: size),

                // ads
                AdsComp(size: size),

                // Premium Matches
                MatchesComp(
                  size: size,
                  items: items,
                  details: "Recently upgraded Premium members",
                  title: "Premium Matches",
                  count: "1407",
                ),

                // New Matches
                MatchesComp(
                  size: size,
                  items: items,
                  details: "Members who joined recently",
                  title: "New Matches",
                  count: "371",
                ),

                // Recent Visitors
                MatchesComp(
                  size: size,
                  items: items,
                  details: "Members who visited your Profile",
                  title: "Recent Visitors",
                  count: "60",
                ),

                // Options & Settings
                OptionSettingsComp(size: size),

                // version
                const VersionComp()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
