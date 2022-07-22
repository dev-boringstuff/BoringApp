import 'package:flutter/material.dart';

class BoringStatusProvider<T> with ChangeNotifier {
  T? status;

  void setLogStatus(T newStatus) {
    status = newStatus;
    notifyListeners();
  }
}
