import 'package:flutter/material.dart';
import 'build_text_widget.dart';

class BuildContainerWidget extends StatefulWidget {
  final String text;
  final IconData icon;
  final Color? iconColor;

  const BuildContainerWidget({
    super.key,
    required this.text,
    required this.icon,
    this.iconColor,
  });

  @override
  State<BuildContainerWidget> createState() => _BuildContainerWidgetState();
}

class _BuildContainerWidgetState extends State<BuildContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 80,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(0.4),
          width: 1.5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
            color: widget.iconColor ?? Colors.black,
            size: 20,
          ),
          const SizedBox(
            width: 10,
          ),
          BuildTextWidget(
            text: widget.text,
            size: 15,
            weight: FontWeight.w900,
          ),
        ],
      ),
    );
  }
}
