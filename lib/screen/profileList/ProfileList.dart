import 'package:apnishaadi/model/matches.dart';
import 'package:apnishaadi/utils/color.dart';
import 'package:apnishaadi/utils/next_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileListScreen extends StatefulWidget {
  const ProfileListScreen({Key? key, required this.title, required this.item})
      : super(key: key);
  final String title;
  final List<ShaadiItem> item;

  @override
  State<ProfileListScreen> createState() => _ProfileListScreenState();
}

class _ProfileListScreenState extends State<ProfileListScreen> {
  @override
  Widget build(BuildContext context) {
    final Color background = Color(0x70000000);
    final Color fill = Color(0x05000000);

    final Color green = Color(0x9087c86c);
    final Color blue = Color(0x9029bdc6);

    final List<Color> gradient = [
      fill,
      background,
      background,
      background,
    ];

    final List<Color> gradientBottom = [
      green,
      green,
      blue,
      blue,
    ];
    final double fillPercent = 56.23; // fills 56.23% for container from bottom
    final double fillStop = (100 - fillPercent) / 100;
    final List<double> stops = [0.0, fillStop, fillStop, 1.0];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xfffcfcfc),
      appBar: AppBar(
        backgroundColor: const Color(0xfffd5a64),
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(widget.title),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
      ),
      body: Container(
        color: const Color(0xFFE3F2FD),
        width: size.width,
        height: size.height,
        child: ListView.builder(
            itemCount: widget.item.length,
            itemBuilder: (context, index) {
              dynamic itemsnew = widget.item[index];
              return InkWell(
                onTap: () {
                  nextNameScreen(context, "/otherProfile", itemsnew);
                },
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: itemsnew.profileImg[0].toString(),
                      imageBuilder: (context, imageProvider) => Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        padding: const EdgeInsets.all(5),
                        width: size.width,
                        height: size.height * 0.6,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.26),
                              blurRadius: 12.0,
                              offset: Offset(2, 2),
                            ),
                          ],
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Container(
                        alignment: Alignment.center,
                        width: size.width,
                        height: size.height * 0.6,
                        margin: const EdgeInsets.symmetric(vertical: 10),

                        decoration: BoxDecoration(
                          color: kTextColor,
                          borderRadius:const BorderRadius.all(Radius.circular(20)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.26),
                              blurRadius: 12.0,
                              offset: Offset(2, 2),
                            ),
                          ],),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: kTextColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.26),
                                blurRadius: 12.0,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: const CircularProgressIndicator(
                            color: Colors.lightGreenAccent,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        width: size.width,
                        height: size.height * 0.6,
                        decoration: BoxDecoration(
                          color: kTextColor,
                          image: const DecorationImage(
                            image: AssetImage("assets/images/girl3.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      right: 0,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        width: size.width,
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          gradient: LinearGradient(
                            colors: gradient,
                            stops: stops,
                            end: Alignment.bottomCenter,
                            begin: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 30,
                      bottom: 30,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.verified_user,
                                color: Colors.lightBlueAccent,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                itemsnew.name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                    fontFamily: "Raleway"),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  decoration: const BoxDecoration(
                                      color: Color(0x70000000),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: const BoxDecoration(
                                            color: Colors.greenAccent,
                                            shape: BoxShape.circle),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(
                                        "Online",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w100,
                                            fontFamily: "Raleway"),
                                      )
                                    ],
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  decoration: const BoxDecoration(
                                      color: Color(0x70000000),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.supervised_user_circle,
                                        color: Colors.grey,
                                        size: 15,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "You & Her",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w100,
                                            fontFamily: "Raleway"),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                itemsnew.ageAgo,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Raleway"),
                              ),
                              Text(
                                ", " + itemsnew.height,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Raleway"),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 5,
                                height: 5,
                                decoration: const BoxDecoration(
                                    color: Colors.greenAccent,
                                    shape: BoxShape.circle),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Not working",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Raleway"),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                itemsnew.subCategory,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Raleway"),
                              ),
                              Text(
                                ", " + itemsnew.category,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Raleway"),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 5,
                                height: 5,
                                decoration: const BoxDecoration(
                                    color: Colors.greenAccent,
                                    shape: BoxShape.circle),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                itemsnew.city + ", " + itemsnew.state,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Raleway"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
