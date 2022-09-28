import 'package:flutter/material.dart';
import 'package:zoomclone3/utils/colors.dart';


class CustomeButton extends StatelessWidget {

final String textname;
final VoidCallback onpressed;
  const CustomeButton({super.key, required this.textname, required this.onpressed});
  @override
  Widget build(BuildContext context){
    return ElevatedButton(onPressed:onpressed, child: Text(textname, style: TextStyle(fontSize: 18),),
    style: ElevatedButton.styleFrom(
      backgroundColor: buttoncolor,
      minimumSize: Size(double.infinity, 50),
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(
          color: buttoncolor
        )
      )
    ),
    
    );
  }
}