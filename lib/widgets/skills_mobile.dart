import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/skill_items.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 600.0),
      child: Column(
        children: [
          //platforms
          for (int i = 0; i < platformItems.length; i++)
            Container(
              margin: const EdgeInsets.only(bottom: 5.0),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: CustomColor.bgLight2,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                leading: Image.asset(
                  platformItems[i]["img"],
                  width: 26,
                ),
                title: Text(
                  platformItems[i]["title"],
                  style: const TextStyle(color: CustomColor.hintDark),
                ),
              ),
            ),
          const SizedBox(
            height: 10,
          ),
          Wrap(
            spacing: 15.0,
            runSpacing: 5.0,
            alignment: WrapAlignment.center,
            children: [
              for (int i = 0; i < skillItems.length; i++)
                Chip(
                  backgroundColor: CustomColor.bgLight2,
                  label: Text(
                    skillItems[i]["title"],
                    style: const TextStyle(
                      color: CustomColor.hintDark,
                    ),
                  ),
                  avatar: Image.asset(skillItems[i]["img"]),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                )
            ],
          ),
        ],
      ),
    );
  }
}
