import 'package:flutter/material.dart';

class HorizontalSpace extends StatelessWidget {
  final double value;
  const HorizontalSpace({
    Key? key,
    required this.value,
  }) : super(key: key);
  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: value,
    );
  }
}