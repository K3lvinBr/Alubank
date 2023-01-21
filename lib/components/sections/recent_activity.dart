import 'package:alubank/components/box_card.dart';
import 'package:alubank/components/color_dot.dart';
import 'package:alubank/components/content_division.dart';
import 'package:alubank/themes/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/bank.dart';

class RecentActivity extends StatelessWidget {
  const RecentActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: BoxCard(
          boxContent: _RecentActivityContent(
        key: Key('testKey'),
      )),
    );
  }
}

class _RecentActivityContent extends StatefulWidget {
  const _RecentActivityContent({Key? key}) : super(key: key);

  @override
  State<_RecentActivityContent> createState() => _RecentActivityContentState();
}

class _RecentActivityContentState extends State<_RecentActivityContent> {
  num spendLimit = 432.90;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: ColorDot(color: ThemeColors.recentActivity['spent']),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Saída'),
                    Consumer<BankModel>(builder: (context, value, _) {
                      return Text('\$${value.spent.toString()}',
                          style: Theme.of(context).textTheme.bodyLarge);
                    })
                  ],
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: ColorDot(color: ThemeColors.recentActivity['income']),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Entrada'),
                    Consumer<BankModel>(builder: (context, value, _) {
                      return Text('\$${value.earned.toString()}',
                          style: Theme.of(context).textTheme.bodyLarge);
                    })
                  ],
                )
              ],
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
          child: Text('Limite de gastos \$$spendLimit'),
        ),
        Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: Consumer<BankModel>(builder: (context, value, _) {
              return LinearProgressIndicator(
                value: value.spent / spendLimit,
                minHeight: 8,
              );
            })),
        const Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: ContentDivision(),
        ),
        const Text(
            'Esse mês você gastou \$1500.00 com jogos. Tente abaixar esse custo!'),
        TextButton(
            onPressed: () {},
            child: const Text(
              'Diga-me como!',
              style: TextStyle(fontSize: 16),
            ))
      ],
    );
  }
}
