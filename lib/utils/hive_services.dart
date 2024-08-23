import '../main.dart';
import '../models/cart_model_hive.dart';

List<dynamic> cartModelList = [];

class HiveServices {
  void addToCart({
    required String? title,
    required String? subTitle,
    required double? amount,
    required String? imgLink,
    required String? status,
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
        status: status,
      ),
    );
  }
}
