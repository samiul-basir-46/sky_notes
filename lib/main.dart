import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notepad/routes/route_pages.dart';
import 'package:notepad/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notepad/views/splash/splash_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColor.backgroundColor
      ),
      getPages: RoutePages.routes,
      // initialRoute: RouteNames.home,
      home: Splashscreen(),
    );

  }
}