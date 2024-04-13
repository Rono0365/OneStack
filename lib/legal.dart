import 'package:flutter/material.dart';

class legal1 extends StatelessWidget {
  const legal1({Key? key, required this.darkmode}) : super(key: key);
  final bool darkmode;
  @override
  Widget build(BuildContext context) {
    String a = """
Policy:

At OneStack, we strive to create a positive and inclusive social platform for tech students in Kenya. To ensure a safe and respectful environment, we have established the following policy:

User Conduct:

Users must engage in respectful and civil discourse, refraining from any form of harassment, hate speech, or discrimination based on race, ethnicity, gender, religion, or any other characteristic.
Users should refrain from posting or sharing any content that is offensive, obscene, or violates any applicable laws or regulations.
Users are encouraged to promote constructive discussions and help foster a supportive community.
Privacy and Security:

OneStack is committed to protecting the privacy and security of its users. Users are required to respect the privacy of others and not disclose any personal or sensitive information without consent.
Users must not engage in any activities that compromise the security of the platform or attempt to gain unauthorized access to others' accounts or data.
Users should report any security vulnerabilities or suspicious activities to the OneStack support team promptly.
Intellectual Property:

Users must respect intellectual property rights and should not infringe upon copyrights, trademarks, or any other proprietary rights.
Users should not share or distribute any content that violates intellectual property laws, including unauthorized copies of software, movies, music, or any copyrighted materials.
Moderation and Enforcement:

OneStack reserves the right to moderate content and take appropriate actions, including warning, suspending, or permanently banning users who violate the policies.
Users can report any violations or abusive behavior to the OneStack support team for review and action.

Copyright (c) Kiprono Ngetich - All Rights Reserved

""";
    return Scaffold(
      backgroundColor: darkmode?Colors.black:Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade600,
        centerTitle: true,
        title: Text("Policy",style: TextStyle(color: Colors.white),),
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Center(
              child: Container(
                  padding: EdgeInsets.all(8.0), child: Text(a.toString(),style: TextStyle(color: darkmode?Colors.white:Colors.black),)))
        ],
      )),
    );
  }
}

class legal2 extends StatelessWidget {
  legal2({Key? key, required this.darkmode}) : super(key: key);
  final bool darkmode;
  @override
  Widget build(BuildContext context) {
    String a = """
The following terms and conditions govern the use of the OneStack social platform:

Eligibility:

Users must be tech students in Kenya to join and use the OneStack platform.
Users must provide accurate and up-to-date information during the registration process.
Account Security:

Users are responsible for maintaining the security of their accounts and passwords.
Users must promptly report any unauthorized access or suspicious activities to the OneStack support team.
Content Ownership:

Users retain ownership of the content they post on OneStack.
By posting content, users grant OneStack a non-exclusive, royalty-free, and worldwide license to use, modify, reproduce, and distribute the content for the purposes of operating and promoting the platform.
Platform Changes and Availability:

OneStack reserves the right to modify, suspend, or discontinue the platform or any features at any time without prior notice.
OneStack does not guarantee uninterrupted access to the platform and is not liable for any loss or damages resulting from service interruptions.
ermination:

OneStack may terminate or suspend a user's account if they violate the policies, guidelines, or terms and conditions outlined herein.
OneStack reserves the right to terminate or suspend any account at its discretion, without prior notice or liability.
Disclaimer of Liability:

OneStack does not assume any responsibility or liability for the accuracy, reliability, or completeness of the content shared on the platform by its users.
Users are solely responsible for their interactions with other users and any actions they take based on the information or content shared on OneStack.
Indemnification:

Users agree to indemnify and hold OneStack, its affiliates, employees, and representatives harmless from any claims, damages, losses, or liabilities arising out of their use of the platform or violation of these terms and conditions.
Modifications to Terms and Conditions:

OneStack reserves the right to modify or update these terms and conditions at any time.
Users will be notified of any changes, and continued use of the platform after the modifications indicates acceptance of the updated terms and conditions.
Governing Law and Jurisdiction:

These terms and conditions shall be governed by and construed in accordance with the laws of Kenya.
Any disputes arising out of or in connection with these terms and conditions shall be subject to the exclusive jurisdiction of the courts of Kenya.
By using the OneStack social platform, users agree to comply with the policies, community guidelines, and terms and conditions outlined above. Failure to adhere to these guidelines may result in account suspension or termination.
Copyright (c) Kiprono Ngetich - All Rights Reserved



""";
    return Scaffold(
      backgroundColor: darkmode?Colors.black:Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade600,
        centerTitle: true,
        title: Text("Terms and Condition",style: TextStyle(color:Colors.white),),
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Center(
              child: Container(
                  padding: EdgeInsets.all(8.0), child: Text(a.toString(),style: TextStyle(color: darkmode?Colors.white:Colors.black),)))
        ],
      )),
    );
  }
}


class legal3 extends StatelessWidget {
  legal3({Key? key, required this.darkmode}) : super(key: key);
  final bool darkmode;
  @override
  Widget build(BuildContext context) {
    String a = """
OneStack aims to foster a vibrant and supportive community for tech students in Kenya. We have established the following guidelines to ensure a positive experience for all users:

Be Respectful:

Treat all members of the community with respect and courtesy, regardless of their opinions or backgrounds.
Avoid personal attacks, harassment, or any form of offensive language.
Encourage Learning and Collaboration:

Share knowledge, insights, and resources to help fellow students grow and succeed in their tech education.
Collaborate with others, engage in constructive discussions, and provide helpful feedback.
Be Inclusive:

Embrace diversity and inclusivity by appreciating different perspectives and experiences.
Refrain from discriminatory behavior or language that may exclude or harm others.
Keep Discussions Relevant:

Stay on topic and ensure discussions align with the purpose of the community.
Avoid spamming, excessive self-promotion, or unrelated content.
""";
    return Scaffold(
      backgroundColor: darkmode?Colors.black:Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade600,
        centerTitle: true,
        title: Text("Community Guidelines",style: TextStyle(color:Colors.white),),
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Center(
              child: Container(
                  padding: EdgeInsets.all(8.0), child: Text(a.toString(),style: TextStyle(color: darkmode?Colors.white:Colors.black),)))
        ],
      )),
    );
  }
}

