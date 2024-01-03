import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Modules/Views/Chat_Screen/Views/chat_screen.dart';
import 'Modules/Views/Home_Screen/Views/Screen/homescreen.dart';
import 'Modules/Views/Login_Screen/Views/login.dart';
import 'Modules/Views/Splash_Screen/Views/splash_screen.dart';
import 'Modules/Views/Welcome_Screen/Views/welcome_screen.dart';
import 'firebase_options.dart';

// Future<void> FCMBackGroundMessage(RemoteMessage message) async {
//   log("${message.notification?.title}");
//   log("${message.notification?.body}");
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/welcome', page: () => WelcomeScreen()),
        GetPage(name: '/login', page: () => Login()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/chat', page: () => Chat_Screen()),
      ],
    ),
  );
}
