



import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseCloudStore{
  static const socialLogin ='social_login';
  static const deleteAccount ='deleteAccount';
  static const loginAuthenticate ='loginAuthenticate';



  late  FirebaseFirestore firebaseStore;
  FireBaseCloudStore.getInstance()  {
    firebaseStore= FirebaseFirestore.instance;
  }


}
