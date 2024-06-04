// import 'dart:developer';

// import 'package:bloc/bloc.dart';
// import 'package:checkout/models/payment_intent_input_model.dart';
// import 'package:checkout/repos/checkout_repo.dart';
// import 'package:meta/meta.dart';

// part 'stripe_payment_state.dart';

// class StripePaymentCubit extends Cubit<StripePaymentState> {
//   StripePaymentCubit(this.checkoutRepo) : super(StripePaymentInitial());

//   final CheckoutRepo checkoutRepo;

//   Future makePayment(
//       {required PaymentIntentInputModel paymentIntentInputModel}) async {
//     emit(StripePaymentLoading());

//     var data = await checkoutRepo.checkPayment(
//         paymentIntentInputModel: paymentIntentInputModel);
//     data.fold((l) => emit(StripePaymentFailure(errMessage: l.errMessage)),
//         (r) => emit(StripePaymentSuccess()));
//   }

//   @override
//   void onChange(Change<StripePaymentState> change) {
//     super.onChange(change);

//     log(change.toString());
//   }
// }
