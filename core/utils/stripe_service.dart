import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../../features/checkout/data/models/EphemeralKey.dart';
import '../../features/checkout/data/models/initPaymentSheetInputModel.dart';
import '../../features/checkout/data/models/paymentIntentInputModel.dart';
import '../../features/checkout/data/models/payment_intent_object.dart';
import 'api_keys.dart';
import 'api_service.dart';

class StripeService {
  final ApiService apiService = ApiService();

   Future<EphemeralKey> fetchEphemeralKey({required String customerId}) async {
    try {
      var response = await apiService.post(
        body: {
          'customer': customerId
        },
        headers: {
          'Authorization': "Bearer ${ApiKeys.secretKey}",
          "Stripe-Version": "2023-08-16",
        },
        contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        token: ApiKeys.secretKey,
      );


      if (response.data != null && response.data.isNotEmpty) {
        try {
          return EphemeralKey.fromJson(response.data);
        } catch (e) {
          print("Error parsing ephemeral key JSON: $e");
          throw Exception('Invalid ephemeral key format');
        }
      } else {
        throw Exception('Ephemeral key response is empty or null');
      }
    } catch (e) {
      print('Error creating ephemeral key: $e');
      throw Exception("Failed to fetch ephemeral key: $e");
    }
  }

   Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    try {
      var response = await apiService.post(
        body: paymentIntentInputModel.toJson(),
        contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/payment_intents',
        token: ApiKeys.secretKey,
      );

      print("Payment Intent Response: ${response.data}");

      if (response.data != null && response.data.isNotEmpty) {
        try {
          return PaymentIntentModel.fromJson(response.data);
        } catch (e) {
          print("Error parsing payment intent JSON: $e");
          throw Exception('Invalid payment intent format');
        }
      } else {
        throw Exception('Payment intent response is empty or null');
      }
    } catch (e) {
      print('Error creating payment intent: $e');
      throw Exception("Failed to create payment intent: $e");
    }
  }

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          customerEphemeralKeySecret: initPaymentSheetInputModel.ephemeralKeysecret,
          customerId: initPaymentSheetInputModel.customerId,
          paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
          merchantDisplayName: 'Ahmed',
        ),
      );
    } catch (e) {
      print('Error initializing payment sheet: $e');
      throw Exception("Failed to initialize payment sheet: $e");
    }
  }

  Future displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      print("Payment successful");
    } catch (e) {
      if (e is StripeException) {
        print('Stripe exception: ${e.error.localizedMessage}');
      } else {
        print('Error presenting payment sheet: $e');
      }
      throw Exception("Payment failed: $e");
    }
  }

  Future makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);

      var ephemeralKeyModel = await fetchEphemeralKey(customerId: paymentIntentInputModel.customerId);

      var initPaymentSheetInputModel = InitPaymentSheetInputModel(
        clientSecret: paymentIntentModel.clientSecret!,
        customerId: paymentIntentInputModel.customerId,
        ephemeralKeysecret: ephemeralKeyModel.secret,
      );

      await initPaymentSheet(initPaymentSheetInputModel: initPaymentSheetInputModel);

      await displayPaymentSheet();
    } catch (e) {
      print('Error during payment process: $e');
      throw Exception("Payment process failed: $e");
    }
  }
}
