import 'package:flutter/material.dart';
import 'package:zoomclone3/utils/colors.dart';
import 'package:zoomclone3/widgets/vertical_space.dart';

class HomeMeetingButton extends StatelessWidget {

final VoidCallback onpressed;
final String text;
final IconData icon;
  const HomeMeetingButton({
    Key? key,
    required this.onpressed,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onpressed,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: buttoncolor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.06),
                  offset: Offset(0,4),

                ),
              ]
            ),
            height:60,
            width: 60,
            child: Icon(icon, color: Colors.white, size: 30,),
          ),
          VerticalSpace(value: 10),
          Text(text, style: TextStyle(color: Colors.grey),)
        ],
      ),
    );
  }
}