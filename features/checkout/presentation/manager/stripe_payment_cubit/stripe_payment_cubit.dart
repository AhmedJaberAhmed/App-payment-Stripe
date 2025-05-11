import 'dart:developer';

import 'package:bloc/bloc.dart';
 import 'package:meta/meta.dart';
import 'package:paymentcorrect/features/checkout/data/models/paymentIntentInputModel.dart';
import 'package:paymentcorrect/features/checkout/data/repo/checkout_repo.dart';

part 'stripe_payment_state.dart';

class StripePaymentCubit extends Cubit<StripePaymentState> {
  final CheckOutRepo checkOutRepo;

  StripePaymentCubit(this.checkOutRepo) : super(StripePaymentInitial());

  Future makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(StripePaymentLoading());
    var data = await checkOutRepo.makePayment(paymentIntentInputModel: paymentIntentInputModel);
    data.fold(
      (l) {
        emit(StripePaymentFailure(errMessage: l.errMessage));
      },
      (r) {
        emit(StripePaymentSuccess());
      },
    );
  }
  @override void onChange(Change<StripePaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }

}
