import 'package:alubank/components/box_card.dart';
import 'package:alubank/data/bank.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountActions extends StatefulWidget {
  const AccountActions({Key? key}) : super(key: key);

  @override
  State<AccountActions> createState() => _AccountActionsState();
}

class _AccountActionsState extends State<AccountActions> {
  double money = 10;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              'Ações da conta',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    Provider.of<BankModel>(context, listen: false)
                        .deposit(money);
                  },
                  child: const BoxCard(
                      boxContent: _AccountActionsContent(
                    icon: Icon(Icons.account_balance_wallet),
                    text: 'Depositar',
                  ))),
              InkWell(
                  onTap: () {
                    Provider.of<BankModel>(context, listen: false)
                        .transfer(money);
                  },
                  child: const BoxCard(
                      boxContent: _AccountActionsContent(
                    icon: Icon(Icons.cached),
                    text: 'Transferir',
                  ))),
              InkWell(
                  onTap: () {},
                  child: const BoxCard(
                      boxContent: _AccountActionsContent(
                    icon: Icon(Icons.center_focus_strong),
                    text: 'Ler',
                  )))
            ],
          )
        ],
      ),
    );
  }
}

class _AccountActionsContent extends StatelessWidget {
  final Icon icon;
  final String text;
  const _AccountActionsContent(
      {Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: icon,
          ),
          Text(text)
        ],
      ),
    );
  }
}
