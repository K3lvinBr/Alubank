import 'package:alubank/data/bank.dart';
import 'package:alubank/screens/Home.dart';
import 'package:alubank/themes/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => BankModel(),
    child: Alubank(),
  ));
}

class Alubank extends StatelessWidget {
  const Alubank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alubank',
      theme: MyTheme,
      home: Home(),
    );
  }
}
