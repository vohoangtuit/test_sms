import 'package:another_telephony/telephony.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tu/home_screen.dart';


onBackgroundMessage(SmsMessage message)async{
  print("onBackgroundMessage called ${message.body}");
  HomeScreenState().receiveInBackground(message);
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home:  HomeScreen());
  }
  @override
  void initState() {
    super.initState();

  }

}

