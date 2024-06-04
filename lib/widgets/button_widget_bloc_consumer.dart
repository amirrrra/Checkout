// import 'package:checkout/manger/cubit/stripe_payment_cubit.dart';
// import 'package:checkout/models/payment_intent_input_model.dart';
// import 'package:checkout/views/thankyou_view.dart';
// import 'package:checkout/widgets/button_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ButtonWidgetBlocConsumer extends StatelessWidget {
//   const ButtonWidgetBlocConsumer({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<StripePaymentCubit, StripePaymentState>(
//       listener: (context, state) {
//         if (state is StripePaymentSuccess) {
//           Navigator.of(context)
//               .pushReplacement(MaterialPageRoute(builder: (context) {
//             return ThankyouView();
//           }));
//         }
//         if (state is StripePaymentFailure) {
//           Navigator.of(context).pop();
//           SnackBar snackBar = SnackBar(
//             content: Text(state.errMessage),
//           );
//           ScaffoldMessenger.of(context).showSnackBar(snackBar);
//         }
//       },
//       builder: (context, state) {
//         return ButtonWidget(
//             onPressed: () {
//               PaymentIntentInputModel paymentIntentInputModel =
//                   PaymentIntentInputModel(amount: '40', currency: 'EGP');
//               BlocProvider.of<StripePaymentCubit>(context).makePayment(
//                   paymentIntentInputModel: paymentIntentInputModel);
//             },
//             isLoading: state is StripePaymentLoading ? true : false,
//             text: 'Continue');
//       },
//     );
//   }
// }
