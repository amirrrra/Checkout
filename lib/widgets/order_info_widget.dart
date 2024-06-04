import 'package:checkout/core/styles.dart';
import 'package:flutter/material.dart';

class OrderInfoWidget extends StatelessWidget {
  const OrderInfoWidget({super.key, required this.title, required this.value});
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,style: Styles.style18,textAlign: TextAlign.center,),
        const Spacer(),
        Text(value,style: Styles.style18,textAlign: TextAlign.center,)
        ],
    );
  }
}