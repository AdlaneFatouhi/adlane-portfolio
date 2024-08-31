// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/size.dart';
import 'package:portfolio/widgets/contact_section.dart';
import 'package:portfolio/widgets/drawer_mobile.dart';
import 'package:portfolio/widgets/footer.dart';
import 'package:portfolio/widgets/header_desktop.dart';
import 'package:portfolio/widgets/header_mobile.dart';
import 'package:portfolio/widgets/main_desktop.dart';
import 'package:portfolio/widgets/main_mobile.dart';
import 'package:portfolio/widgets/projects_section.dart';
import 'package:portfolio/widgets/skills_desktop.dart';
import 'package:portfolio/widgets/skills_mobile.dart';
import 'dart:js' as js;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: CustomColor.scaffoldBg,
        endDrawer: constraints.maxWidth >= kMinDesktopWidth
            ? null
            : DrawerMobile(
                onNavItemTap: (int navIndex) {
                  scrollToSection(navIndex);
                  scaffoldKey.currentState?.closeEndDrawer();
                },
              ),
        body: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              if (constraints.maxWidth >= kMinDesktopWidth)
                HeaderDesktop(
                  onNavMenuTap: (int navIndex) {
                    //call function
                    scrollToSection(navIndex);
                  },
                )
              else
                HeaderMobile(
                  onMenuTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                  onLogoTap: () {},
                ),
              SizedBox(
                key: navbarKeys.first,
              ),
              //MAIN

              if (constraints.maxWidth >= kMinDesktopWidth)
                MainDesktop(
                  onGetinTouchDesktopTap: () {
                    scrollToSection(3);
                  },
                )
              else
                MainMobile(onGetinTouchTap: () {
                  scrollToSection(3);
                }),
              //SKILLS
              Container(
                key: navbarKeys[1],
                height: screenHeight / 1.2,
                width: screenWidth,
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                color: CustomColor.bgLight1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //title
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 20.0,
                      ),
                      child: Text(
                        "What I Can Do",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.whitePrimary,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //platforms and skills
                    if (constraints.maxWidth >= kMedDesktopWidth)
                      const SkillsDesktop()
                    else
                      const SkillsMobile(),
                  ],
                ),
              ),
              //PROJECTS

              ProjectsSection(
                key: navbarKeys[2],
              ),
              const SizedBox(
                height: 40,
              ),

              //CONTACT
              SizedBox(
                width: screenWidth,
                child: ContactSection(
                  key: navbarKeys[3],
                ),
              ),
              //FOOTER
              const Footer(),
            ],
          ),
        ),
      );
    });
  }

  void scrollToSection(
    int navIndex,
  ) {
    if (navIndex == 4) {
      //open the CV page
      js.context.callMethod("open", ["https://file.io/EkuGkGpJF8gl"]);
      return;
    }
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(
        milliseconds: 500,
      ),
      curve: Curves.easeInOut,
    );
  }
}
