import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/skill_items.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: SizedBox(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //platforms
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 450),
              child: Wrap(
                spacing: 5,
                runSpacing: 5,
                children: [
                  for (int i = 0; i < platformItems.length; i++)
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                        color: CustomColor.bgLight2,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Image.asset(
                          platformItems[i]["img"],
                          width: 26,
                        ),
                        title: Text(
                          platformItems[i]["title"],
                          style: const TextStyle(color: CustomColor.hintDark),
                        ),
                      ),
                    )
                ],
              ),
            ),
            const SizedBox(
              width: 50.0,
            ),

            //skills
            Flexible(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500.0),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
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
                            horizontal: 16.0, vertical: 12.0),
                      )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
