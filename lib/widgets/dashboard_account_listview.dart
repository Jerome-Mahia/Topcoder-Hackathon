import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:topcoder_hackathon/data/account_data.dart';

// Widget for displaying a list of user accounts in the dashboard
class DashboardAccountListView extends StatelessWidget {
  const DashboardAccountListView({
    super.key,
    required this.formatter,
  });

  final NumberFormat formatter;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        Accounts account = yourAccounts[index];
        return ListTile(
          leading: FaIcon(
            account.accountType == 'Savings'
                ? FontAwesomeIcons.piggyBank
                : account.accountType == 'Current'
                    ? FontAwesomeIcons.moneyCheck
                    : account.accountType == 'Fixed Deposit'
                        ? FontAwesomeIcons.fileContract
                        : account.accountType == 'Nominated'
                            ? FontAwesomeIcons.userCheck
                            : FontAwesomeIcons.userLarge,
            color: Theme.of(context).colorScheme.primary,
            size: MediaQuery.of(context).size.height * 0.031,
          ),
          title: Text(
            account.accountType,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.height * 0.024,
            ),
          ),
          subtitle: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Acc. Number: ',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                TextSpan(
                  text: account.accountNumber,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          trailing: Text(
            '\$${formatter.format(account.accountBalance)}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.height * 0.024,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: yourAccounts.length,
    );
  }
}
