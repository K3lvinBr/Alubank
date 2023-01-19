import 'package:alubank/components/box_card.dart';
import 'package:alubank/components/color_dot.dart';
import 'package:alubank/components/content_division.dart';
import 'package:alubank/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class AccountPoints extends StatelessWidget {
  const AccountPoints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                'Ações da conta',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const BoxCard(
              boxContent: _AccountPointsContent(),
            ),
          ],
        ));
  }
}

class _AccountPointsContent extends StatelessWidget {
  const _AccountPointsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text('Pontos totais:'),
        ),
        Text(
          '3000',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          child: ContentDivision(),
        ),
        Text(
          'Objetivos:',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child:
                    ColorDot(color: ThemeColors.recentActivity['objective1']),
              ),
              const Text('Entrega grátis: 15000pts'),
            ],
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: ColorDot(color: ThemeColors.recentActivity['objective2']),
            ),
            const Text('1 mês de streaming: 30000pts')
          ],
        )
      ],
    );
  }
}
