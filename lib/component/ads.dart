

import 'package:apnishaadi/utils/config.dart';
import 'package:flutter/material.dart';


class AdsComp extends StatefulWidget {
  const AdsComp({Key? key,required this.size}) : super(key: key);
  final Size size;

  @override
  State<AdsComp> createState() => _AdsCompState();
}

class _AdsCompState extends State<AdsComp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width,
      height: 365,
      margin:
      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
        children: [
          Container(
            width: widget.size.width,
            height: 125,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: widget.size.width*0.45,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding:     const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration:const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.all(Radius.circular(7)
                            )),
                        child: const Text("Introducing",style: TextStyle(color: Colors.black),),
                      ),

                      const SizedBox(height: 5,),
                      const Text(Config.appName,style: TextStyle(color: Colors.white,fontSize: 18),),
                      const SizedBox(height: 2,),
                      const Text("5 Minute Meetings",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.normal),),
                    ],
                  ),),
                SizedBox(width: widget.size.width*0.45,

                  child: Image.asset("assets/images/posttwo.png"),),


              ],
            ),
          ),
          Container(
              width: widget.size.width,
              height: 240,
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(alignment: Alignment.center,
                        child: Container(
                          width: 120,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(bottom: 20),
                          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                          decoration: const BoxDecoration(
                              color: Colors.lightBlueAccent,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          child: const Text(
                            "TRY FOR FREE",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(width: 70,height: 70,
                            decoration:const BoxDecoration(
                                color: Color(0xFF80D8FF),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const[
                                Text("JUN",style: TextStyle(color: Colors.black,fontSize: 15),),
                                Text("03",style: TextStyle(color: Colors.black,fontSize: 25),)
                              ],),),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text("Hindi Signles",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400),),
                                const SizedBox(height: 5,),
                                Row(children:const [
                                  Icon(Icons.watch_later_outlined,color: Colors.black,),
                                  SizedBox(width: 5,),
                                  Text("9:00 pm - 10:00 pm",style: TextStyle(color: Colors.black,fontSize: 15),)
                                ],)
                              ],),),
                        ],),
                      const SizedBox(height: 15,),
                      const Text("05h : 44m : 48s",style: TextStyle(color: Colors.black,fontSize: 22),),
                    ],),

                  const Text("View more events",style: TextStyle(color: Colors.lightBlueAccent,fontSize: 15),),

                ],)
          ),
        ],
      ),
    );
  }
}
