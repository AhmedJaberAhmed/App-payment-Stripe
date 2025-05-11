class PaymentIntentInputModel {
  final String amount;
  final String currency;
  final String customerId;

  PaymentIntentInputModel(
      {required this.amount, required this.currency, required this.customerId});

  toJson() {
    int amountInCents = (double.parse(amount) * 100).toInt();

    return {
      'amount': amountInCents,
      'currency': currency,
      'customer': customerId
    };
  }
}
