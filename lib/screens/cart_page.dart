import 'package:ecommerce_api/utils/appColor.dart';
import 'package:ecommerce_api/widgets/build_icon_widget.dart';
import 'package:ecommerce_api/widgets/build_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:neopop/neopop.dart';
import '../widgets/build_circle_icon_button_widget.dart';
import '../widgets/build_image_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int value = 1;
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
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            shrinkWrap: true,
            itemCount: 5,
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
                                  decoration: BoxDecoration(
                                    color: AppColors().greyColors,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: const BuildImageWidget(
                                    imgLink:
                                        "https://cdn.dummyjson.com/products/images/beauty/Red%20Nail%20Polish/thumbnail.png",
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
                                    const Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: BuildTextWidget(
                                              text: "xboxxxxxxxxxxxx"),
                                        ),
                                        BuildIconWidget(
                                          imgLink:
                                              "https://img.icons8.com/ios/50/delete-sign--v1.png",
                                          color: Colors.grey,
                                          size: 15,
                                        ),
                                      ],
                                    ),
                                    const BuildTextWidget(text: "1 Tb"),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const BuildTextWidget(
                                            text: "\$5999.99"),
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
                                                    text: value.toString()),
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
                                                  value++;
                                                  setState(() {});
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
                    Divider(
                      color: Colors.grey[400],
                      thickness: 0.5,
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
