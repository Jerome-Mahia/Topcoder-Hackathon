import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Widget displaying total debit and credit values in a row with formatted currency
class DashboardTotals extends StatelessWidget {
  const DashboardTotals({
    super.key,
    required this.formatter,
  });

  final NumberFormat formatter;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.height * 0.018,
              ),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total Debit',
                  style: TextStyle(
                    color:
                        Theme.of(context).colorScheme.secondary,
                    fontSize:
                        MediaQuery.of(context).size.height *
                            0.019,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.006,
                ),
                Text(
                  '\$${formatter.format(100000)}',
                  style: TextStyle(
                    color:
                        Theme.of(context).colorScheme.secondary,
                    fontSize:
                        MediaQuery.of(context).size.height *
                            0.0243,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.height * 0.018,
              ),
              color: Theme.of(context).colorScheme.tertiary,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total Credit',
                  style: TextStyle(
                    color:
                        Theme.of(context).colorScheme.primary,
                    fontSize:
                        MediaQuery.of(context).size.height *
                            0.019,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.006,
                ),
                Text(
                  '\$${formatter.format(150000)}',
                  style: TextStyle(
                    color:
                        Theme.of(context).colorScheme.primary,
                    fontSize:
                        MediaQuery.of(context).size.height *
                            0.0243,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}