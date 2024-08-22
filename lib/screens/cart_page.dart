import 'package:ecommerce_api/screens/product_detail_page.dart';
import 'package:ecommerce_api/utils/appColor.dart';
import 'package:ecommerce_api/widgets/build_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:neopop/neopop.dart';
import '../main.dart';
import '../models/cart_model_hive.dart';
import '../widgets/build_circle_icon_button_widget.dart';
import '../widgets/build_image_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    super.key,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    print("box!.length");
    print("box!.length${box!.length}");
    // TODO: implement i
    // nitState
    super.initState();
  }

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
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50.0)),
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
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50.0)),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1.0,
                      ),
                    ),
                    child: BuildCircleIconButtonWidget(
                      onPressed: () {},
                      imgLink:
                          "https://img.icons8.com/material-sharp/48/more.png",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView.separated(
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
            itemBuilder: (context, index) {
              return SizedBox(
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: BuildTextWidget(
                                            text: cartModelList[index].title,
                                            weight: FontWeight.w700,
                                          ),
                                        ),
                                        BuildCircleIconButtonWidget(
                                          onPressed: () {},
                                          imgLink:
                                              "https://img.icons8.com/ios/50/delete-sign--v1.png",
                                          color: Colors.grey,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                    BuildTextWidget(
                                      text: cartModelList[index]
                                          .quantity!
                                          .toString(),
                                      weight: FontWeight.w700,
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const BuildTextWidget(
                                          text: "\$5999.99",
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
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              height: 30,
                                              width: 30,
                                              child: IconButton(
                                                highlightColor:
                                                    Colors.transparent,
                                                padding: EdgeInsets.zero,
                                                iconSize: 15,
                                                onPressed: () {},
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
                                                  text: cartModelList[index]
                                                      .quantity
                                                      .toString(),
                                                  weight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                  color:
                                                      AppColors().primaryColors,
                                                  width: 1,
                                                ),
                                              ),
                                              height: 30,
                                              width: 30,
                                              child: IconButton(
                                                highlightColor:
                                                    Colors.transparent,
                                                padding: EdgeInsets.zero,
                                                iconSize: 15,
                                                onPressed: () {
                                                  int quantity =
                                                      cartModelList[index]
                                                              .quantity +
                                                          1;
                                                  setState(() {
                                                    box!.put(
                                                      cartModelList[index]
                                                          .title,
                                                      CartModel(
                                                        title:
                                                            cartModelList[index]
                                                                .title,
                                                        subTitle:
                                                            cartModelList[index]
                                                                .subTitle,
                                                        amount:
                                                            cartModelList[index]
                                                                .amount,
                                                        imgLink:
                                                            cartModelList[index]
                                                                .imgLink,
                                                        quantity: quantity,
                                                      ),
                                                    );
                                                    cartModelList[index] =
                                                        CartModel(
                                                      title:
                                                          cartModelList[index]
                                                              .title,
                                                      subTitle:
                                                          cartModelList[index]
                                                              .subTitle,
                                                      amount:
                                                          cartModelList[index]
                                                              .amount,
                                                      imgLink:
                                                          cartModelList[index]
                                                              .imgLink,
                                                      quantity: quantity,
                                                    );
                                                  });
                                                },
                                                icon: Center(
                                                  child: Icon(
                                                    Icons.add,
                                                    color: AppColors()
                                                        .primaryColors,
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
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height / 3.7),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Divider(
                height: 0,
                color: Colors.grey[300],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BuildTextWidget(
                            text: "Total price:",
                            weight: FontWeight.w700,
                            size: 15,
                          ),
                          BuildTextWidget(
                            text: "\$5999.90",
                            weight: FontWeight.w700,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BuildTextWidget(
                            text: "Gst (+18%):",
                            weight: FontWeight.w700,
                            size: 15,
                          ),
                          BuildTextWidget(
                            text: "\$232",
                            weight: FontWeight.w700,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BuildTextWidget(
                            text: "Subtotal (Inc.tax):",
                            weight: FontWeight.w700,
                            size: 15,
                          ),
                          BuildTextWidget(
                            text: "\$6232.90",
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
                child: NeoPopTiltedButton(
                  isFloating: true,
                  onTapUp: () {},
                  decoration: NeoPopTiltedButtonDecoration(
                    color: AppColors().primaryColors,
                    plunkColor: AppColors().primaryColorsGreen,
                    shadowColor: AppColors().shadowColors,
                    showShimmer: true,
                    shimmerColor: AppColors().greyColors2.withOpacity(0.8),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 125.0,
                      vertical: 10,
                    ),
                    child: BuildTextWidget(
                      text: "Checkout",
                      color: Colors.white,
                      weight: FontWeight.w900,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
