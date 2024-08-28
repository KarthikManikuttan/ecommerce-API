import 'package:ecommerce_api/payments/payment_functions.dart';
import 'package:ecommerce_api/utils/app_color.dart';
import 'package:ecommerce_api/widgets/build_neopop_button.dart';
import 'package:ecommerce_api/widgets/build_text_widget.dart';
import 'package:ecommerce_api/widgets/cart_list_view_widget.dart';
import 'package:flutter/material.dart';
import '../utils/cart_services.dart';
import '../utils/hive_services.dart';
import '../widgets/build_circle_icon_button_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    super.key,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void update() {
    setState(() {});
  }

  bool isShowDetailedGst = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 50),
        child: AppBar(
          flexibleSpace: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors().greyColors,
                      borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1.0,
                      ),
                    ),
                    child: BuildCircleIconButtonWidget(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      imgLink: "https://img.icons8.com/windows/64/back.png",
                    ),
                  ),
                  const BuildTextWidget(
                    text: "My cart",
                    size: 16,
                    color: Colors.black,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors().greyColors,
                      borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1.0,
                      ),
                    ),
                    child: BuildCircleIconButtonWidget(
                      onPressed: () {},
                      imgLink: "https://img.icons8.com/material-sharp/48/more.png",
                    ),
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
      ),
      body: cartModelList.isEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 310),
              child: Center(
                child: BuildNeopopButton(
                  onTapUp: () {},
                  text: "Your cart is empty !",
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CartlistviewWidget(callback: update),
            ),
      bottomNavigationBar: cartModelList.isNotEmpty
          ? BottomAppBar(
              color: Colors.white,
              height: 317,
              notchMargin: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Divider(
                    height: 0,
                    color: Colors.grey[300],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const BuildTextWidget(
                                text: "Total price:",
                                weight: FontWeight.w700,
                                size: 15,
                              ),
                              BuildTextWidget(
                                text: "\$${CartServices().getTotalPrice().toStringAsFixed(2)}",
                                weight: FontWeight.w700,
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const BuildTextWidget(
                                    text: "Gst (+18%):",
                                    weight: FontWeight.w700,
                                    size: 15,
                                  ),
                                  BuildCircleIconButtonWidget(
                                    onPressed: () {
                                      setState(() {
                                        isShowDetailedGst = !isShowDetailedGst;
                                      });
                                    },
                                    imgLink: isShowDetailedGst
                                        ? "https://img.icons8.com/ios/50/collapse-arrow--v1.png"
                                        : "https://img.icons8.com/ios/50/expand-arrow--v1.png",
                                    size: 15,
                                  ),
                                ],
                              ),
                              BuildTextWidget(
                                text: "\$${CartServices().getGst().toStringAsFixed(2)}",
                                weight: FontWeight.w700,
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                        if (isShowDetailedGst)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const BuildTextWidget(
                                      text: "CGST (9%):",
                                      weight: FontWeight.w700,
                                      size: 12,
                                      color: Colors.grey,
                                    ),
                                    BuildTextWidget(
                                      text: "\$${CartServices().getCgst().toStringAsFixed(2)}",
                                      weight: FontWeight.w700,
                                      size: 12,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const BuildTextWidget(
                                      text: "SGST (9%):",
                                      weight: FontWeight.w700,
                                      size: 12,
                                      color: Colors.grey,
                                    ),
                                    BuildTextWidget(
                                      text: "\$${CartServices().getCgst().toStringAsFixed(2)}",
                                      weight: FontWeight.w700,
                                      size: 12,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const BuildTextWidget(
                                text: "Subtotal (Inc.tax):",
                                weight: FontWeight.w700,
                                size: 15,
                              ),
                              BuildTextWidget(
                                text: "\$${CartServices().getSubTotal().toStringAsFixed(2)}",
                                weight: FontWeight.w700,
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 0,
                    color: Colors.grey[300],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: BuildNeopopButton(
                      text: "Checkout",
                      onTapUp: () async {
                        StripeService.instance.makePayment(
                            amount: CartServices().getSubTotal().round(),
                            callBack: update,
                            context: context);
                      },
                      padding: const EdgeInsets.symmetric(
                        horizontal: 130.0,
                        vertical: 15,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
