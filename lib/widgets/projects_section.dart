import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/utils/project_utils.dart';
import 'package:portfolio/widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
      color: CustomColor.scaffoldBg,
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        children: [
          const Text(
            "Projects",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: CustomColor.whitePrimary),
          ),
          const SizedBox(
            height: 50.0,
          ),
          //SMA PROJECT
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900.0),
            child: Wrap(
              spacing: 25.0,
              runSpacing: 25.0,
              children: [
                for (int i = 0; i < smaProjectUtils.length; i++)
                  ProjectCardWidget(
                    project: smaProjectUtils[i],
                  ),
                for (int i = 0; i < footstationProjectUtils.length; i++)
                  ProjectCardWidget(
                    project: footstationProjectUtils[i],
                  ),
                for (int i = 0; i < portfolioProjectUtils.length; i++)
                  ProjectCardWidget(
                    project: portfolioProjectUtils[i],
                  ),
              ],
            ),
          )
          //FOOT STATION PROJECT
        ],
      ),
    );
  }
}
