import 'package:ecommerce_app/core/utils/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, required this.onpress})
    : super(key: key);
  final String text;
  final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: TextButton(

          style: TextButton.styleFrom(

             backgroundColor: App_colors.primarycolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
            ),
          ),
      
          onPressed: onpress, child: Text(text,style: TextStyle(
        color: Colors.white,fontWeight: FontWeight.w700,fontSize: 16
      ),)),
    );
  }
}
