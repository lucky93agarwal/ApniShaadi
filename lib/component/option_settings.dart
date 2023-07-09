import 'package:flutter/material.dart';

class OptionSettingsComp extends StatefulWidget {
  const OptionSettingsComp({Key? key,required this.size}) : super(key: key);
  final Size size;

  @override
  State<OptionSettingsComp> createState() => _OptionSettingsCompState();
}

class _OptionSettingsCompState extends State<OptionSettingsComp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          height: 50,
          width: widget.size.width,
          alignment: Alignment.centerLeft,
          padding:
          const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: const Text(
            "Options & Settings",
            style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.black,
                fontSize: 16),
          ),
        ),

        // Options & Settings body
        Container(

            width: widget.size.width,
            alignment: Alignment.centerLeft,
            margin:
            const EdgeInsets.only(bottom: 20, left: 10, right: 10),
            padding:
            const EdgeInsets.symmetric(vertical: 10),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(2)),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.26),
                      blurRadius: 5.0,
                      offset: Offset(2, 2)),
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: 50,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children:const [
                          Icon(Icons.verified_user,color: Colors.black,size: 20,),
                          SizedBox(width: 20,),
                          Text(
                            "Partner Preferences",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                        ],),

                      const Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,size: 15,)
                    ],),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 50,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children:const [
                          Icon(Icons.filter_alt,color: Colors.black,size: 20,),
                          SizedBox(width: 20,),
                          Text(
                            "Contact Filters",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                        ],),

                      const Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,size: 15,)
                    ],),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 50,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children:const [
                          Icon(Icons.settings,color: Colors.black,size: 20,),
                          SizedBox(width: 20,),
                          Text(
                            "Accounts Settings",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                        ],),

                      const Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,size: 15,)
                    ],),
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  height: 50,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children:const [
                          Icon(Icons.help,color: Colors.black,size: 20,),
                          SizedBox(width: 20,),
                          Text(
                            "Help & Support",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                        ],),

                      const Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,size: 15,)
                    ],),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 50,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.star,color: Colors.black,size: 20,),
                          const SizedBox(width: 20,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:const [
                              Text(
                                "Rate the App",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 16),
                              ),
                              Text(
                                "Make your opinion count",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontSize: 12),
                              ),
                            ],),

                        ],),
                    ],),
                ),

              ],)
        ),
      ],),
    );
  }
}
