import 'package:flutter/material.dart';
import 'package:topcoder_hackathon/constants/screen_constants.dart';
import 'package:topcoder_hackathon/widgets/profile_overlay_stack.dart';

// The ProfileScreen widget represents the user's profile screen, displaying user information and interactions.
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: SafeArea(
        child: Scaffold(
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
                  SizedBox(
                    height: isMediumMobile(context)
                        ? MediaQuery.of(context).size.height * 0.0242
                        : isLargeMobile(context)
                            ? MediaQuery.of(context).size.height * 0.08228
                            : MediaQuery.of(context).size.height *
                                0.074, // Tablet size
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.0254),
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
                            height:
                                MediaQuery.of(context).size.height * 0.18144,
                            width: MediaQuery.of(context).size.height * 0.18144,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: isMediumMobile(context)
                        ? MediaQuery.of(context).size.height * 0.0427
                        : isLargeMobile(context)
                            ? MediaQuery.of(context).size.height * 0.05
                            : MediaQuery.of(context).size.height *
                                0.0456, // Tablet size
                  ),
                  const ProfileOverlayStack(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
