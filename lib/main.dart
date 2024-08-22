import 'package:ecommerce_api/models/cart_model_hive.dart';
import 'package:ecommerce_api/utils/appColor.dart';
import 'package:ecommerce_api/widgets/build_bottom_navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';

import 'screens/product_detail_page.dart';

Box? box;
void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CartModelAdapter());
  box = await Hive.openBox<CartModel>('carts');
  cartModelList = box!.values.toList();

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
