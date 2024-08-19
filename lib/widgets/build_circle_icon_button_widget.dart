import 'package:flutter/material.dart';
import '../utils/AppColor.dart';
import 'build_icon_widget.dart';

class BuildCircleIconButtonWidget extends StatefulWidget {
  final VoidCallback onPressed;
  final String imgLink;
  final Color? color;

  const BuildCircleIconButtonWidget({
    super.key,
    required this.onPressed,
    required this.imgLink,
    this.color,
  });

  @override
  State<BuildCircleIconButtonWidget> createState() =>
      _BuildCircleIconButtonWidgetState();
}

class _BuildCircleIconButtonWidgetState
    extends State<BuildCircleIconButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: IconButton(
        splashColor: AppColors().primaryColors,
        color: AppColors().primaryColors,
        onPressed: widget.onPressed,
        icon: BuildIconWidget(
          imgLink: widget.imgLink,
          color: widget.color ?? Colors.black,
        ),
      ),
    );
  }
}
