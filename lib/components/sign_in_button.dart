import 'package:flutter/material.dart';
Color kPurpleColour = Colors.deepPurple;

class SignInButtonBuild extends StatelessWidget {



  SignInButtonBuild({this.buttonText, this.buttonPressed, this.showArrow = false,
    this.buttonColour = Colors.deepPurple, this.hasBorder = false, this.borderColour,
    this.buttonTextColour = Colors.white, this.width, this.height = 55.0});
  final String? buttonText;
  final Function? buttonPressed;
  final  bool showArrow;
  final Color? buttonColour;
  final  bool hasBorder;
  final  Color? borderColour;
  final Color buttonTextColour;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child:   Container(
        height: height,
        width: width?? MediaQuery.of(context).size.width,//350.0,
        decoration: BoxDecoration(
          color: buttonColour,
          border: Border.all(color: hasBorder? borderColour!: Colors.transparent),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: TextButton(
            child: Row(
              children: [
                Spacer(),
                Text(buttonText?? "Add Text", style: TextStyle(fontSize: 17.0, color: buttonTextColour),),
                Spacer(),
                Visibility(

                    visible: showArrow,

                    child: Icon(Icons.keyboard_arrow_right_outlined,color: kPurpleColour,))
              ],
            ),
            onPressed: buttonPressed as void Function()?
        ),
      ),
    );
  }
}