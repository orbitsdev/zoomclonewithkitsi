import 'package:flutter/material.dart';

class VerticalSpace extends StatelessWidget {

final double value;
  const VerticalSpace({
    Key? key,
    required this.value,
  }) : super(key: key);
  @override
  Widget build(BuildContext context){
    return SizedBox(
    height: value,
    );
  }
}