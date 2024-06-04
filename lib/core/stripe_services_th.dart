import 'package:checkout/core/api_keys.dart';
import 'package:checkout/core/api_service.dart';
import 'package:checkout/models/payment_intent_input_model.dart';
import 'package:checkout/models/payment_intent_model/payment_intent_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

abstract class StripeService {
  //method =>> create payment intent on the server
  static Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    try {
      ApiService apiService = ApiService();
      var response = await apiService.postCreation(
        contentType: Headers.formUrlEncodedContentType,
        data: paymentIntentInputModel.toJson(),
        url: "https://api.stripe.com/v1/payment_intents",
        token: ApiKeys.secretKey,
      );

      //parse the response
      var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
      return paymentIntentModel;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  //method =>>  initialize the payment sheet
  static Future initPaymentSheet(
      {required String paymentIntentClientSecret}) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntentClientSecret,
            merchantDisplayName: "Amira"),
      );
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  //method =>> present payment sheet
  static Future presentPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  //method to call the main 3 methods
  static Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);

    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!);

    await presentPaymentSheet();
  }
}