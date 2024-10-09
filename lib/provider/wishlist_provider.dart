import 'package:ecommerce_api/main.dart';
import 'package:ecommerce_api/utils/hive_services.dart';
import 'package:flutter/material.dart';

class WishListProvider extends ChangeNotifier {
 
  void removeItems(int index, BuildContext context) {
    wishBox?.deleteAt(index);
    wishListModelList.removeAt(index);
    Navigator.pop(context, 'Cancel');
    notifyListeners();
  }
}
