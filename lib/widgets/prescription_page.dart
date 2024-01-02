

import 'package:flutter/material.dart';

class PrescriptionPage extends StatefulWidget {
  const PrescriptionPage({super.key});

  @override
  State<PrescriptionPage> createState() => _PrescriptionPageState();
}

class _PrescriptionPageState extends State<PrescriptionPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,),
        title: const Text("Prescription",style: TextStyle(fontFamily: 'metro-m',fontSize: 18,color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              width: w,
              height: h * 0.5,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 135, 133, 255),
                    Color.fromARGB(255, 200, 199, 255),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hemanth Srinivas",style: TextStyle(fontFamily: 'metro-m',fontSize: 25,color: Colors.white),),
                  const SizedBox(height: 5,),
                  Text("Male | 20",style: TextStyle(fontFamily: 'metro',fontSize: 18,color: const Color.fromARGB(255, 227, 227, 227)),),
                  const SizedBox(height: 10,),
                  Text("Disease: Heat Burn",style: TextStyle(fontFamily: 'metro-m',fontSize: 20,color: Colors.white),),
                ],
              ),
            ),
            
          ],
        ),
      )
    );
  }
}