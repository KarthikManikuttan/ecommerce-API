import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../main.dart';
import '../models/cart_model_hive.dart';
import '../utils/app_color.dart';
import '../utils/hive_services.dart';
import 'build_circle_icon_button_widget.dart';
import 'build_image_widget.dart';
import 'build_text_widget.dart';

class CartlistviewWidget extends StatefulWidget {
  final VoidCallback callback;
  const CartlistviewWidget({super.key, required this.callback});

  @override
  State<CartlistviewWidget> createState() => _CartlistviewWidgetState();
}

class _CartlistviewWidgetState extends State<CartlistviewWidget> {
  double getNumber(double input, {int precision = 2}) =>
      double.parse('$input'.substring(0, '$input'.indexOf('.') + precision + 1));

  @override
  Widget build(BuildContext context) {
    void doNothing(BuildContext context) {}
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.grey[400],
          thickness: 0.5,
        );
      },
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      shrinkWrap: true,
      itemCount: cartModelList.length,
      reverse: true,
      itemBuilder: (context, index) {
        return Slidable(
          key: const ValueKey(0),
          endActionPane: ActionPane(
            extentRatio: 0.3,
            motion: const ScrollMotion(),
            dismissible: DismissiblePane(onDismissed: () {}),
            children: [
              SlidableAction(
                onPressed: doNothing,
                backgroundColor: const Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
                autoClose: true,
              ),
            ],
          ),
          child: SizedBox(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Container(
                              height: 105,
                              width: 105,
                              decoration: BoxDecoration(
                                color: AppColors().greyColors,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: BuildImageWidget(
                                imgLink: cartModelList[index].imgLink!,
                                height: 100,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: SizedBox(
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: BuildTextWidget(
                                        text: cartModelList[index].title,
                                        weight: FontWeight.w700,
                                      ),
                                    ),
                                    BuildCircleIconButtonWidget(
                                      onPressed: () {
                                        box?.deleteAt(index);
                                        cartModelList.removeAt(index);
                                        setState(() {});
                                        widget.callback();
                                      },
                                      imgLink: "https://img.icons8.com/ios/50/delete-sign--v1.png",
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                  ],
                                ),
                                BuildTextWidget(
                                  text: cartModelList[index].status,
                                  weight: FontWeight.w700,
                                  color: AppColors().primaryColors,
                                  size: 13,
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    BuildTextWidget(
                                      text: '\$ ${cartModelList[index].totalAmount.toString()}',
                                      weight: FontWeight.w700,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          height: 30,
                                          width: 30,
                                          child: IconButton(
                                            highlightColor: Colors.transparent,
                                            padding: EdgeInsets.zero,
                                            iconSize: 15,
                                            onPressed: () {
                                              int quantity = cartModelList[index].quantity;
                                              quantity <= 1
                                                  ? quantity = 1
                                                  : quantity = cartModelList[index].quantity - 1;

                                              setState(() {
                                                HiveServices().addToCart(
                                                    title: cartModelList[index].title,
                                                    subTitle: cartModelList[index].subTitle,
                                                    amount: cartModelList[index].amount,
                                                    imgLink: cartModelList[index].imgLink,
                                                    status: cartModelList[index].status,
                                                    quantity: quantity,
                                                    totalAmount:
                                                        cartModelList[index].amount * quantity);

                                                cartModelList[index] = CartModel(
                                                  title: cartModelList[index].title,
                                                  subTitle: cartModelList[index].subTitle,
                                                  amount: getNumber(
                                                      cartModelList[index].amount * quantity),
                                                  imgLink: cartModelList[index].imgLink,
                                                  status: cartModelList[index].status,
                                                  quantity: quantity,
                                                  totalAmount:
                                                      cartModelList[index].amount * quantity,
                                                );
                                              });
                                            },
                                            icon: const Center(
                                              child: Icon(
                                                Icons.remove,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: Center(
                                            child: BuildTextWidget(
                                              text: cartModelList[index].quantity.toString(),
                                              weight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(
                                              color: AppColors().primaryColors,
                                              width: 1,
                                            ),
                                          ),
                                          height: 30,
                                          width: 30,
                                          child: IconButton(
                                            highlightColor: Colors.transparent,
                                            padding: EdgeInsets.zero,
                                            iconSize: 15,
                                            onPressed: () {
                                              int quantity = cartModelList[index].quantity + 1;

                                              setState(() {
                                                HiveServices().addToCart(
                                                  title: cartModelList[index].title,
                                                  subTitle: cartModelList[index].subTitle,
                                                  amount: cartModelList[index].amount,
                                                  imgLink: cartModelList[index].imgLink,
                                                  status: cartModelList[index].status,
                                                  totalAmount:
                                                      cartModelList[index].amount * quantity,
                                                  quantity: quantity,
                                                );

                                                cartModelList[index] = CartModel(
                                                  title: cartModelList[index].title,
                                                  subTitle: cartModelList[index].subTitle,
                                                  amount: cartModelList[index].amount,
                                                  imgLink: cartModelList[index].imgLink,
                                                  status: cartModelList[index].status,
                                                  quantity: quantity,
                                                  totalAmount:
                                                      cartModelList[index].amount * quantity,
                                                );
                                              });
                                            },
                                            icon: Center(
                                              child: Icon(
                                                Icons.add,
                                                color: AppColors().primaryColors,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
