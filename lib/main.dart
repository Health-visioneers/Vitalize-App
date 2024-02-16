
import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vitaliz/alarm_page.dart';
import 'package:vitaliz/home.dart';
import 'package:vitaliz/providers/prescription_controller.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.blue, // navigation bar color
      statusBarColor: Color.fromARGB(0, 233, 30, 98), // status bar color
    ),
  );
  await Alarm.init(showDebugLogs: true);
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
