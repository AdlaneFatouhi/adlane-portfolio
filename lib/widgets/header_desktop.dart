import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/nav_titles.dart';
import 'package:portfolio/styles/styles.dart';
import 'package:portfolio/widgets/site_logo.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key, required this.onNavMenuTap});
  final Function(int) onNavMenuTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kHeaderStyle,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      height: 60,
      width: double.maxFinite,
      child: Row(
        children: [
          SiteLogo(
            onTap: () {
              //refreshes the page
            },
          ),
          const Spacer(),
          for (int i = 0; i < navTitles.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: TextButton(
                onPressed: () {
                  onNavMenuTap(i);
                },
                child: Text(
                  navTitles[i],
                  style: const TextStyle(
                    color: CustomColor.hintDark,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
