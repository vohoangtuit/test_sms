

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tu/firebase/model/received_sms.dart';

class SharedPre {
  static SharedPre? _instance;
  static SharedPreferences? _preferences;

  static String sms ='keySMS';


  static Future<SharedPre?> getInstance() async {
    _instance ??= SharedPre();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance;
  }
   void setString(String key,String value)async{
    _preferences!.setString(key, value);
  }
   Future<String> getString(String key) async {
    return _preferences!.getString(key)??'';
  }

  void setSMS(ReceivedSMS list)async{
    _preferences!.setString(SharedPre.sms, list.toString());
  }

   Future<bool> clearData()async{
   return await _preferences!.clear();
  }
}