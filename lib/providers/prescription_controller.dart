import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:vitaliz/constants/api_constants.dart';
import 'package:vitaliz/models/prescription_model.dart';
import 'package:http/http.dart' as http;


class PrescriptionProvider extends ChangeNotifier{
  PrescriptionModel prescriptionModel = PrescriptionModel(records: []);
  bool isLoading = false;

  Future<void> getPrescriptions() async{
    try{
      isLoading = true;
      notifyListeners();
      final headers = {'Content-Type': 'application/json'};
      final uri = Uri.parse("https://vitalize.pythonanywhere.com/api/prescriptions");
      var response = await http.get(uri,headers: headers);
      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        prescriptionModel = PrescriptionModel.fromJson(data);
      }else{
        if (kDebugMode) {
          print("Error fetching Data");
        }
      }
    }catch(e){
      if(kDebugMode) {
        print("Error $e");
      }
    }
    isLoading = false;
    notifyListeners();
  }
  
}