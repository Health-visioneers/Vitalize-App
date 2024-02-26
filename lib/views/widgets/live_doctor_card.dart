import 'package:flutter/material.dart';

class LiveDoctorCard extends StatefulWidget {
  LiveDoctorCard({
    super.key,
    required this.w,
    required this.h,
  });
  double w;
  double h;

  @override
  State<LiveDoctorCard> createState() => _LiveDoctorCardState();
}

class _LiveDoctorCardState extends State<LiveDoctorCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.w,
      height: widget.h * 0.2,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icons/doctor1.png"),
              ),
              gradient: RadialGradient(
                colors: [
                Color.fromARGB(255, 181, 180, 253),
                Color.fromARGB(255, 119, 117, 255)
                ],
                
              )
            ),
          ),
          SizedBox(width: 5,),
          Column(
            children: [
              Text("Dr. Chandra Shekar",style: TextStyle(fontFamily: 'metro-l',color: Colors.white,fontSize: 10),),
              Text("Sexologist",style: TextStyle(fontFamily: 'metro-l',fontSize: 6,color: Colors.white),)
            ],
          )
        ],
      ),
    );
  }
}