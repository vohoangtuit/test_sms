import 'dart:convert';

class ReceivedSMS{
  String? from;
  String? datetime;
  String? content;
  String? yearMonthDay;
  String? yearMonthDayHHMMSS;


  ReceivedSMS({this.from, this.datetime, this.content, this.yearMonthDay,
      this.yearMonthDayHHMMSS});

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['from'] = from;
    data['datetime'] = datetime;
    data['content'] = content;
    data['yearMonthDay'] = yearMonthDay;
    data['yearMonthDayHHMMSS'] = yearMonthDayHHMMSS;
    return data;
  }
  ReceivedSMS.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    datetime = json['datetime'];
    content = json['content'];
    yearMonthDay = json['yearMonthDay'];
    yearMonthDayHHMMSS = json['yearMonthDayHHMMSS'];
  }
  factory ReceivedSMS.fromString(String data){
    var _json = jsonDecode(data) as Map;
    //  print('_json $_json');
    return ReceivedSMS(
      from :_json['from'],
      datetime :_json['datetime'],
      content :_json['content'],
      yearMonthDay :_json['yearMonthDay'],
      yearMonthDayHHMMSS :_json['yearMonthDayHHMMSS'],
    );
  }

  @override
  String toString() {
    return '{"from": "$from", "datetime": "$datetime", "content": "$content", "yearMonthDay": "$yearMonthDay", "yearMonthDayHHMMSS": "$yearMonthDayHHMMSS"}';
  }
}