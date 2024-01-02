import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vitaliz/home.dart';
import 'package:vitaliz/providers/prescription_controller.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.blue, // navigation bar color
      statusBarColor: Color.fromARGB(0, 233, 30, 98), // status bar color
    )
  );
  runApp(
   MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PrescriptionProvider()),
      ],
      child: const MyApp(),
    ),
  );
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
