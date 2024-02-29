
class Utils {
  static final Utils _singleton = Utils._internal();

  factory Utils() {
    return _singleton;
  }

  Utils._internal();

  static bool isValidEmail(String email) {
    String p = r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(email);
  }
  static bool isValidPhone(String phone){
    return phone.length==10?true:false;
  }

  static final RegExp regex = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');


  static bool isNotEmpty(String? string){

    if(string==null){
      return false;
    }
    if(string.isEmpty){
      return false;
    }
    if(string.isNotEmpty){
      return true;
    }
    return true;
  }
  static bool compareTo(String a,String b){
    if(a.compareTo(b)==0||b.compareTo(a)==0){
      return true;
    }else{
      return false;
    }
  }
}
