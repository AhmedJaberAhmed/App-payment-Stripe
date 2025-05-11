class InitPaymentSheetInputModel {
  final String clientSecret;
  final String customerId;
  final String ephemeralKeysecret;

  InitPaymentSheetInputModel(
      {required this.clientSecret,
      required this.customerId,
      required this.ephemeralKeysecret});
}
