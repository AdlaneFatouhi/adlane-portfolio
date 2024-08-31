import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/utils/project_utils.dart';
import 'dart:js' as js;

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({
    super.key,
    required this.project,
  });
  final ProjectUtils project;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 360,
      width: 260,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: CustomColor.bgLight2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            project.image,
            height: 160,
            width: 260,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
            child: Text(
              project.title,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: CustomColor.whitePrimary),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(
              project.subtitle,
              style: const TextStyle(
                  fontSize: 12.0, color: CustomColor.whiteSecondary),
            ),
          ),
          const Spacer(),
          //footer

          Container(
            color: CustomColor.bgLight1,
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            child: Row(
              children: [
                const Text(
                  "Available on",
                  style: TextStyle(
                    color: CustomColor.yellowSecondary,
                    fontSize: 10.0,
                  ),
                ),
                const Spacer(),
                if (project.androidLink != null)
                  InkWell(
                    onTap: () {
                      js.context.callMethod("open", [project.androidLink]);
                    },
                    child: Image.asset(
                      "assets/android_icon.png",
                      width: 17,
                    ),
                  ),
                if (project.iosLink != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: InkWell(
                      onTap: () {
                        js.context.callMethod("open", [project.iosLink]);
                      },
                      child: Image.asset(
                        "assets/ios_icon.png",
                        width: 19,
                      ),
                    ),
                  ),
                if (project.webLink != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 6.0),
                    child: InkWell(
                      onTap: () {
                        js.context.callMethod("open", [project.webLink]);
                      },
                      child: Image.asset(
                        "assets/web_icon.png",
                        width: 17,
                      ),
                    ),
                  ),
                if (project.githubLink != null)
                  InkWell(
                    child: Image.asset(
                      'assets/github_icon.png',
                      width: 17,
                    ),
                    onTap: () {
                      js.context.callMethod("open", [project.githubLink]);
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
