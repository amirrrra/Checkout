import 'package:checkout/widgets/app_bar_widget.dart';
import 'package:checkout/widgets/bottom_sheet_widget.dart';
import 'package:checkout/widgets/button_widget.dart';
import 'package:checkout/widgets/order_info_widget.dart';
import 'package:checkout/widgets/total_price_widget.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "My Cart"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 18,
            ),
            Expanded(child: Image.asset("assets/images/basket.png")),
            const SizedBox(
              height: 18,
            ),
            const OrderInfoWidget(title: "Order subtotal", value: r"$42.97"),
            const OrderInfoWidget(title: "Discount", value: r"$0"),
            const OrderInfoWidget(title: "Shipping", value: r"$8"),
            const Divider(
              thickness: 2,
              height: 40,
              color: Color(0xFFC6C6C6),
              indent: 10,
              endIndent: 10,
            ),
            const TotalPriceWidget(title: "Total", value: r"$50.97"),
            const SizedBox(
              height: 18,
            ),
            ButtonWidget(
              text: 'Complete Payment',
              // onPressed: ()=>PaymentManager.makePayment(40, "EGP"), 

              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const PaymentMethodsBottomSheet();
                    });
              },

              // onPressed: () {
              //   PaymentIntentInputModel inputModel =
              //       PaymentIntentInputModel(amount: '100', currency: 'EGP');
              //   StripeService.makePayment(
              //       paymentIntentInputModel: inputModel);
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}


// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           ElevatedButton(
//             onPressed: ()=>PaymentManager.makePayment(40, "EGP"), 
//             // onPressed: () {
//             //       PaymentIntentInputModel inputModel =
//             //           PaymentIntentInputModel(amount: '100', currency: 'EGP');
//             //       StripeService.makePayment(
//             //           paymentIntentInputModel: inputModel);
//             //     },
//             child: Text("Pay 20 dollar"),
//             )
//         ],
//       ),
//     );
//   }
// }