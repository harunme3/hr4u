import 'package:flutter/material.dart';
import 'package:hr4u/utils/validators/my_validators.dart';
import 'package:hr4u/utils/widget_helpers/common_button.dart';
import 'package:provider/provider.dart';

import '../components/color.dart';
import '../api_models/loginProviderModel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => LoginProviderModel(),
        child: Consumer<LoginProviderModel>(builder: (context, myModel, child) {
          return Stack(children: [
            Container(
              color: Colors.white,
              child: SafeArea(
                bottom: false,
                child: Scaffold(
                    body: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(color: white),
                  child: Form(
                    key: _loginFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // const SizedBox(
                        //   height: 50,
                        // ),
                        // InkWell(
                        //   onTap: () => Navigator.pop(context),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     children: const <Widget>[
                        //       SizedBox(
                        //         width: 20,s
                        //       ),
                        //       Icon(Icons.arrow_back_ios, color: oxfordBlue),
                        //       SizedBox(
                        //         width: 5,
                        //       ),
                        //       Text(
                        //         "BACK",
                        //         style: TextStyle(
                        //             color: oxfordBlue,
                        //             fontSize: 20,
                        //             fontWeight: FontWeight.bold),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image.asset(
                                  "assets/images/ic-onboard.jpeg",
                                  width:
                                      MediaQuery.of(context).size.width / 1.25,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color(0xFFE9F3FF),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(60),
                                    topRight: Radius.circular(60))),
                            child: Padding(
                              padding: const EdgeInsets.all(30),
                              child: Column(
                                children: <Widget>[
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            child: Text(
                                              "Login to your Account",
                                              style: TextStyle(
                                                color: kPrimaryBlueColor,
                                                fontSize: 25,
                                              ),
                                            ),
                                          )),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        child: TextFormField(
                                          controller: myModel.emailController,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: white,
                                            hintText: "User Name",
                                            hintStyle: const TextStyle(
                                                color: Colors.grey),
                                            // errorBorder: OutlineInputBorder(
                                            //   borderRadius:
                                            //       BorderRadius.circular(10.0),
                                            //   borderSide: BorderSide(
                                            //     color: Color(0xFFE2202C),
                                            //   ),
                                            // ),
                                            // enabledBorder: OutlineInputBorder(
                                            //   borderRadius:
                                            //       BorderRadius.circular(10.0),
                                            //   borderSide: BorderSide(
                                            //     color: Color(0xFFE2202C),
                                            //   ),
                                            // ),

                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: const BorderSide(
                                                width: 0,
                                                style: BorderStyle.none,
                                              ),
                                            ),
                                          ),
                                          validator: (String? value) {
                                            return MyValidator.validateEmail(
                                                value);
                                          },
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        child: TextFormField(
                                          obscureText: true,
                                          controller:
                                              myModel.passwordController,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: white,
                                            hintText: "Password",
                                            hintStyle: const TextStyle(
                                                color: Colors.grey),

                                            // errorBorder: OutlineInputBorder(
                                            //   borderRadius:
                                            //       BorderRadius.circular(10.0),
                                            //   borderSide: BorderSide(
                                            //     color: Color(0xFFE2202C),
                                            //   ),
                                            // ),
                                            // enabledBorder: OutlineInputBorder(
                                            //   borderRadius:
                                            //       BorderRadius.circular(10.0),
                                            //   borderSide: BorderSide(
                                            //     color: Color(0xFFE2202C),
                                            //   ),
                                            // ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: const BorderSide(
                                                width: 0,
                                                style: BorderStyle.none,
                                              ),
                                            ),
                                          ),
                                          validator: (String? value) {
                                            return MyValidator.validatePassword(
                                                value);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  CommonButton(
                                    onTap: () async {
                                      if (_loginFormKey.currentState
                                              ?.validate() ??
                                          false) {
                                        await myModel.login(context);
                                      }
                                    },
                                    buttonTitle: "Login",
                                    margin: const EdgeInsets.all(10),
                                    buttonColor: kPrimaryBlueColor,
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text("Forgot Password?",
                                          style: TextStyle(
                                            color: kPrimaryBlueColor,
                                            fontSize: 18,
                                          )),
                                    ),
                                  ),
                                  const Spacer(),
                                  Text.rich(
                                    textAlign: TextAlign.center,
                                    TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: '© 2023 Copyright ',
                                          style: TextStyle(
                                            color: Color(0xFF777777),
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'HR4U™.',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: kPrimaryBlueColor),
                                        ),
                                        const TextSpan(
                                          text: ' All right reserved.',
                                          style: TextStyle(
                                            color: Color(0xFF777777),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 5)
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
              ),
            ),
            if (myModel.loading)
              const Opacity(
                opacity: 0.8,
                child: ModalBarrier(dismissible: false, color: Colors.black),
              ),
            if (myModel.loading)
              const Center(
                child: CircularProgressIndicator(),
              ),
          ]);
        }));
  }
}
