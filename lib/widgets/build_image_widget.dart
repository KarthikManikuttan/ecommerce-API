import 'package:flutter/material.dart';

class BuildImageWidget extends StatefulWidget {
  final String imgLink;
  final double? height;
  final double? width;
  final BoxFit? fit;

  const BuildImageWidget({
    super.key,
    required this.imgLink,
    this.height,
    this.width,
    this.fit,
  });

  @override
  State<BuildImageWidget> createState() => _BuildImageWidgetState();
}

class _BuildImageWidgetState extends State<BuildImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      widget.imgLink,
    );
  }
}
