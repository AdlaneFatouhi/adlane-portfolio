import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'dart:js' as js;

class MainDesktop extends StatelessWidget {
  const MainDesktop({
    super.key,
    this.onGetinTouchDesktopTap,
  });
  final VoidCallback? onGetinTouchDesktopTap;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      height: screenSize.height / 1.2,
      constraints: const BoxConstraints(
        minHeight: 0.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Hi,\nI'm Adlane\nA Flutter Developer",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.whitePrimary,
                  height: 1.5,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: onGetinTouchDesktopTap,
                  child: const Text(
                    "Get in touch",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.yellowSecondary,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    js.context
                        .callMethod("open", ["https://file.io/EkuGkGpJF8gl"]);
                    return;
                  },
                  child: const Text(
                    "Download my CV",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.bgLight1,
                    ),
                  ),
                ),
              ),
            ],
          ),
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
              width: screenWidth / 2,
            ),
          ),
        ],
      ),
    );
  }
}
