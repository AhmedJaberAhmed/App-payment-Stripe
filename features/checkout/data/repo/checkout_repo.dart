import 'package:dartz/dartz.dart';
import 'package:paymentcorrect/features/checkout/data/models/paymentIntentInputModel.dart';

import '../../../../errors/failures.dart';

abstract class CheckOutRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
