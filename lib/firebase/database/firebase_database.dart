
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tu/firebase/model/received_sms.dart';

import '../../utils/format_datetime.dart';

class FirebaseDB {
  late BuildContext? context;

  late DatabaseReference databaseReference;

  late FirebaseApp app;

  late FirebaseDatabase database;
  String sms = 'SMS';
  FirebaseDB.getInstance() {
    initDB();
  }

  void initDB() async {
    app = await Firebase.initializeApp();
    database = FirebaseDatabase.instance;

    databaseReference = database.ref('SMS');// todo root
  }
  Future<void>saveSMS(ReceivedSMS receivedSMS)async{
    receivedSMS.yearMonthDay = FormatDateTime.strTodayFormatType(FormatType.YYYYMMDD_);
    receivedSMS.yearMonthDayHHMMSS = FormatDateTime.strTodayFormatType(FormatType.YYYYMMDDHHmmss_);
    databaseReference.child(receivedSMS.yearMonthDay!).push()// todo .push(): id tự generate từ firebase
        .set(receivedSMS.toJson())
        .then((value) => {
    });
  }

}
