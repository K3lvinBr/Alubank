import 'package:alubank/components/box_card.dart';
import 'package:alubank/data/bank.dart';
import 'package:alubank/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('My widget has a text "Saída"', ((tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => BankModel(),
        child: const MaterialApp(
          home: Home(),
        ),
      ),
    );
    final spentFinder = find.text('Saída');

    expect(spentFinder, findsOneWidget);
  }));

  testWidgets('finds a LinearProgressIndicator', (tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => BankModel(),
        child: const MaterialApp(
          home: Home(),
        ),
      ),
    );
    final linearProgressIndicatorFinder = find.byType(LinearProgressIndicator);

    expect(linearProgressIndicatorFinder, findsOneWidget);
  });

  testWidgets('finds a _RecentActivityContent', ((tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => BankModel(),
        child: const MaterialApp(
          home: Home(),
        ),
      ),
    );
    final recentActivityContentFinder = find.byKey(const Key('testKey'));

    expect(recentActivityContentFinder, findsOneWidget);
  }));

  testWidgets('finds 5 BoxCards', (tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => BankModel(),
        child: const MaterialApp(
          home: Home(),
        ),
      ),
    );
    final boxCardFinder = find.byWidgetPredicate((widget) {
      if (widget is BoxCard) {
        return true;
      } else {
        return false;
      }
    });
    expect(boxCardFinder, findsNWidgets(5));
  });

  testWidgets('When tap Deposit should upload earned in 10', (tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => BankModel(),
        child: const MaterialApp(
          home: Home(),
        ),
      ),
    );
    await tester.tap(find.text('Depositar'));
    await tester.pumpAndSettle();

    expect(find.text('\$10.0'), findsWidgets);
  });
}
