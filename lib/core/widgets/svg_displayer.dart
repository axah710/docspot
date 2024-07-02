import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgDisplayer extends StatelessWidget {
  final String assetName;
  const SvgDisplayer({super.key, required this.assetName});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
    );
  }
}
