
import 'package:intl/intl.dart';

class FormatDateTime{
  static DateTime selectedDate = DateTime.now();

  static DateFormat dateFormat(FormatType format){
    return DateFormat(formatType(format));
  }

  // todo always use
  static String strFormatType(String dateInput,FormatType output){
    try{

      return dateFormat(output).format(DateTime.parse(dateInput));
    }on Exception catch (_){
      return '';
    }
  }
  static String strFormatTypeInOut(String dateInput,FormatType input,FormatType output){
    try{
      DateTime dateTime = dateFormat(input).parse(dateInput);
      return dateFormat(output).format(dateTime);
    }on Exception catch (_){
      return '';
    }
  }

  // todo always use
  static String strFromDateTime(DateTime dateInput,FormatType output){
    try{
      return dateFormat(output).format(dateInput);
    }on Exception catch (_){
      return '';
    }
  }
  static String strDateFormat(String dateInput,DateFormat output){
    try{
      return output.format(DateTime.parse(dateInput));
    }on Exception catch (_){
      return '';
    }
  }
  static String strDateFormatInOut(String dateInput,DateFormat input,DateFormat output){
    try{
      DateTime dateTime = input.parse(dateInput);
      return output.format(dateTime);
    }on Exception catch (_){
      return '';
    }
  }
  // todo String  hôm nay
  static String strTodayFormatType(FormatType output){
    var now =  DateTime.now();
    return dateFormat(output).format(now);
  }

}

enum FormatType {
  dd,
  mm,
  yyyy,
  hh,
  hhMM,
  hhMMss,

  DDMMYYYY,
  DDMMYYYY_,

  MMYYYY,
  MMYYYY_,

  YYYYMM,
  YYYYMM_,

  YYYYMMDD,
  YYYYMMDD_,

  DDMMYYYY_HHmm,
  DDMMYYYY_HHmmss,
  DDMMYYYY_HHmmss1,

  DDMMYYYY_HHmm_,
  DDMMYYYY_HHmmss_,
  DDMMYYYY_HHmmss_1,

  YYYYMMDDHHmm,
  YYYYMMDDHHmm1,
  YYYYMMDDHHmm_,

  YYYYMMDDHHmmss,
  YYYYMMDDHHmmss_,
  YYYYMMDD_HHmmss,
  YYYYMMDD_HHmmss_,

  YYYYMMDD_T_HHmmss,

}
String formatType(FormatType format){
  switch (format) {
    case FormatType.dd:
      return 'dd';
    case FormatType.mm:
      return 'MM';
    case FormatType.yyyy:
      return 'yyyy';
    case FormatType.hh:
      return 'hh';
    case FormatType.hhMM:
      return 'HH:mm';
    case FormatType.hhMMss:
      return 'HH:mm:ss';

    case FormatType.MMYYYY:
      return 'MM/yyyy';
    case FormatType.MMYYYY_:
      return 'MM-yyyy';

    case FormatType.YYYYMM:
      return 'yyyy/MM';
    case FormatType.YYYYMM_:
      return 'yyyy-MM';

    case FormatType.DDMMYYYY:
      return 'dd/MM/yyyy';
    case FormatType.DDMMYYYY_:
      return 'dd-MM-yyyy';

    case FormatType.DDMMYYYY_HHmmss:
      return 'dd/MM/yyyy - HH:mm:ss';
    case FormatType.DDMMYYYY_HHmmss1:
      return 'dd/MM/yyyy HH:mm:ss';

    case FormatType.DDMMYYYY_HHmmss_:
      return 'dd-MM-yyyy - HH:mm:ss';
    case FormatType.DDMMYYYY_HHmmss_1:
      return 'dd-MM-yyyy HH:mm:ss';

    case FormatType.DDMMYYYY_HHmm:
      return 'dd/MM/yyyy - HH:mm';
    case FormatType.DDMMYYYY_HHmm_:
      return 'dd-MM-yyyy - HH:mm';

    case FormatType.YYYYMMDD:
      return 'yyyy/MM/dd';
    case FormatType.YYYYMMDD_:
      return 'yyyy-MM-dd';

    case FormatType.YYYYMMDDHHmm:
      return 'yyyy/MM/dd - HH:mm';
    case FormatType.YYYYMMDDHHmm1:
      return 'yyyy/MM/dd HH:mm';
    case FormatType.YYYYMMDDHHmm_:
      return 'yyyy-MM-dd - HH:mm';

    case FormatType.YYYYMMDDHHmmss:
      return 'yyyy/MM/dd - HH:mm:ss';
    case FormatType.YYYYMMDD_HHmmss:
      return 'yyyy/MM/dd HH:mm:ss';

    case FormatType.YYYYMMDDHHmmss_:
      return 'yyyy-MM-dd - HH:mm:ss';
    case FormatType.YYYYMMDD_HHmmss_:
      return 'yyyy-MM-dd HH:mm:ss';

    case FormatType.YYYYMMDD_T_HHmmss:
      return 'yyyy-MM-ddThh:mm:ss';

    default:
      return '';
  }

}