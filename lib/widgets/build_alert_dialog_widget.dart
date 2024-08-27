import 'package:ecommerce_api/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'build_text_widget.dart';

showAlertBox({
  required BuildContext context,
  required String title,
  required String subTitle,
  required String command,
  required VoidCallback? onPressed,
}) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      backgroundColor: Colors.white,
      title: BuildTextWidget(
        text: title,
        size: 20,
      ),
      content: BuildTextWidget(
        text: subTitle,
        size: 14,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context, 'Cancel');
          },
          child: BuildTextWidget(
            text: "Cancel",
            color: AppColors().primaryColors,
            weight: FontWeight.w700,
          ),
        ),
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: AppColors().primaryColors,
          ),
          child: BuildTextWidget(
            text: command,
            color: Colors.white,
            weight: FontWeight.w700,
          ),
        )
      ],
    ),
  );
}
