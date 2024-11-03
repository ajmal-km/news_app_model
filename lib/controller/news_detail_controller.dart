import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsDetailController with ChangeNotifier {
  bool isbookmarked = false;

  
  String formatDateTime(var dateTime) {
    return DateFormat.yMd().add_jm().format(dateTime);
  }
}
