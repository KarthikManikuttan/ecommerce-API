import 'package:flutter/material.dart';

class BuildIconWidget extends StatefulWidget {
  final String imgLink;
  final double? size;
  final Color? color;

  const BuildIconWidget({
    super.key,
    required this.imgLink,
    this.color,
    this.size,
  });

  @override
  State<BuildIconWidget> createState() => _BuildIconWidgetState();
}

class _BuildIconWidgetState extends State<BuildIconWidget> {
  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      NetworkImage(widget.imgLink),
      size: widget.size ?? 33,
      color: widget.color ?? Colors.grey,
    );
  }
}
