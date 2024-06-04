import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodsWidget extends StatelessWidget {
  const PaymentMethodsWidget(
      {super.key, required this.paymentImage, this.isActive = false});
  final String paymentImage;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 103,
      height: 62,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1.50, color: isActive ? const Color(0xFF34A853) : Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: [
          BoxShadow(
            color: isActive ? const Color(0xFF34A853) : Colors.grey,
            blurRadius: 4,
            offset: const Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      duration: const Duration(milliseconds: 300),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: SvgPicture.asset(
            paymentImage,
            fit: BoxFit.scaleDown,
          )),
    );
  }
}

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String> paymentMethodsList = const [
    "assets/images/credit_card.svg",
    "assets/images/paypal.svg",
    "assets/images/applepay.svg",
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: paymentMethodsList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                activeIndex = index;
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: PaymentMethodsWidget(
                    paymentImage: paymentMethodsList[index], isActive: activeIndex == index),
              ),
            );
          }),
    );
  }
}
