import 'package:flutter/material.dart';
import 'package:neopop/neopop.dart';
import '../utils/app_color.dart';
import 'build_text_widget.dart';

class BuildNeopopButton extends StatefulWidget {
  final String text;
  final EdgeInsets? padding;
  final VoidCallback onTapUp;

  const BuildNeopopButton({
    super.key,
    required this.text,
    this.padding,
    required this.onTapUp,
  });

  @override
  State<BuildNeopopButton> createState() => _BuildNeopopButtonState();
}

class _BuildNeopopButtonState extends State<BuildNeopopButton> {
  @override
  Widget build(BuildContext context) {
    return NeoPopTiltedButton(
      isFloating: true,
      onTapUp: widget.onTapUp,
      decoration: NeoPopTiltedButtonDecoration(
        color: AppColors().primaryColors,
        plunkColor: AppColors().primaryColorsGreen,
        shadowColor: AppColors().shadowColors,
        showShimmer: true,
        shimmerColor: AppColors().greyColors2.withOpacity(0.8),
      ),
      child: Padding(
        padding: widget.padding ??
            const EdgeInsets.symmetric(
              horizontal: 80.0,
              vertical: 10,
            ),
        child: BuildTextWidget(
          text: widget.text,
          color: Colors.white,
          weight: FontWeight.w900,
          size: 15,
        ),
      ),
    );
  }
}
