import 'package:another_telephony/telephony.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tu/firebase/model/received_sms.dart';
import 'package:tu/utils/format_datetime.dart';

import 'main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  String _message = "";
  String _dattime = "";
  final telephony = Telephony.instance;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text("Latest received SMS: $_message")),
            ],
          ),
        ));
  }
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }
  receiveInBackground(SmsMessage message)async{
    ReceivedSMS sms =setSMS(message);
    debugPrint("receiveInBackground  ${message.body}");
    if(mounted){
      setState(() {
        _message =message.body!;
      });
    }else{
      debugPrint("not mounted");
    }
    await _sentFBBackground(sms);
  }
  Future<void> initPlatformState() async {
    final bool? result = await telephony.requestPhoneAndSmsPermissions;

    if (result != null && result) {
      telephony.listenIncomingSms(
          onNewMessage: _onMessage, onBackgroundMessage: onBackgroundMessage);
    }

    if (!mounted) return;
  }
  ReceivedSMS setSMS(SmsMessage message){
    ReceivedSMS sms =ReceivedSMS();
    var millis =message.date;
    sms.from=message.address!;
    sms.content=message.body!;

    if(millis!=null){
      var dt = DateTime.fromMillisecondsSinceEpoch(millis);
      _dattime = DateFormat('dd/MM/yyyy - HH:mm').format(dt); // 31/12/2000, 22:00
      sms.datetime=_dattime;
    }
    return sms;
  }
  _onMessage(SmsMessage message) async {
    setState(() {
      _message = message.body ?? "Error reading message body.";
    });
    ReceivedSMS sms =setSMS(message);
    _sentFBBackground(sms);
  }
  _sentFBBackground(ReceivedSMS sms)async{
    await Firebase.initializeApp();
    var database = FirebaseDatabase.instance;

    var databaseReference = database.ref('SMS');// todo root
    sms.yearMonthDay = FormatDateTime.strTodayFormatType(FormatType.YYYYMMDD_);
    sms.yearMonthDayHHMMSS = FormatDateTime.strTodayFormatType(FormatType.YYYYMMDDHHmmss_);
    databaseReference.child(sms.yearMonthDay!).push()// todo .push(): id tự generate từ firebase
        .set(sms.toJson())
        .then((value) => {
    });
  }
}
