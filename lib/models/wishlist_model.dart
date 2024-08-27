import 'package:hive/hive.dart';
part 'wishlist_model.g.dart';

@HiveType(typeId: 1)
class WishList {
  @HiveField(0)
  final String? title;
  @HiveField(1)
  final String? subTitle;
  @HiveField(2)
  final double? amount;
  @HiveField(3)
  final String? imgLink;
  @HiveField(4)
  final int? id;

  WishList({
    required this.title,
    required this.subTitle,
    required this.amount,
    required this.imgLink,
    required this.id,
  });
}
