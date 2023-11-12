import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:badges/badges.dart' as badges;
import 'package:topcoder_hackathon/data/account_data.dart';
import 'package:topcoder_hackathon/screens/profile.dart';
import 'package:topcoder_hackathon/widgets/line_chart.dart';
import 'package:topcoder_hackathon/widgets/search.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final formatter = NumberFormat.decimalPattern();
  late bool isShowingMainData;
  String dropdownValue = 'Select Account Type';
  final accountNumberController = TextEditingController();
  final _addAccountFormKey = GlobalKey<FormState>();

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
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
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
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.052),
          child: AppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            elevation: 0,
            leading: IconButton(
              onPressed: () async {
                await showSearch(
                  context: context,
                  delegate: SearchWidget(
                    onLocationSelected: (location) {},
                  ),
                );
              },
              icon: FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                size: MediaQuery.of(context).size.height * 0.03,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            actions: [
              badges.Badge(
                position: badges.BadgePosition.topEnd(top: -1, end: -3),
                badgeContent: Text(
                  '10',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.016,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.bell,
                    size: MediaQuery.of(context).size.height * 0.034,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.asset(
                    'assets/images/avatar.png',
                    height: MediaQuery.of(context).size.height * 0.065,
                    width: MediaQuery.of(context).size.height * 0.065,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.016),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      'John Doe',
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
                Row(
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
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.019,
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.006,
                            ),
                            Text(
                              '\$${formatter.format(100000)}',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.0243,
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
                                color: Theme.of(context).colorScheme.primary,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.019,
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.006,
                            ),
                            Text(
                              '\$${formatter.format(150000)}',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.0243,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Transactions Overview',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.0244,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.024,
                      bottom: MediaQuery.of(context).size.height * 0.024,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child:
                        LineChartWidget(isShowingMainData: isShowingMainData),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your Accounts',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.0244,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        showAdaptiveDialog(
                            context: context,
                            builder: (context) {
                              return BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                                child: SimpleDialog(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        MediaQuery.of(context).size.height *
                                            0.0248),
                                  ),
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(
                                          MediaQuery.of(context).size.height *
                                              0.015),
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                            MediaQuery.of(context).size.height *
                                                0.01),
                                        child: Form(
                                          key: _addAccountFormKey,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Center(
                                                child: Column(
                                                  children: [
                                                    CircleAvatar(
                                                      radius:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.055,
                                                      backgroundColor:
                                                          Colors.grey[200],
                                                      child: Icon(
                                                        Icons.account_balance,
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        size: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.055,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.02),
                                                    Text(
                                                      "Add an Account",
                                                      style: TextStyle(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.03,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.01),
                                              Text(
                                                "Kindly fill in the details below to add an account.",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.02,
                                                    color: Colors.grey[600],
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.015),
                                              Text(
                                                'Select Account Type',
                                                style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.023,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.01),
                                              StatefulBuilder(
                                                builder: (context, setState) =>
                                                    DropdownButton<String>(
                                                  value: dropdownValue,
                                                  isExpanded: true,
                                                  iconSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.04,
                                                  underline: Container(
                                                    height: 0.8,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                  ),
                                                  hint: Text(
                                                    'Select Account Type',
                                                    style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.021,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      dropdownValue = newValue!;
                                                    });
                                                  },
                                                  items: accountTypes.map<
                                                      DropdownMenuItem<String>>(
                                                    (String value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value,
                                                        child: Text(
                                                          value,
                                                          style: TextStyle(
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.021,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).toList(),
                                                ),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.017,
                                              ),
                                              Text(
                                                'Enter Account Number',
                                                style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.023,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              TextFormField(
                                                controller:
                                                    accountNumberController,
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Please enter a valid account number';
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                  border:
                                                      const UnderlineInputBorder(),
                                                  hintText: 'Account Number',
                                                  hintStyle: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.021,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.035,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: double.infinity,
                                                    child: Material(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      child: InkWell(
                                                        onTap: () {
                                                          if (_addAccountFormKey
                                                                  .currentState!
                                                                  .validate() &&
                                                              dropdownValue !=
                                                                  'Select Account Type') {
                                                            setState(
                                                              () {
                                                                yourAccounts
                                                                    .insert(
                                                                  0,
                                                                  Accounts(
                                                                    accountType:
                                                                        dropdownValue,
                                                                    accountNumber:
                                                                        accountNumberController
                                                                            .text,
                                                                    accountBalance:
                                                                        0,
                                                                  ),
                                                                );

                                                                Navigator.pop(
                                                                    context);
                                                                dropdownValue =
                                                                    "Select Account Type";
                                                                accountNumberController
                                                                    .text = "";
                                                              },
                                                            );
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content:
                                                                    const Text(
                                                                  'Please fill in all the details',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ),
                                                                backgroundColor:
                                                                    Theme.of(
                                                                            context)
                                                                        .colorScheme
                                                                        .error,
                                                                duration:
                                                                    const Duration(
                                                                        seconds:
                                                                            1),
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius.circular(MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.02),
                                                                  ),
                                                                ),
                                                                behavior:
                                                                    SnackBarBehavior
                                                                        .floating,
                                                              ),
                                                            );
                                                          }
                                                        },
                                                        child: Padding(
                                                          padding: EdgeInsets.symmetric(
                                                              vertical: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.019,
                                                              horizontal:
                                                                  MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.019),
                                                          child: Center(
                                                            child: Text(
                                                              'Save',
                                                              style: TextStyle(
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .secondary,
                                                                fontSize: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.024,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
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
                      },
                      icon: const Icon(Icons.add),
                      style: ElevatedButton.styleFrom(
                        foregroundColor:
                            Theme.of(context).colorScheme.secondary,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.height * 0.0248),
                        ),
                      ),
                      label: Text(
                        'Add',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                ListView.separated(
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
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            TextSpan(
                              text: account.accountNumber,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.tertiary,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
