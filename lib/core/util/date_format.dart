import 'package:intl/intl.dart';

///FORMAT A
///2024.01.11
String dateFormatA(DateTime date) {
  return DateFormat("yyyy.MM.dd").format(date);
}

///FORMAT B
///2024년 1월 4일
String dateFormatB(DateTime date) {
  return DateFormat("yyyy년 M월 d일").format(date);
}
