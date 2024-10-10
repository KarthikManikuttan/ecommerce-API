import 'package:ecommerce_api/provider/wishlist_provider.dart';
import 'package:ecommerce_api/widgets/build_alert_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/app_color.dart';
import '../utils/hive_services.dart';
import 'build_circle_icon_button_widget.dart';
import 'build_image_widget.dart';
import 'build_text_widget.dart';

class WishlistGridviewWidget extends StatelessWidget {
  const WishlistGridviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<WishListProvider>(
      builder: (context, wishListProvider, child) {
        return wishListModelList.isNotEmpty
            ? ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.grey[400],
                    thickness: 0.5,
                  );
                },
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                shrinkWrap: true,
                itemCount: wishListModelList.length,
                reverse: true,
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
                                        imgLink: wishListModelList[index].imgLink!,
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
                                                text: wishListModelList[index].title,
                                                weight: FontWeight.w700,
                                              ),
                                            ),
                                            BuildCircleIconButtonWidget(
                                              onPressed: () {
                                                showAlertBox(
                                                  context: context,
                                                  command: "Remove item",
                                                  subTitle: "Are you sure?",
                                                  title: "Remove",
                                                  onPressed: () {
                                                    wishListProvider.removeItems(
                                                        index: index, context: context);
                                                  },
                                                );
                                              },
                                              imgLink:
                                                  "https://img.icons8.com/ios/50/delete-sign--v1.png",
                                              color: Colors.grey,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                        BuildTextWidget(
                                          text: wishListModelList[index].subTitle,
                                          weight: FontWeight.w700,
                                          color: AppColors().primaryColors,
                                          size: 13,
                                        ),
                                        const Spacer(),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            BuildTextWidget(
                                              text: '\$ ${wishListModelList[index].amount}',
                                              weight: FontWeight.w700,
                                            ),
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
              )
            : const Center(
                child: BuildTextWidget(text: "No Favourites Yet!"),
              );
      },
    );
  }
}
