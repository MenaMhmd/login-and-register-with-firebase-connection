import 'package:flutter/material.dart';

class Adminmode extends ChangeNotifier
{
  bool isAdmin=false;
  changeisAdmin(bool value)
  {
   isAdmin=value;
   notifyListeners();
  }
}