import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grand_edu/data/test.dart';
import 'package:grand_edu/services/auth_service.dart';
import 'package:grand_edu/ui/pages/login/Screens/Login/login_screen.dart';
import 'package:grand_edu/ui/pages/login/constants.dart';

import 'ui/pages/bnb/imports.dart';

const kRed = Color(0xff900C3F);
const kPink = Color(0xffFF5733);
const kGreen = Color(0xff196F3D);
const kGreen2 = Color(0xffDAF7A6);
const kGold = Color(0xffffc800);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: kPrimaryColor,
            shape: const StadiumBorder(),
            maximumSize: const Size(double.infinity, 56),
            minimumSize: const Size(double.infinity, 56),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: kPrimaryLightColor,
          iconColor: kPrimaryColor,
          prefixIconColor: kPrimaryColor,
          contentPadding: EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      home: StreamBuilder<User?>(
        stream: auth.stream(),
        builder: (context, snapshot) {
          print(snapshot.data?.email);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: kPrimaryLightColor,
              alignment: Alignment.center,
              child: const SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          } else if (snapshot.hasData) {
            return const BNB();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
