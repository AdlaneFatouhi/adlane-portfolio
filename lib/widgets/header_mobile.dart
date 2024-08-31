import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/styles/styles.dart';
import 'package:portfolio/widgets/site_logo.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({super.key, this.onLogoTap, this.onMenuTap});
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kHeaderStyle,
      height: 50.0,
      margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
      child: Row(
        children: [
          SiteLogo(
            onTap: onLogoTap,
          ),
          const Spacer(),
          IconButton(
            color: CustomColor.hintDark,
            onPressed: onMenuTap,
            icon: const Icon(Icons.view_headline_sharp),
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
