import 'package:alubank/data/bank.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Bank model deposit testes', () {
    test('Bank model deposit should turn points into 10', () {
      final bank = BankModel();
      bank.deposit(10);
      expect(bank.points, 10);
    });

    test('Bank model deposit should turn balance into 10', () {
      final bank = BankModel();
      bank.deposit(10);
      expect(bank.balance, 10);
    });

    test('Bank model deposit should turn earned into 10', () {
      final bank = BankModel();
      bank.deposit(10);
      expect(bank.earned, 10);
    });
  });

  group('Bank model transfer testes', () {
    test('Bank model transfer should turn points into 10', () {
      final bank = BankModel();
      bank.transfer(10);
      expect(bank.points, 10);
    });

    test('Bank model transfer should turn balance into -10', () {
      final bank = BankModel();
      bank.transfer(10);
      expect(bank.balance, -10);
    });

    test('Bank model transfer should turn earned into 10', () {
      final bank = BankModel();
      bank.transfer(10);
      expect(bank.spent, 10);
    });
  });
}
