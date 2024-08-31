import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'dart:js' as js;

class MainMobile extends StatelessWidget {
  const MainMobile({
    super.key,
    this.onGetinTouchTap,
  });
  final VoidCallback? onGetinTouchTap;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height / 1.1;
    return Container(
      // margin: const EdgeInsets.fromLTRB(horizontal: 40, vertical: 30),
      margin: const EdgeInsets.fromLTRB(40, 10, 40, 10),
      height: screenHeight,
      constraints: const BoxConstraints(minHeight: 590.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //image
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(colors: [
                CustomColor.scaffoldBg,
                CustomColor.scaffoldBg.withOpacity(0),
              ]).createShader(bounds);
            },
            blendMode: BlendMode.dstOut,
            child: Image.asset(
              "assets/adlane_photo.png",
              width: screenWidth,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          //intro text
          const Text(
            "Hi,\nI'm Adlane\nA Flutter/Dart Developer",
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: CustomColor.whitePrimary,
                height: 1.5),
          ),
          const SizedBox(
            height: 10,
          ),
          //button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 130,
                child: ElevatedButton(
                  onPressed:
                      //Scroll down to contact section
                      onGetinTouchTap,
                  child: const Text(
                    "Get in touch",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.yellowSecondary,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 140,
                child: ElevatedButton(
                  onPressed: () {
                    js.context
                        .callMethod("open", ["https://file.io/EkuGkGpJF8gl"]);
                    return;
                  },
                  child: const Text(
                    "Download CV",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.bgLight1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
