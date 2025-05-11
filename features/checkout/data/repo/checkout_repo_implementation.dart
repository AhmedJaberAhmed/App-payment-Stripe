import 'package:dartz/dartz.dart';

import 'package:paymentcorrect/errors/failures.dart';

import 'package:paymentcorrect/features/checkout/data/models/paymentIntentInputModel.dart';

import '../../../../core/utils/stripe_service.dart';
import 'checkout_repo.dart';

class CheckOutRepoImplemtntaion extends CheckOutRepo {
  final StripeService stripeService = StripeService();

  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
