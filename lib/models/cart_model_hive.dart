import 'package:hive/hive.dart';
part 'cart_model_hive.g.dart';

@HiveType(typeId: 0)
class CartModel {
  @HiveField(0)
  final String? title;
  @HiveField(1)
  final String? subTitle;
  @HiveField(2)
  final double? amount;
  @HiveField(3)
  final int? quantity;
  @HiveField(4)
  final String? imgLink;
  @HiveField(5)
  final String? status;
  @HiveField(6)
  final double? totalAmount;

  CartModel({
    required this.title,
    required this.subTitle,
    required this.amount,
    required this.quantity,
    required this.imgLink,
    required this.status,
    required this.totalAmount,
  });
}
