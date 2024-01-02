import 'package:flutter/material.dart';
import 'package:vitaliz/prescriptions_page.dart';

class HomePageCard extends StatefulWidget {
  HomePageCard({
    super.key,
    required this.index,
    required this.w,
    required this.h,
    required this.icon,
    required this.title
  });
  int index;
  double h;
  double w;
  String icon;
  String title;
  @override
  State<HomePageCard> createState() => _HomePageCardState();
}

class _HomePageCardState extends State<HomePageCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          Container(
            width: widget.w * 0.4,
            height: widget.h * 0.2,
            padding: EdgeInsets.only(top: 16,left: 14,right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 168, 168, 255),
                  blurRadius: 10
                )
              ],
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 193, 193, 255),
                  Color.fromARGB(255, 230, 230, 255),
                  //Color.fromARGB(255, 181, 180, 253),
                  //Color.fromARGB(255, 119, 117, 255)
                ],
                begin: Alignment.topLeft,
                end: Alignment.centerRight
              )
            ),
            child: Text(widget.title,style: TextStyle(fontSize: 20,fontFamily: 'metro-m',color: Colors.white,),),
          ),
          Positioned(
            bottom: 0,
            right: 10,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.icon),
                )
              ),
            ),
          )
        ],
      ),
      onTap: (){
        if(widget.index == 1){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PrescriptionsPage()));
        }
      },
    );
  }
}