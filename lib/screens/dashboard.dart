// ignore_for_file: non_constant_identifier_names

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:topcoder_hackathon/data/account_data.dart';
import 'package:topcoder_hackathon/main.dart';
import 'package:topcoder_hackathon/widgets/dashboard_account_listview.dart';
import 'package:topcoder_hackathon/widgets/dashboard_appbar.dart';
import 'package:topcoder_hackathon/widgets/dashboard_linechart.dart';
import 'package:topcoder_hackathon/widgets/dashboard_totals.dart';

// Main screen displaying user's dashboard with account information and transaction overview
class DashboardScreen extends StatefulWidget {
  const DashboardScreen(
      {super.key, required this.fullName, required this.userName});

  final String fullName;
  final String userName;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Formatter for number display
  final formatter = NumberFormat.decimalPattern();
  // Flag to toggle between main data and secondary data
  late bool isShowingMainData;
  // Dropdown value for selecting account type
  String dropdownValue = 'Select Account Type';
  // Controller for the account number text field
  final accountNumberController = TextEditingController();
  // Form key for the add account form
  final _addAccountFormKey = GlobalKey<FormState>();

  // Method to provide a greeting based on the time of day
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'morning';
    }
    if (hour < 17) {
      return 'afternoon';
    }
    return 'evening';
  }

  @override
  void initState() {
    super.initState();
    // Set the initial state for showing main data
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      // Set the user's name and username
      fullName = widget.fullName;
      userName = widget.userName;
    });
    return WillPopScope(
      // Handle back button press with a confirmation dialog
      onWillPop: () async {
        return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Are you sure you want to exit?',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.02,
                fontWeight: FontWeight.w500,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(
                  'No',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(
                  'Yes',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      // Main container for the dashboard screen
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: SafeArea(
          child: Scaffold(
            // Customized app bar for the dashboard
            appBar: PreferredSize(
              preferredSize:
                  Size.fromHeight(MediaQuery.of(context).size.height * 0.052),
              child: const DashboardAppbar(),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.016),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Greeting message based on the time of day and User's name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good ${greeting()} 👋',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                          ),
                        ),
                        Text(
                          fullName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    // Display total amounts and other summary information
                    DashboardTotals(formatter: formatter),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Transactions Overview',
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.0244,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Toggle between main data and secondary data
                        IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.arrowRightArrowLeft,
                            size: MediaQuery.of(context).size.height * 0.0244,
                            color: Colors.black
                                .withOpacity(isShowingMainData ? 1.0 : 0.5),
                          ),
                          onPressed: () {
                            setState(() {
                              isShowingMainData = !isShowingMainData;
                            });
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    // Display line chart based on the selected data
                    DashboardLinechart(isShowingMainData: isShowingMainData),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Your Accounts',
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.0244,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Button to add a new account
                        ElevatedButton.icon(
                          onPressed: () {
                            AddAccountPopup(context);
                          },
                          icon: const Icon(Icons.add),
                          style: ElevatedButton.styleFrom(
                            foregroundColor:
                                Theme.of(context).colorScheme.secondary,
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.height * 0.0248),
                            ),
                          ),
                          label: Text(
                            'Add',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    // List of user's accounts
                    DashboardAccountListView(formatter: formatter),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

// Function to show a pop-up dialog for adding an account.
// Returns a Future<dynamic> representing the result of the dialog.
  Future<dynamic> AddAccountPopup(BuildContext context) {
    return showAdaptiveDialog(
        context: context,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: SimpleDialog(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.height * 0.0248),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.015),
                  child: Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.01),
                    child: Form(
                      key: _addAccountFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: MediaQuery.of(context).size.height *
                                      0.055,
                                  backgroundColor: Colors.grey[200],
                                  child: Icon(
                                    Icons.account_balance,
                                    color: Theme.of(context).primaryColor,
                                    size: MediaQuery.of(context).size.height *
                                        0.055,
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                Text(
                                  "Add an Account",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.03,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          Text(
                            "Kindly fill in the details below to add an account.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.015),
                          Text(
                            'Select Account Type',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.023,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          StatefulBuilder(
                            builder: (context, setState) =>
                                DropdownButton<String>(
                              value: dropdownValue,
                              isExpanded: true,
                              iconSize:
                                  MediaQuery.of(context).size.height * 0.04,
                              underline: Container(
                                height: 0.8,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              hint: Text(
                                'Select Account Type',
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.021,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.021,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: accountTypes.map<DropdownMenuItem<String>>(
                                (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.021,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.017,
                          ),
                          Text(
                            'Enter Account Number',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.023,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextFormField(
                            controller: accountNumberController,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a valid account number';
                              }
                              return null;
                            },
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.021,
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              hintText: 'Account Number',
                              hintStyle: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.021,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.035,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Material(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(15),
                                  child: InkWell(
                                    onTap: () {
                                      if (_addAccountFormKey.currentState!
                                              .validate() &&
                                          dropdownValue !=
                                              'Select Account Type') {
                                        setState(
                                          () {
                                            yourAccounts.insert(
                                              0,
                                              Accounts(
                                                accountType: dropdownValue,
                                                accountNumber:
                                                    accountNumberController
                                                        .text,
                                                accountBalance: 0,
                                              ),
                                            );

                                            Navigator.pop(context);
                                            dropdownValue =
                                                "Select Account Type";
                                            accountNumberController.text = "";
                                          },
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: const Text(
                                              'Please fill in all the details',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .error,
                                            duration:
                                                const Duration(seconds: 1),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.02),
                                              ),
                                            ),
                                            behavior: SnackBarBehavior.floating,
                                          ),
                                        );
                                      }
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.019,
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.019),
                                      child: Center(
                                        child: Text(
                                          'Save',
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.024,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
