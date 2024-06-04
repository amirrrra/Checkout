import 'package:checkout/core/stripe_service.dart';
import 'package:checkout/models/payment_intent_input_model.dart';
import 'package:checkout/widgets/button_widget.dart';
import 'package:checkout/widgets/payment_methods_widget.dart';
import 'package:flutter/material.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          const PaymentMethodsListView(),
          const SizedBox(
            height: 32,
          ),
          ButtonWidget(
              text: 'Continue',
              // onPressed: () => PaymentManager.makePayment(40, "EGP"),
              onPressed: () {
                PaymentIntentInputModel inputModel = PaymentIntentInputModel(
                  amount: 100,
                  currency: 'EGP',
                  customerId: 'cus_PbfjLHEmbwUdrx',
                );
                StripeService.makePayment(paymentIntentInputModel: inputModel);
              }),
        ],
      ),
    );
  }
}
