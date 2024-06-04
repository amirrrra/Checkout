import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class InteractiveCard extends StatefulWidget {
  const InteractiveCard(
      {super.key, required this.formKey, required this.autovalidateMode});
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;

  @override
  State<InteractiveCard> createState() => _InteractiveCardState();
}

class _InteractiveCardState extends State<InteractiveCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool showBackView = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: showBackView,
          onCreditCardWidgetChange: (value) {},
          isHolderNameVisible: true,
        ),
        CreditCardForm(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          onCreditCardModelChange: (model) {
            cardNumber = model.cardNumber;
            expiryDate = model.expiryDate;
            cardHolderName = model.cardHolderName;
            cvvCode = model.cvvCode;
            showBackView = model.isCvvFocused;
            setState(() {});
          },
          formKey: widget.formKey,
          autovalidateMode: widget.autovalidateMode,
        )
      ],
    );
  }
}
