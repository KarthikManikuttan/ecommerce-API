import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_api/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
    return CachedNetworkImage(
      width: widget.width,
      height: widget.height,
      imageUrl: widget.imgLink,
      fit: widget.fit,
      placeholder: (context, url) => Center(
        child: LoadingAnimationWidget.twoRotatingArc(
          color: AppColors().primaryColors,
          size: 50,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
