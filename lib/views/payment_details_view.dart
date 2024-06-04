import 'package:checkout/views/thankyou_view.dart';
import 'package:checkout/widgets/app_bar_widget.dart';
import 'package:checkout/widgets/button_widget.dart';
import 'package:checkout/widgets/interactive_card.dart';
import 'package:checkout/widgets/payment_methods_widget.dart';
import 'package:flutter/material.dart';

class PaymentdetailsView extends StatefulWidget {
  const PaymentdetailsView({super.key});

  @override
  State<PaymentdetailsView> createState() => _PaymentdetailsViewState();
}

class _PaymentdetailsViewState extends State<PaymentdetailsView> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Payment Details"),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: PaymentMethodsListView()),
          SliverToBoxAdapter(
              child: InteractiveCard(
            formKey: formKey,
            autovalidateMode: autovalidateMode,
          )),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ButtonWidget(
                    text: 'Complete Payment',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                      } else {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const ThankyouView();
                        }));
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
