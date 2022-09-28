import 'package:flutter/material.dart';

import 'package:zoomclone3/utils/colors.dart';

class MeetingOption extends StatelessWidget {
final String text;
final bool isMute;
final Function(bool) onChange;
  const MeetingOption({
    Key? key,
    required this.text,
    required this.isMute,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      height: 60,
     
      color: background,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text, style: TextStyle(fontSize: 16)),
          ),
          Switch(value: isMute, onChanged: onChange)
        ],
      ),
    );
  }
}
