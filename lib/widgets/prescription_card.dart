
import 'package:flutter/material.dart';
import 'package:vitaliz/widgets/prescription_page.dart';

class PrescriptionCard extends StatefulWidget {
  PrescriptionCard({
    super.key,
    required this.w,
    required this.h,
    required this.userName,
    required this.age,
    required this.date,
    required this.gender,
    required this.diseaseName,
    required this.doctorName,
  });
  double w;
  double h;
  String userName;
  String gender;
  int age;
  String date;
  String doctorName;
  String diseaseName;

  @override
  State<PrescriptionCard> createState() => _PrescriptionCardState();
}

class _PrescriptionCardState extends State<PrescriptionCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: widget.h * 0.15,
        width: double.maxFinite,
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 235, 225, 255),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.userName,style: TextStyle(fontFamily: 'metro-m',fontSize: 18),),
                Text(widget.date,style: TextStyle(fontFamily: 'metro-m',fontSize: 14),),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Text("${widget.gender} | ${widget.age}",style: TextStyle(fontFamily: 'metro',fontSize: 14,color: Colors.grey),),
              ],
            ),
            SizedBox(height: widget.h * 0.04,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${widget.diseaseName}",style: TextStyle(fontFamily: 'metro-m',fontWeight: FontWeight.bold,fontSize: 18),),
                //Text("${widget.doctorName}",style: TextStyle(fontFamily: 'metro-l',fontWeight: FontWeight.bold,fontSize: 16),),
              ],
            )
          ],
        ),
      ),
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PrescriptionPage()));
      },
    );
  }
}