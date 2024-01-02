class PrescriptionModel {
  PrescriptionModel({
    required this.records,
  });
  late final List<Records> records;
  
  PrescriptionModel.fromJson(Map<String, dynamic> json){
    records = List.from(json['records']).map((e)=>Records.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['records'] = records.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Records {
  Records({
    required this.id,
    required this.medicines,
    required this.date,
    required this.username,
    required this.age,
    required this.gender,
    required this.phone,
    required this.symptoms,
    required this.diseaseName,
    required this.doctorName
  });
  late final String id;
  late final List<Medicines> medicines;
  late final String date;
  late final String username;
  late final int age;
  late final String gender;
  late final String phone;
  late final String doctorName;
  late final String diseaseName;
  late final List<String> symptoms;
  
  Records.fromJson(Map<String, dynamic> json){
    id = json['id'];
    medicines = List.from(json['medicines']).map((e)=>Medicines.fromJson(e)).toList();
    date = json['date'];
    username = json['username'];
    age = json['age'];
    gender = json['gender'];
    phone = json['phone'];
    doctorName = json['doctorName'];
    diseaseName = json['diseaseName'];
    symptoms = List.castFrom<dynamic, String>(json['symptoms']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['medicines'] = medicines.map((e)=>e.toJson()).toList();
    _data['date'] = date;
    _data['username'] = username;
    _data['age'] = age;
    _data['gender'] = gender;
    _data['phone'] = phone;
    _data['doctorName'] = doctorName;
    _data['diseaseName'] = diseaseName;
    _data['symptoms'] = symptoms;
    return _data;
  }
}

class Medicines {
  Medicines({
    required this.medicineName,
    required this.dosage,
    required this.frequency,
  });
  late final String medicineName;
  late final int dosage;
  late final int frequency;
  
  Medicines.fromJson(Map<String, dynamic> json){
    medicineName = json['medicineName'];
    dosage = json['dosage'];
    frequency = json['frequency'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['medicineName'] = medicineName;
    _data['dosage'] = dosage;
    _data['frequency'] = frequency;
    return _data;
  }
}