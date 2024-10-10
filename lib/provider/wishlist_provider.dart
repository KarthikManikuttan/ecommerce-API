import 'package:ecommerce_api/main.dart';
import 'package:ecommerce_api/utils/app_color.dart';
import 'package:ecommerce_api/utils/cart_services.dart';
import 'package:ecommerce_api/utils/hive_services.dart';
import 'package:ecommerce_api/widgets/build_text_widget.dart';
import 'package:flutter/material.dart';

class WishListProvider extends ChangeNotifier {

  bool isWishListAdded = false;

  void checkWishListStatus(int productId) {
    isWishListAdded = CartServices().isAdded(productId);
    notifyListeners();
  }

  void removeItems({required int index, required BuildContext context}) {
    wishBox?.deleteAt(index);
    wishListModelList.removeAt(index);
    Navigator.pop(context, 'Cancel');
    notifyListeners();
  }

  void removeFromWishList({
    
    required int isAddedIndex,
    required BuildContext context,
  }) {
    wishBox?.deleteAt(isAddedIndex);
    wishListModelList.removeAt(isAddedIndex);
    isWishListAdded = false;
    final snackBar = SnackBar(
      duration: const Duration(seconds: 1),
      backgroundColor: AppColors().primaryColors,
      content: const BuildTextWidget(
        text: "Product has been removed to your favourites!",
        color: Colors.white,
        weight: FontWeight.w700,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    notifyListeners();
  }

  void addToWishList({
    required String? title,
    required String? subTitle,
    required double? amount,
    required String? imgLink,
    required int? id,
    required BuildContext context,
  }) {
    HiveServices().addToWishList(
      title: title,
      subTitle: subTitle,
      amount: amount,
      imgLink: imgLink,
      id: id,
    );

    wishListModelList = wishBox!.values.toList();

    final snackBar = SnackBar(
      duration: const Duration(seconds: 1),
      backgroundColor: AppColors().primaryColors,
      content: const BuildTextWidget(
        text: "Product has been added to your favourites!",
        color: Colors.white,
        weight: FontWeight.w700,
      ),
    );
    isWishListAdded = true;

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    notifyListeners();
  }
}
