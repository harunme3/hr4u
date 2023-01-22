import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hr4u/pages/pages.dart';
import 'package:hr4u/utils/storage_helpers/storage_helper.dart';
import 'package:hr4u/utils/storage_helpers/storage_helper_string.dart';
import 'package:hr4u/utils/widget_helpers/common_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/color.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset("assets/images/ic-onboard.jpeg"),
            const Text(
              "Welcome!",
              style: TextStyle(
                color: textPrimary,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Boost Productivity, Coordination and\nEngagement, So Your HR Team Can\nFocus on People First",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textPrimary,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  height: 10,
                  width: MediaQuery.of(context).size.width / 5,
                ),
                const SizedBox(width: 5),
                Container(
                  decoration: BoxDecoration(
                    color: btnBlue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  height: 10,
                  width: 10,
                ),
                const SizedBox(width: 5),
                Container(
                  decoration: BoxDecoration(
                    color: btnBlue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  height: 10,
                  width: 10,
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    const TextSpan(
                        text:
                            'By accepting and proceeding, you agree to the \n'),
                    TextSpan(
                      text: 'Privacy Policy ',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Mycolors.skyBlue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => launchUrl(
                              Uri.parse(
                                  "https://www.youngstonetech.com/support/privacy-policy/"),
                              mode: LaunchMode.inAppWebView,
                            ),
                    ),
                    const TextSpan(text: 'and '),
                    TextSpan(
                      text: 'Terms of Service',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Mycolors.skyBlue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => launchUrl(
                              Uri.parse(
                                  "https://www.youngstonetech.com/support/terms-of-use/"),
                              mode: LaunchMode.inAppWebView,
                            ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CommonButton(
              onTap: () async {
                await StorageHelper.instance
                    .setBool(StorageHelperString.isUserCompleteOnBaord, true);
                Navigator.pushAndRemoveUntil(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                  (route) => false,
                );
              },
              buttonTitle: "ACCEPT & CONTINUE",
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
