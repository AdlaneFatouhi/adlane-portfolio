// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/size.dart';
import 'package:portfolio/constants/sns_links.dart';
import 'package:portfolio/widgets/custom_textfield.dart';
import 'dart:js' as js;
import 'package:http/http.dart' as http;

class ContactSection extends StatelessWidget {
  ContactSection({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

//the function to send an email without using firebase
  Future sendEmail() async {
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    const serviceId = "service_v4l8m1c";
    const templateId = "template_c5jriqq";
    const userId = "FUXNUZZm0Lf69vhEF";
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(
        {
          "service_id": serviceId,
          "template_id": templateId,
          "user_id": userId,
          "template_params": {
            "name": nameController.text,
            "subject": "Message coming from Portfolio Website",
            "message": messageController.text,
            "user_email": emailController.text,
          }
        },
      ),
    );
    return response.statusCode;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLight1,
      child: Column(
        children: [
          //title
          const Text(
            "Get in touch",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          ConstrainedBox(
              constraints:
                  const BoxConstraints(maxWidth: 700.0, maxHeight: 100),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth >= kMinDesktopWidth) {
                    return Row(
                      children: [
                        //Name
                        Flexible(
                          child: CustomTextfield(
                            controller: nameController,
                            hintText: "Your Name",
                          ),
                        ),
                        const SizedBox(
                          width: 25.0,
                        ),
                        //Email
                        Flexible(
                          child: CustomTextfield(
                            controller: emailController,
                            hintText: "Your Email",
                          ),
                        ),
                      ],
                    );
                  }
                  //else
                  return Column(
                    children: [
                      //Name
                      Flexible(
                        child: CustomTextfield(
                          controller: nameController,
                          hintText: "Your Name",
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      //Email
                      Flexible(
                        child: CustomTextfield(
                          controller: emailController,
                          hintText: "Your Email",
                        ),
                      ),
                    ],
                  );
                },
              )),
          const SizedBox(
            height: 25,
          ),
          //Message
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700.0),
            child: CustomTextfield(
              controller: messageController,
              hintText: "Your Message",
              maxLines: 10,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700.0),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  if (nameController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      messageController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: CustomColor.bgLight1,
                        content: const Text(
                          textAlign: TextAlign.center,
                          'Please fill the textfiels',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        action: SnackBarAction(
                          textColor: CustomColor.hintDark,
                          backgroundColor: CustomColor.scaffoldBg,
                          label: 'Ok',
                          onPressed: () {
                            // Handle undo action
                          },
                        ),
                      ),
                    );
                    nameController.clear();
                    emailController.clear();
                    messageController.clear();
                  } else {
                    sendEmail();
                    //Show a message that the message has been succesfully sent
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: CustomColor.bgLight1,
                        content: Text(
                          textAlign: TextAlign.center,
                          '${nameController.text}, Your email has been sent successfully',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        action: SnackBarAction(
                          textColor: CustomColor.hintDark,
                          backgroundColor: CustomColor.scaffoldBg,
                          label: 'Ok',
                          onPressed: () {
                            // Handle undo action
                          },
                        ),
                      ),
                    );
                    nameController.clear();
                    emailController.clear();
                    messageController.clear();
                  }
                },
                child: const Text(
                  "Get in Touch",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: CustomColor.yellowPrimary),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300.0),
            child: const Divider(),
          ),
          const SizedBox(
            height: 15.0,
          ),
          //SNS ICON BUTTON LINKS
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  js.context.callMethod("open", [SnsLinks.github]);
                },
                child: Image.asset(
                  "assets/github_icon.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod("open", [SnsLinks.facebook]);
                },
                child: Image.asset(
                  "assets/facebook_icon.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod("open", [SnsLinks.instagram]);
                },
                child: Image.asset(
                  "assets/instagram_icon.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod("open", [SnsLinks.linkedin]);
                },
                child: Image.asset(
                  "assets/linkedin_icon.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod("open", [SnsLinks.telegram]);
                },
                child: Image.asset(
                  "assets/telegram_icon.png",
                  width: 28,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Row buildnameEmailFieldDesktop() {
//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   return Row(
//     children: [
//       //Name
//       Flexible(
//         child: CustomTextfield(
//           controller: nameController,
//           hintText: "Your Name",
//         ),
//       ),
//       const SizedBox(
//         width: 25.0,
//       ),
//       //Email
//       Flexible(
//         child: CustomTextfield(
//           controller: emailController,
//           hintText: "Your Email",
//         ),
//       ),
//     ],
//   );
// }

// Column buildnameEmailFieldMobile() {
//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   return Column(
//     children: [
//       //Name
//       Flexible(
//         child: CustomTextfield(
//           controller: nameController,
//           hintText: "Your Name",
//         ),
//       ),
//       const SizedBox(
//         height: 15.0,
//       ),
//       //Email
//       Flexible(
//         child: CustomTextfield(
//           controller: emailController,
//           hintText: "Your Email",
//         ),
//       ),
//     ],
//   );
// }
