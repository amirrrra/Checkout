// import 'package:checkout/core/stripe_service.dart';
// import 'package:checkout/models/payment_intent_input_model.dart';
// import 'package:dartz/dartz.dart';

// abstract class CheckoutRepo {
//   Future<Either<Failure, void>> checkPayment(
//       {required PaymentIntentInputModel paymentIntentInputModel});
// }

// abstract class Failure {
//   final String errMessage;

//   Failure({required this.errMessage});
// }

// class ServerFailure extends Failure {
//   ServerFailure({required super.errMessage});
// }

// ////////////

// class CheckoutRepoImpl extends CheckoutRepo {

//   @override
//   Future<Either<Failure, void>> checkPayment(
//       {required PaymentIntentInputModel paymentIntentInputModel}) async {
//     try {
//       await StripeService.makePayment(paymentIntentInputModel: paymentIntentInputModel);
//       return right(null);
//     } on Exception catch (e) {
//       return left(ServerFailure(errMessage: e.toString()));
//     }
//   }
// }
