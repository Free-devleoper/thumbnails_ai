import 'package:flutter/material.dart';
import 'package:thumbnails_ai/utils/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';
class BigText extends StatelessWidget {
  final String text;
  Color? color;
  double size;
  FontWeight fontWeight;
  TextOverflow overflow;
  BigText({Key? key, required this.text,this.size=0,this.color=Colors.blue,this.overflow=TextOverflow.ellipsis,this.fontWeight=FontWeight.w500}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style:GoogleFonts.raleway(
          textStyle:TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: size==0?Dimensions.font20:size
      )),
    );
  }
}
