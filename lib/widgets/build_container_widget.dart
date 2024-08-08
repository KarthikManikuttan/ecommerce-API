import 'package:flutter/material.dart';

class BuildContainerWidget extends StatefulWidget {
  const BuildContainerWidget({super.key});

  @override
  State<BuildContainerWidget> createState() => _BuildContainerWidgetState();
}

class _BuildContainerWidgetState extends State<BuildContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(0.4),
          width: 1.5,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    );
  }
}
