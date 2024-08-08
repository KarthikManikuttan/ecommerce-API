import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildTextWidget extends StatefulWidget {
  final String? text;
  final double? size;
  final Color? color;
  final FontWeight? weight;

  const BuildTextWidget({
    super.key,
    required this.text,
    this.size,
    this.color,
    this.weight,
  });

  @override
  State<BuildTextWidget> createState() => _BuildTextWidgetState();
}

class _BuildTextWidgetState extends State<BuildTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text!,
      style: GoogleFonts.comfortaa(
        fontSize: widget.size,
        fontWeight: widget.weight,
        color: widget.color ?? Colors.black,
      ),
    );
  }
}
