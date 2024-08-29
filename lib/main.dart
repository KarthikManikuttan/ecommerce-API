import 'package:ecommerce_api/models/cart_model_hive.dart';
import 'package:ecommerce_api/models/wishlist_model.dart';
import 'package:ecommerce_api/utils/app_color.dart';
import 'package:ecommerce_api/widgets/build_bottom_navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hive_flutter/adapters.dart';
import 'payments/create_payment_intent.dart';
import 'utils/hive_services.dart';

Box? box;
Box? wishBox;
void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CartModelAdapter());
  Hive.registerAdapter(WishListAdapter());
  box = await Hive.openBox<CartModel>('carts');
  wishBox = await Hive.openBox<WishList>('wishlist');
  cartModelList = box!.values.toList();
  wishListModelList = wishBox!.values.toList();

  Stripe.publishableKey = stripePublishableKey;

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
