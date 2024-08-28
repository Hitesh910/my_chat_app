import 'package:flutter/material.dart';
import 'package:mychat_app/screen/home/view/home_screen.dart';
import 'package:mychat_app/screen/login/view/login_screen.dart';
import 'package:mychat_app/screen/profile/view/profile_screen.dart';
import 'package:mychat_app/screen/register/view/register_screen.dart';
import 'package:mychat_app/screen/splash/view/splash_screen.dart';

Map<String,WidgetBuilder> app_routes = {
  "/":(context) => const SplashScreen(),
"/home":(context) => const HomeScreen(),
  "/login":(context) =>const LoginScreen(),
  "/register":(context) =>const RegisterScreen(),
  "/profile":(context) => const ProfileScreen(),
};