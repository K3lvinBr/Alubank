import 'package:alubank/data/bank.dart';
import 'package:alubank/themes/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: ThemeColors.headerGradient),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 80.0, 16.0, 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Consumer<BankModel>(builder: (context, value, _) {
                      return Text.rich(
                          TextSpan(text: '\$', children: <TextSpan>[
                        TextSpan(
                            text: value.balance.toString(),
                            style: Theme.of(context).textTheme.bodyLarge)
                      ]));
                    }),
                    const Text(
                      'Balanço disponivel',
                    )
                  ]),
              const Icon(
                Icons.account_circle,
                size: 42,
              ),
            ],
          ),
        ));
  }
}
