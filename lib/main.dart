import 'package:ecommerce_api/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/build_bottom_navbar_widget.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce API',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors().primaryColors),
        useMaterial3: true,
      ),
      home: const BuildBottomNavbarWidget(),
    );
  }
}
