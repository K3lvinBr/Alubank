import 'package:flutter/cupertino.dart';

class BankModel extends ChangeNotifier {
  double balance = 0;
  double spent = 0;
  double earned = 0;
  double points = 0;

  void deposit(double money) {
    balance += money;
    earned += money;
    points += money;
    notifyListeners();
  }

  void transfer(double money) {
    balance -= money;
    points += money;
    spent += money;
    notifyListeners();
  }
}
