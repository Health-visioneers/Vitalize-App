import 'package:flutter/material.dart';
import 'package:vitaliz/models/prescription_model.dart';


class PrescriptionPage extends StatefulWidget {
  PrescriptionPage({
    super.key,
    required this.prescription,
  });

  Records prescription;

  @override
  State<PrescriptionPage> createState() => _PrescriptionPageState();
}

class _PrescriptionPageState extends State<PrescriptionPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(10),
          height: h * 0.06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 135, 133, 255),
          ),
          child: Center(
            child: Text("Enable Notifications",style: TextStyle(fontFamily: 'metro-m',fontSize: 18,color: Colors.white),),
          ),
        ),
      ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.prescription.username,style: TextStyle(fontFamily: 'metro-m',fontSize: 25,color: Colors.white),),
                      Text("Male | 20",style: TextStyle(fontFamily: 'metro',fontSize: 18,color: const Color.fromARGB(255, 227, 227, 227)),),
                    ],
                  ),
                  
                  const SizedBox(height: 0,),
                  Row(
                    children: [
                      Text("${widget.prescription.diseaseName}",style: TextStyle(fontFamily: 'metro-m',fontSize: 18,color: Color.fromARGB(181, 255, 255, 255)),),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  const Text("Prescribed Medicines :",style: TextStyle(fontFamily: 'metro-m',fontSize: 14,color: Colors.white),),
                  Container(
                    width: double.infinity,
                    height: h * widget.prescription.medicines.length * 0.04,
                    child: ListView.builder(
                      itemCount: widget.prescription.medicines.length,
                      itemBuilder: (context, index){
                        final data = widget.prescription.medicines[index];
                        return medicineTile(w, h, data.medicineName, data.frequency, data.dosage);
                      }
                    ),
                  ),
                  SizedBox(height: 10,),
                  const Text("Patient Symptoms :",style: TextStyle(fontFamily: 'metro-m',color: Colors.white,fontSize: 14),),
                  SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: ListView.builder(
                      itemCount: widget.prescription.symptoms.length,
                      itemBuilder: (context, index){
                      final data = widget.prescription.symptoms[index];
                        return Text("- ${data}",style: TextStyle(fontFamily: 'metro-l',fontSize: 14,color: Colors.white),);
                      },
                    ),
                  ) 
                ],
              ),
            ), 
          ],
        ),
      )
    );
  }
}


Widget medicineTile(w,h,medicineName,frequency,dosage){
  return Container( 
    width: double.infinity,
    height: 25,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("${medicineName} x ${frequency}",style: TextStyle(fontFamily: 'metro-l',fontSize: 14,color: Colors.white),),

        Text("${dosage}/day",style: TextStyle(fontSize: 14,fontFamily: 'metro-l',color: Colors.white  ),)
      ],
    ),
  );
}