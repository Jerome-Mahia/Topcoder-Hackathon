import 'package:flutter/material.dart';
import 'package:topcoder_hackathon/data/profile_data.dart';

// This widget builds a ListView of profile details using the data from 'profileDetails'.
class ProfileDetailsListview extends StatelessWidget {
  const ProfileDetailsListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: profileDetails.length,
      itemBuilder: (context, index) {
        var detail = profileDetails[index];
        return Container(
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * 0.025,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                detail["title"],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.051,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                detail["value"],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.051,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
