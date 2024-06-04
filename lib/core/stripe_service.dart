import 'package:checkout/core/api_keys.dart';
import 'package:checkout/models/payment_intent_input_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

abstract class StripeService {
  //method =>> create payment intent on the server
  static Future createPaymentIntent({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    Dio dio = Dio();
    var response = await dio.post('https://api.stripe.com/v1/payment_intents',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiKeys.secretKey}',
            'Content-Type': Headers.formUrlEncodedContentType
          },
        ),
        data: paymentIntentInputModel.toJson());
    return response.data;
  }

  //method =>>  initialize the payment sheet
  static Future<void> initializePaymentSheet({
    required String clientSecret,
    required String customerId,
    required String ephemeralKeySecret,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        customerId: customerId,
        customerEphemeralKeySecret: ephemeralKeySecret,
        merchantDisplayName: "Fannelance",
        appearance: const PaymentSheetAppearance(
          primaryButton: PaymentSheetPrimaryButtonAppearance(
            colors: PaymentSheetPrimaryButtonTheme(
              light: PaymentSheetPrimaryButtonThemeColors(
                background: Color(0xff000000),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //method =>> present payment sheet
  static Future presentPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  //method to call the 3 main methods
  static Future<void> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      // var paymentIntent = await createPaymentIntent((amount*100),currency);
      var paymentIntent = await createPaymentIntent(
        paymentIntentInputModel: paymentIntentInputModel,
      );
      var ephemeralKey = await createEphemeralKey(
        customer: paymentIntentInputModel.customerId,
      );
      await initializePaymentSheet(
        clientSecret: paymentIntent['client_secret'],
        customerId: paymentIntentInputModel.customerId,
        ephemeralKeySecret: ephemeralKey['secret'],
      );
      await presentPaymentSheet();
    } catch (error) {
      throw Exception(
        error.toString(),
      );
    }
  }


  //method=> create Ephemeral Key
  static Future createEphemeralKey({
    required String customer,
  }) async {
    Dio dio = Dio();
    var response = await dio.post(
      'https://api.stripe.com/v1/ephemeral_keys',
      data: {'customer': customer},
      options: Options(
        headers: {
          'Authorization': "Bearer ${ApiKeys.secretKey}",
          'Stripe-Version': '2023-10-16',
          'Content-Type': Headers.formUrlEncodedContentType,
        },
      ),
    );
    return response.data;
  }
  //method=> create customer
  //this step must be with create account step
  //we create customer now just only for test and to get an id
  // static Future createCustomer({
  //   required CustomerInputModel customerInputModel,
  // }) async {
  //   Dio dio = Dio();
  //   var response = await dio.post('https://api.stripe.com/v1/customers',
  //       options: Options(
  //         headers: {
  //           'Authorization': 'Bearer ${ApiKeys.secretKey}',
  //           'Content-Type': Headers.formUrlEncodedContentType
  //         },
  //       ),
  //       data: customerInputModel.toJson());
  //   return response.data;
  // }
}
