import 'package:ecommerce_api/models/wishlist_model.dart';

import '../main.dart';
import '../models/cart_model_hive.dart';

List<dynamic> cartModelList = [];
List<dynamic> wishListModelList = [];

class HiveServices {
  void addToCart({
    required String? title,
    required String? subTitle,
    required double? amount,
    required String? imgLink,
    required double? totalAmount,
    int? quantity,
  }) async {
    await box!.put(
      title,
      CartModel(
        title: title,
        subTitle: subTitle,
        amount: amount,
        totalAmount: totalAmount,
        imgLink: imgLink,
        quantity: quantity ?? 1,
      ),
    );
  }

  void addToWishList({
    required String? title,
    required String? subTitle,
    required double? amount,
    required String? imgLink,
    required int? id,
  }) async {
    await wishBox!.put(
      title,
      WishList(
        title: title,
        subTitle: subTitle,
        amount: amount,
        imgLink: imgLink,
        id: id,
      ),
    );
  }
}
