import 'package:flutter/material.dart';
import 'package:topcoder_hackathon/screens/login.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: MediaQuery.of(context).size.width * 0.052,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height * 0.0242),
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.0254),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.18144,
                  width: MediaQuery.of(context).size.height * 0.18144,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height * 0.03),
                    color: Colors.white,
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height * 0.03),
                      child: Image.asset(
                        "assets/images/avatar.png",
                        height: MediaQuery.of(context).size.height * 0.18144,
                        width: MediaQuery.of(context).size.height * 0.18144,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.0427),
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                            MediaQuery.of(context).size.height * 0.0606),
                        topRight: Radius.circular(
                            MediaQuery.of(context).size.height * 0.0606),
                      ),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.054,
                    left: MediaQuery.of(context).size.width * 0.05,
                    right: MediaQuery.of(context).size.width * 0.05,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "John Doe",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 0.0121),
                        Text(
                          "@johnDoe",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.052,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.057),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Phone:",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.051,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "+254 712 345 678",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.051,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Email:",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.051,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "johndoe@gmail.com",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.051,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Address:",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.051,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "Nairobi, Kenya",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.051,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.075),
                        SizedBox(
                          width: double.infinity,
                          child: Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.height * 0.02),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                  (route) => false,
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: MediaQuery.of(context)
                                            .size
                                            .height *
                                        0.021, 
                                    horizontal: MediaQuery.of(context)
                                            .size
                                            .height *
                                        0.021),
                                child: Center(
                                  child: Text(
                                    'Logout',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: MediaQuery.of(context).size.width * 0.049,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
