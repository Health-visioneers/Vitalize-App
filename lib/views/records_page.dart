import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:provider/provider.dart';
import 'package:vitaliz/providers/records_controller.dart';
import 'package:vitaliz/views/pdf_viewer.dart';

class MyRecords extends StatefulWidget {
  const MyRecords({super.key});

  @override
  State<MyRecords> createState() => _MyRecordsState();
}



class _MyRecordsState extends State<MyRecords> {
  
  @override
  Widget build(BuildContext context) {
    final recordController = Provider.of<RecordsProvider>(context);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,)),
        title: const Text("My Records",style: TextStyle(fontFamily: 'metro-m',fontSize: 18,color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: GestureDetector(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          height: h * 0.06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 135, 133, 255),
          ),
          child: const Center(
            child: Text("Upload Record",style: TextStyle(fontFamily: 'metro-m',fontSize: 18,color: Colors.white),),
          ),
        ),
        onTap: ()async{
          final imagePaths = (await CunningDocumentScanner.getPictures(crop: true))!;
          setState(() {
            recordController.imagePath = imagePaths;
          });
        },
      ),
      body: SafeArea(
        child:Padding(
          padding: EdgeInsets.all(12),
          child:recordController.imagePath[0] == "" ? Center(
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/icons/document.png",scale: 15,width: 20,color: Colors.grey,),
                SizedBox(width: 6,),
                Text("No Records yet...",style: TextStyle(fontFamily: 'metro',color: Colors.grey,fontSize: 18),)
              ],
            )
          ) : Center(
                child: Column(
                  children: [
                    Container(
                      padding:const EdgeInsets.all(10),
                      width: w * 0.7,
                      height: h * 0.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(37, 135, 133, 255),
                      ),
                      child: Center(
                        child: Image(image: FileImage(File(recordController.imagePath[0])),fit: BoxFit.cover,),
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          height: h * 0.06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 135, 133, 255),
          ),
          child: const Center(
            child: Text("Create PDF",style: TextStyle(fontFamily: 'metro-m',fontSize: 18,color: Colors.white),),
          ),
        ),
        onTap: ()async{
          await recordController.convertToPdf();
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PDFViewer()));
        },
      ),
                  ],
                ),
          ),
        )
      ),
    );
  }
}

