import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitaliz/providers/prescription_controller.dart';
import 'package:vitaliz/widgets/prescription_card.dart';

class PrescriptionsPage extends StatefulWidget {
  const PrescriptionsPage({super.key});

  @override
  State<PrescriptionsPage> createState() => _PrescriptionsPageState();
}

class _PrescriptionsPageState extends State<PrescriptionsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PrescriptionProvider>(context,listen :false).getPrescriptions();
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,),
        title: const Text("Your Prescriptions",style: TextStyle(fontFamily: 'metro-m',fontSize: 18,color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: w,
              height: h,
              child: Consumer<PrescriptionProvider>(
                builder: (context,provider,child){
                  if(provider.isLoading){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final prescriptions = provider.prescriptionModel;
                  return SizedBox(
                    width: w,
                    height: h * 0.9,
                    child: ListView.builder(
                      itemCount: prescriptions.records.length,
                      itemBuilder: (context,index){
                        final prescription = prescriptions.records[index];
                        return PrescriptionCard(
                          w: w,
                          h:h,
                          date: prescription.date,
                          userName: prescription.username,
                          age: prescription.age,
                          gender: prescription.gender,
                          diseaseName: prescription.diseaseName,
                          doctorName: prescription.doctorName,
                        );
                      },
                    ),
                  );
                },
              ),
            )
          ),
        ),
      ),
    );
  }
}

