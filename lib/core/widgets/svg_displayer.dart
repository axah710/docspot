import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgDisplayer extends StatelessWidget {
  final String assetName;
  final double? height;
  final double? width;
  const SvgDisplayer({super.key, required this.assetName, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      height: height,
      width: width,
      assetName,
    );
    // SvgPicture.asset(assetName): This line uses the SvgPicture.asset
    //constructor from the flutter_svg package to create a widget that displays
    //the SVG image specified by assetName.
  }
}
// In summary, the SvgDisplayer widget is a simple, reusable component that
// takes the name of an SVG asset as a parameter and displays that SVG image
// using the flutter_svg package. This widget can be used in a Flutter 
//application wherever an SVG image needs to be displayed.
