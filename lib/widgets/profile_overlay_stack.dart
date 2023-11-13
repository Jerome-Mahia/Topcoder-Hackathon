import 'package:flutter/material.dart';
import 'package:topcoder_hackathon/constants/screen_constants.dart';
import 'package:topcoder_hackathon/main.dart';
import 'package:topcoder_hackathon/widgets/buttons.dart';
import 'package:topcoder_hackathon/widgets/profile_details_listview.dart';

// Widget representing the overlay stack for displaying user profile details.
class ProfileOverlayStack extends StatelessWidget {
  const ProfileOverlayStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft:
                  Radius.circular(MediaQuery.of(context).size.height * 0.0606),
              topRight:
                  Radius.circular(MediaQuery.of(context).size.height * 0.0606),
            ),
            color: Theme.of(context).primaryColor,
          ),
        ),
        Positioned.fill(
          top: isMediumMobile(context)
              ? MediaQuery.of(context).size.height * 0.054
              : isLargeMobile(context)
                  ? MediaQuery.of(context).size.height * 0.054
                  : MediaQuery.of(context).size.height * 0.02, // Tablet size
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fullName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.1,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.0121),
              Text(
                "@$userName",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.052,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.057),
              const ProfileDetailsListview(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              const LogoutButton(),
            ],
          ),
        ),
      ],
    );
  }
}

