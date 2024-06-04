// import 'package:dio/dio.dart';
// import 'package:fannelance/models/payment_intent_input_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';

// abstract class StripeService {
//   //method =>> create payment intent on the server
//   static Future createPaymentIntent({
//     required PaymentIntentInputModel paymentIntentInputModel,
//   }) async {
//     await dotenv.load(fileName: '.env');
//     Dio dio = Dio();
//     var response = await dio.post('https://api.stripe.com/v1/payment_intents',
//         options: Options(
//           headers: {
//             'Authorization': 'Bearer ${dotenv.env['secretKey']}',
//             'Content-Type': Headers.formUrlEncodedContentType
//           },
//         ),
//         data: paymentIntentInputModel.toJson());

//     return response.data;
//   }

//   //method =>>  initialize the payment sheet
//   static Future<void> initializePaymentSheet(paymentObject) async {
//     await Stripe.instance.initPaymentSheet(
//       paymentSheetParameters: SetupPaymentSheetParameters(
//         paymentIntentClientSecret: paymentObject['client_secret'],
//         merchantDisplayName: "Amira",
//         appearance: const PaymentSheetAppearance(
//           primaryButton: PaymentSheetPrimaryButtonAppearance(
//             colors: PaymentSheetPrimaryButtonTheme(
//               light: PaymentSheetPrimaryButtonThemeColors(
//                 background: Color(0xff000000),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   //method =>> present payment sheet
//   static Future presentPaymentSheet() async {
//     await Stripe.instance.presentPaymentSheet();
//   }

//   //method to call the main 3 methods
//   static Future<void> makePayment(
//       PaymentIntentInputModel paymentIntentInputModel) async {
//     try {
//       // var paymentIntent = await createPaymentIntent((amount*100),currency);
//       var paymentIntent = await createPaymentIntent(paymentIntentInputModel: paymentIntentInputModel);
//       await initializePaymentSheet(paymentIntent);
//       await presentPaymentSheet();
//     } catch (error) {
//       throw Exception(
//         error.toString(),
//       );
//     }
//   }
// }
