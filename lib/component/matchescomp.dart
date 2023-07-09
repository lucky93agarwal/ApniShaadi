
import 'package:apnishaadi/utils/color.dart';
import 'package:apnishaadi/utils/next_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class MatchesComp extends StatefulWidget {
  const MatchesComp({Key? key,required this.size,required this.items,required this.details,required this.title,required this.count}) : super(key: key);
  final Size size;
  final   List<dynamic> items;
  final String details;
  final String title;
  final String count;

  @override
  State<MatchesComp> createState() => _MatchesCompState();
}

class _MatchesCompState extends State<MatchesComp> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: widget.size.width,
      margin:
      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
          Container(height: 70,
            width: widget.size.width,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text(widget.title,style:const TextStyle(fontWeight: FontWeight.w900,color: Colors.black,fontSize: 16),),
                  Text("("+widget.count+")",style:const TextStyle(fontWeight: FontWeight.w900,color: Colors.black,fontSize: 16),),
                ],),

                const SizedBox(height: 3,),
                Text(widget.details,style:const TextStyle(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 14),),
              ],),),
          Container(
            height: 318,
            width: widget.size.width,
            padding: const EdgeInsets.symmetric(horizontal: 2),

            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  dynamic itemsnew = widget.items[index];
                  return Container(
                    width: widget.size.width * 0.457,
                    height: 200,
                    margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 2),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffEEEEEE))
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap:(){
                            nextNameScreen(context, "/otherProfile", itemsnew);
                          },
                          child:   CachedNetworkImage(
                            imageUrl: itemsnew.profileImg[0].toString(),
                            imageBuilder: (context, imageProvider) => Container(
                              width: widget.size.width * 0.47,
                              height: 180,
                              decoration: BoxDecoration(
                                color: kTextColor,
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Align(alignment:Alignment.bottomCenter,
                              child: Container(height: 40,width: widget.size.width*0.5,color: const Color(0x60000000),
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                alignment: Alignment.centerLeft,
                                child: Text(itemsnew.name,style: const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.normal),),
                              ),),
                            ),
                            placeholder: (context, url) => Container(
                              alignment: Alignment.center,
                              width: widget.size.width * 0.47,
                              height: 180,
                              color: kTextColor,
                              child: Container(   color: kTextColor,width: 20,height: 20,child:const CircularProgressIndicator(color: Colors.lightGreenAccent,),),
                            ),
                            errorWidget: (context, url, error) => Container(
                              width: widget.size.width * 0.47,
                              height: 180,
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
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Text(itemsnew.ageAgo,style: const TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.normal),),
                                Text(", "+itemsnew.height,style: const TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.normal),),
                              ],),
                              Text(itemsnew.category,style: const TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.normal),),
                              Row(children: [
                                Visibility(visible: itemsnew.state.length<15?true:false,child: Text(itemsnew.city+", ",style: const TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.normal),)),
                                Text(itemsnew.state,style: const TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.normal),),
                              ],),

                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blueAccent)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.check,color: Colors.lightBlueAccent,),
                                    SizedBox(width: 5,),
                                    Text("Connect Now",style: TextStyle(fontWeight: FontWeight.w900,color: Colors.lightBlueAccent),)
                                  ],),)
                            ],
                          ),
                        ),

                      ],
                    ),
                  );
                }),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap:(){
                  nextNameScreen(context, "/allList", widget.items);
                },
                child: Container(margin: const EdgeInsets.symmetric(vertical: 10),child:const Text(
                  "See All",
                  style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.w900,
                  fontSize: 15),
                ),),
              )
          )
        ],
      ),
    );
  }
}
