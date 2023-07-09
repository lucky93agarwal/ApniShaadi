import 'package:flutter/material.dart';

class DownloadComp extends StatefulWidget {
  const DownloadComp({Key? key,required this.size}) : super(key: key);
  final Size size;

  @override
  State<DownloadComp> createState() => _DownloadCompState();
}

class _DownloadCompState extends State<DownloadComp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width,
      height: 50,
      margin:
      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(2)),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.26),
              blurRadius: 12.0,
              offset: Offset(2, 2)
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: const BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius:
                    BorderRadius.all(Radius.circular(10))),
                child: const Text(
                  "New",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Download & share your profile",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w400),
              )
            ],
          ),
          const Text(
            "Download",
            style: TextStyle(
                color: Colors.lightBlueAccent, fontSize: 15),
          )
        ],
      ),
    );
  }
}
