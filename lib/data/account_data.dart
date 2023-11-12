class Accounts {
  final String accountType;
  final String accountNumber;
  final int accountBalance;

  Accounts({
    required this.accountType,
    required this.accountNumber,
    required this.accountBalance,
  });
}

List<Accounts> yourAccounts = [
  Accounts(
    accountType: 'Savings',
    accountNumber: '1234567890',
    accountBalance: 10000,
  ),
  Accounts(
    accountType: 'Current',
    accountNumber: '0987654321',
    accountBalance: 5000000,
  ),
  Accounts(
    accountType: 'Fixed Deposit',
    accountNumber: '1234567890',
    accountBalance: 25800,
  ),
  Accounts(
    accountType: 'Nominated',
    accountNumber: '0987654321',
    accountBalance: 195,
  ),
  Accounts(
    accountType: 'Personal',
    accountNumber: '1234567890',
    accountBalance: 179421,
  ),
];

List<String> accountTypes = [
  'Select Account Type',
  'Savings',
  'Current',
  'Fixed Deposit',
  'Nominated',
  'Personal',
];
