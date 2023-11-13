import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:topcoder_hackathon/screens/profile.dart';
import 'package:topcoder_hackathon/widgets/search_widget.dart';
import 'package:badges/badges.dart' as badges;

// Custom AppBar widget for the dashboard, including search functionality,
// notification badge, and user profile image.
class DashboardAppbar extends StatelessWidget {
  const DashboardAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 0,
      leading: IconButton(
        onPressed: () async {
          await showSearch(
            context: context,
            delegate: SearchWidget(
              onItemSelected: (location) {},
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
    );
  }
}
