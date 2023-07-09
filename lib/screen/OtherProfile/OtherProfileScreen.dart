import 'package:apnishaadi/model/matches.dart';
import 'package:apnishaadi/component/cartwithdetails.dart';
import 'package:apnishaadi/utils/color.dart';
import 'package:apnishaadi/screen/internetCheck/internetCheck.dart';
import 'package:apnishaadi/utils/config.dart';
import 'package:apnishaadi/utils/next_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_sms/flutter_sms.dart';

class OptherProfileScreen extends StatefulWidget {
  const OptherProfileScreen({Key? key, required this.item}) : super(key: key);
  final ShaadiItem item;

  @override
  State<OptherProfileScreen> createState() => _OptherProfileScreenState();
}

class _OptherProfileScreenState extends State<OptherProfileScreen> {
  String details = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    details = "Ours is an " + widget.item.familyClass.toLowerCase() + ". ";
    details = details +
        "originally from " +
        widget.item.city.toLowerCase() +
        ", with " +
        widget.item.familyValue.toLowerCase() +
        ". ";
    details = details +
        "My father is " +
        widget.item.fatherOccupation.toLowerCase() +
        " and My mother is a " +
        widget.item.motherOccupation.toLowerCase() +
        ". ";
    if (widget.item.noOfSister != "0") {
      if (widget.item.noOfBrother != "0") {
        details = details +
            "she" +
            " was has " +
            widget.item.noOfBrother.toLowerCase() +
            " brother (" +
            widget.item.noOfBrotherMarried.toLowerCase() +
            ") and " +
            widget.item.noOfSister.toLowerCase() +
            " sister (" +
            widget.item.noOfSisterMarried.toLowerCase() +
            ").";
      } else {
        details = details +
            "she" +
            " was has " +
            widget.item.noOfSister.toLowerCase() +
            " sister (" +
            widget.item.noOfSisterMarried.toLowerCase() +
            ").";
      }
    } else if (widget.item.noOfSister == "0") {
      details = details +
          "she" +
          " was has " +
          widget.item.noOfBrother.toLowerCase() +
          " brother (" +
          widget.item.noOfBrotherMarried.toLowerCase() +
          ").";
    }
  }

  void sending_SMS(String msg, List<String> list_receipents) async {
    String send_result = await sendSMS(message: msg, recipients: list_receipents)
        .catchError((err) {
      print(err);
    });
    print(send_result);
  }
  Future<void> send() async {
    final Email email = Email(
      body: '',
      subject: '',
      recipients: [widget.item.email],
      cc: [],
      bcc: [],
      attachmentPaths: [],
      isHTML: false,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      print(error);
      platformResponse = error.toString();
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
      ),
    );
  }
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                InkWell(
                  onTap: (){
                    nextNameScreen(context, "/profileImageZoom", widget.item.profileImg);
                  },
                  child: CachedNetworkImage(
                    imageUrl: widget.item.profileImg[0].toString(),
                    imageBuilder: (context, imageProvider) => Container(
                      width: size.width,
                      height: size.height * 0.6,
                      decoration: BoxDecoration(
                        color: kTextColor,
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
                      color: kTextColor,
                      child: Container(   color: kTextColor,width: 40,height: 40,child:const CircularProgressIndicator(color: Colors.lightGreenAccent,),),
                    ),
                    errorWidget: (context, url, error) => Container(
                      width: size.width,
                      height: size.height * 0.6,
                      decoration: BoxDecoration(
                        color: kTextColor,
                        image:const DecorationImage(
                          image: AssetImage("assets/images/girl3.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 50,
                  right: 10,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0x70000000)),
                        child: const Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: const BoxDecoration(
                              color: Color(0x70000000),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Row(
                            children:  [
                              const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 15,
                              ),
                              const  SizedBox(
                                width: 5,
                              ),
                              Text(
                                widget.item.profileImg.length.toString(),
                                style:const TextStyle(
                                    color: Colors.white, fontFamily: "Raleway"),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Container(
                    width: size.width,
                    height: 130,
                    decoration: BoxDecoration(
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
                            widget.item.name,
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                            widget.item.ageAgo,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Raleway"),
                          ),
                          Text(
                            ", " + widget.item.height,
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
                            widget.item.subCategory,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Raleway"),
                          ),
                          Text(
                            ", " + widget.item.category,
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
                            widget.item.city + ", " + widget.item.state,
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
            CartWithDetailsComp(
                item: widget.item,
                title: "About " + widget.item.name,
                details: widget.item.details,
                manglik: false),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: size.width,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.26),
                      blurRadius: 12.0,
                      offset: Offset(2, 2),
                    ),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Basic Details ",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Text(
                          "Created by " + widget.item.createdBy,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "ID ",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Text(
                                widget.item.id,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Text(
                          widget.item.ageAgo + " old",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Height - ",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Text(
                                widget.item.height,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        decoration: const BoxDecoration(
                            color: Colors.lightBlueAccent,
                            shape: BoxShape.circle),
                        child: const Icon(
                          Icons.calendar_month,
                          color: Colors.white,
                          size: 17,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Birth Date",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            widget.item.dob,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        decoration: const BoxDecoration(
                            color: Colors.lightBlueAccent,
                            shape: BoxShape.circle),
                        child: const Icon(
                          Icons.supervised_user_circle_rounded,
                          color: Colors.white,
                          size: 17,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Marital Status",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            widget.item.maritalStatus,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        decoration: const BoxDecoration(
                            color: Colors.lightBlueAccent,
                            shape: BoxShape.circle),
                        child: const Icon(
                          Icons.location_on_sharp,
                          color: Colors.white,
                          size: 17,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Lives in",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            "Lives in " +
                                widget.item.city +
                                ", " +
                                widget.item.state +
                                ", " +
                                widget.item.country,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        decoration: const BoxDecoration(
                            color: Colors.lightBlueAccent,
                            shape: BoxShape.circle),
                        child: const Icon(
                          Icons.language,
                          color: Colors.white,
                          size: 17,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Religion & Mother Tongue",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            widget.item.religion +
                                ", " +
                                widget.item.motherTongue,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        decoration: const BoxDecoration(
                            color: Colors.lightBlueAccent,
                            shape: BoxShape.circle),
                        child: Image.asset(
                          "assets/images/community.png",
                          width: 17,
                          height: 17,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Community",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            widget.item.community,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        decoration: const BoxDecoration(
                            color: Colors.lightBlueAccent,
                            shape: BoxShape.circle),
                        child: Image.asset(
                          "assets/images/diet.png",
                          width: 17,
                          height: 17,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Diet Preferences",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            widget.item.dietPreferences,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: size.width,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.26),
                      blurRadius: 12.0,
                      offset: Offset(2, 2),
                    ),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact Details",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        decoration: const BoxDecoration(
                            color: Colors.lightBlueAccent,
                            shape: BoxShape.circle),
                        child: const Icon(
                          Icons.phone,
                          color: Colors.white,
                          size: 17,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Contact No.",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            widget.item.countryCode + widget.item.mobile,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        decoration: const BoxDecoration(
                            color: Colors.lightBlueAccent,
                            shape: BoxShape.circle),
                        child: const Icon(
                          Icons.email_rounded,
                          color: Colors.white,
                          size: 17,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email ID",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            widget.item.email,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: size.width,
                    height: 1,
                    color: Colors.black38,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet<void>(
                        // context and builder are
                        // required properties in this widget
                        context: context,
                        shape: const RoundedRectangleBorder(
                          // <-- SEE HERE
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25.0),
                          ),
                        ),
                        builder: (BuildContext context) {
                          // we set up a container inside which
                          // we create center column and display text

                          // Returning SizedBox instead of a Container
                          return SizedBox(
                            height: 320,
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25)),
                                    gradient: LinearGradient(
                                      colors: gradientBottom,
                                      end: Alignment.centerRight,
                                      begin: Alignment.centerLeft,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow:const [
                                            BoxShadow(
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.26),
                                              blurRadius: 12.0,
                                              offset: Offset(2, 2),
                                            ),
                                          ],
                                          border: Border.all(
                                              color: Colors.white, width: 2),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                widget.item.profileImg[0].toString()),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    const  SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.item.name,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                                fontFamily: "Raleway"),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                widget.item.countryCode + "-",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12),
                                              ),
                                              Text(
                                                widget.item.mobile,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            "Created by " +
                                                widget.item.createdBy,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                               const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          decoration:const BoxDecoration(
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.26),
                                                blurRadius: 12.0,
                                                offset: Offset(2, 2),
                                              ),
                                            ],
                                          ),
                                          child: Image.asset(
                                            "assets/images/whatsapp.png",
                                            width: 60,
                                            height: 60,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Whatsapp",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall,
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    InkWell(
                                      onTap:(){
                                        launch("tel:"+widget.item.countryCode+" "+widget.item.mobile);
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(7),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.lightBlueAccent,
                                              boxShadow:const [
                                                BoxShadow(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.26),
                                                  blurRadius: 12.0,
                                                  offset: Offset(2, 2),
                                                ),
                                              ],
                                              border: Border.all(
                                                  color: Colors.white, width: 2),
                                            ),
                                            child: const Icon(
                                              Icons.call,
                                              color: Colors.white,
                                              size: 40,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          Text(
                                            "Call",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 1,
                                  margin: const EdgeInsets.symmetric(horizontal: 30,),
                                  color: Colors.black12,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                Container(padding: const EdgeInsets.symmetric(horizontal: 30,),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.item.countryCode + "-",
                                          style:const TextStyle(color: Colors.black26,fontSize: 15,fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          widget.item.mobile,
                                          style:const TextStyle(color: Colors.black26,fontSize: 15,fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                   InkWell(
                                     onTap: (){
                                       sending_SMS('Msg from '+widget.item.name+'('+widget.item.id+')'+ ': Hi, I liked the Profile that you have posted on '+Config.website+'. Please visit my Profile and respond. https://t.apnishaadi.com/6/jls51hv', [widget.item.countryCode+widget.item.mobile]);
                                     },
                                     child: const Text(
                                        "SMS",
                                        style: TextStyle(color: Colors.lightBlueAccent,fontSize: 15,fontWeight: FontWeight.w600),
                                      ),
                                   ),
                                ],),),


                                const SizedBox(
                                  height: 20,
                                ),

                                Container(padding: const EdgeInsets.symmetric(horizontal: 30,),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget.item.email,
                                        style:const TextStyle(color: Colors.black26,fontSize: 15,fontWeight: FontWeight.w600),
                                      ),
                                      InkWell(onTap: (){
                                        send();

                                      },child: const Text(
                                        "Email",
                                        style: TextStyle(color: Colors.lightBlueAccent,fontSize: 15,fontWeight: FontWeight.w600),
                                      ),),

                                    ],),),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 165,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.blueAccent)),
                        child: const Text(
                          "View Details",
                          style: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              fontFamily: "Raleway"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
                child: CartWithDetailsComp(
                    item: widget.item,
                    title: "Family Details",
                    details: details,
                    manglik: false)),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: size.width,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.26),
                      blurRadius: 12.0,
                      offset: Offset(2, 2),
                    ),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Career & Education",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        decoration: const BoxDecoration(
                            color: Colors.lightBlueAccent,
                            shape: BoxShape.circle),
                        child: const Icon(
                          Icons.work,
                          color: Colors.white,
                          size: 17,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Profession",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            widget.item.profession,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Visibility(
                    visible: widget.item.companyName == "null" ? false : true,
                    child: const SizedBox(
                      height: 20,
                    ),
                  ),
                  Visibility(
                    visible: widget.item.companyName == "null" ? false : true,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(7),
                          decoration: const BoxDecoration(
                              color: Colors.lightBlueAccent,
                              shape: BoxShape.circle),
                          child: const Icon(
                            Icons.work,
                            color: Colors.white,
                            size: 17,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Company Name",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Text(
                              widget.item.companyName,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        decoration: const BoxDecoration(
                            color: Colors.lightBlueAccent,
                            shape: BoxShape.circle),
                        child: Image.asset(
                          "assets/images/money.png",
                          width: 17,
                          height: 17,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Annual Income",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            widget.item.annualIncome,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        decoration: const BoxDecoration(
                            color: Colors.lightBlueAccent,
                            shape: BoxShape.circle),
                        child: const Icon(
                          Icons.school,
                          color: Colors.white,
                          size: 17,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Highest Qualification",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            widget.item.highestQualification,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        decoration: const BoxDecoration(
                            color: Colors.lightBlueAccent,
                            shape: BoxShape.circle),
                        child: Image.asset(
                          "assets/images/book.png",
                          width: 17,
                          height: 17,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Education Field",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            widget.item.education,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        decoration: const BoxDecoration(
                            color: Colors.lightBlueAccent,
                            shape: BoxShape.circle),
                        child: Image.asset(
                          "assets/images/college.png",
                          width: 17,
                          height: 17,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "College Name",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            widget.item.collegeName,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CartWithDetailsComp(
                item: widget.item,
                title: "Astro Details",
                details: "Born in  " +
                    widget.item.city +
                    " in date at approximately " +
                    widget.item.time,
                manglik: true),
            const SizedBox(
              height: 20,
            ),

          ],
        ),
      ),
    );
  }
}
