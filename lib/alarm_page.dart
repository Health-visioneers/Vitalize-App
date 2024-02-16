
import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  void initState() {
    super.initState();

  }

  final alarmSettings = AlarmSettings(
    id: 42, 
    dateTime: DateTime(2024,01,09,1,10),
    assetAudioPath: 'assets/music/alarm_music.mp3', 
    notificationTitle: "This is test Notification", 
    notificationBody: "This is test body",
    loopAudio: true,
    vibrate: true,
    volume: 0.2,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              child:Center(
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.black,
                ),
              ),
              onTap: () async{
                await Alarm.set(alarmSettings: alarmSettings);
                
              },
            ),
            const SizedBox(height: 10,),
            GestureDetector(
              child:Center(
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.black,
                ),
              ),
              onTap: () async{
                await Alarm.stop(42);
                
              },
            ),
          ],
        ),
      ),
    );
  }
}




