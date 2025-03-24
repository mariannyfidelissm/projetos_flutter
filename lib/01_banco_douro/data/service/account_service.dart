import '../../domain/models/account.dart';
import 'dart:async';

class AccountService {
  final List<Account> _accounts = [
    Account(
      id: "IDEXP",
      name: "Marianny",
      lastName: "Fidelis",
      balance: 412.8,
      accountType: "Brigadeiro",
    ),
  ];

  Future<List<Account>> fetchAccounts() async {
    // Simula um delay de API
    await Future.delayed(const Duration(seconds: 1));
    return List.from(_accounts);
  }

  Future<void> addAccount(Account account) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _accounts.add(account);
  }
}