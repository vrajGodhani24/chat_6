import 'package:chat_app_3/modules/utils/helper/notication_helper/local_notification_helper.dart';
import 'package:flutter/material.dart';

import '../../../utils/constant/constant.dart';
import 'Components/Widgets/Buttons/buttons.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();

    LocalNotificationHelper.localNotificationHelper.initLocalNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Form(
          key: Constant.formKey,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: Constant.email_con,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "enter valid email";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) {
                        Constant.email = val;
                      },
                      decoration: const InputDecoration(
                        hintText: "enter email here..",
                        // border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: Constant.password_con,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "enter valid password";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) {
                        Constant.password = val;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "enter password here..",
                        // border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              //login button
              Buttons.loginButton(),
              SizedBox(
                height: 10,
              ),
              //sign up Button
              Buttons.signupButton(),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  await LocalNotificationHelper.localNotificationHelper
                      .showSimpleNotification();
                },
                child: const Text("Simple Notification"),
              ),
              ElevatedButton(
                onPressed: () async {
                  await LocalNotificationHelper.localNotificationHelper
                      .showScheduleNotification();
                },
                child: const Text("Schedule Notification"),
              ),
              ElevatedButton(
                onPressed: () async {
                  await LocalNotificationHelper.localNotificationHelper
                      .showBigPictureNotification();
                },
                child: const Text("Big Picture Notification"),
              ),
              ElevatedButton(
                onPressed: () async {
                  await LocalNotificationHelper.localNotificationHelper
                      .showMediaNotification();
                },
                child: const Text("Media Style Notification"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
