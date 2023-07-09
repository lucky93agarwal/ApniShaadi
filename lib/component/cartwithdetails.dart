import 'package:apnishaadi/model/matches.dart';
import 'package:apnishaadi/utils/color.dart';
import 'package:flutter/material.dart';


class CartWithDetailsComp extends StatefulWidget {
  const CartWithDetailsComp({Key? key,required this.item,required this.title,required this.details,required this.manglik}) : super(key: key);
  final ShaadiItem item;
  final String title;
  final String details;
  final bool manglik;


  @override
  State<CartWithDetailsComp> createState() => _CartWithDetailsCompState();
}

class _CartWithDetailsCompState extends State<CartWithDetailsComp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: [
      const SizedBox(
        height: 20,
      ),
      // About
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
          children: [
            // About
            Row(
              children: [
                Text(
                  widget.title,
                  style:Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.details,
              style: Theme.of(context).textTheme.bodySmall,
            ),

            Visibility(
              visible: widget.manglik,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding:const EdgeInsets.all(7),
                        decoration: const BoxDecoration(
                            color: Colors.lightBlueAccent, shape: BoxShape.circle),
                        child: Image.asset("assets/images/saturn.png",width: 17,height: 17,),
                      ),
                      const SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Manglik",style: Theme.of(context).textTheme.headlineSmall,),
                          Text(widget.item.manglik?"Yes":"No",style:Theme.of(context).textTheme.bodySmall,),

                        ],),




                    ],
                  ),
                ],),
            ),

          ],
        ),
      ),

      const SizedBox(
        height: 15,
      ),

    ],);
  }
}
