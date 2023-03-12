import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  SmallText({Key? key,this.size=12,this.height=1.2,this.color=const Color(0xFFF89dad0),required this.text,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow:TextOverflow.ellipsis ,
      style:GoogleFonts.raleway(
        textStyle:TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size,
        height: height,
      ),
      )
    );
  }
}
