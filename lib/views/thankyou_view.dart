import 'package:checkout/widgets/app_bar_widget.dart';
import 'package:checkout/widgets/check_icon_widget.dart';
import 'package:checkout/widgets/dashed_line.dart';
import 'package:checkout/widgets/thankyou_card_widget.dart';
import 'package:flutter/material.dart';

class ThankyouView extends StatelessWidget {
  const ThankyouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCard(),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2 + 20,
            left: 20 + 8,
            right: 20 + 8,
            child: const DashedLine(),
          ),
          Positioned(
              left: -20,
              bottom: MediaQuery.sizeOf(context).height * .2,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )),
          Positioned(
              right: -20,
              bottom: MediaQuery.sizeOf(context).height * .2,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )),
          const Positioned(
            top: -50,
            left: 0,
            right: 0,
            child: CheckIconWidget(),
          ),
        ],
      ),
          )
    );
  }
}
