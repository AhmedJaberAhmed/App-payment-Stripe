import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:paymentcorrect/core/utils/api_keys.dart';

import 'features/checkout/presentation/views/my_cart_view.dart';

void main() {
  Stripe.publishableKey=ApiKeys.publishableKey;
  runApp(const CheckOutApp());
}

class CheckOutApp extends StatelessWidget {
  const CheckOutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartView(),
    );
  }
}



//todo Payment    ****

// todo **PaymentIntentObject create payment intent (amount,currency)**

// todo **initPaymentSheet(paymentIntentClientSecret,merchantDisplayName)**

// todo **presentPaymentSheet()**









// todo saving cards


// todo PaymentIntentObject create payment intent (amount,currency,CustomerId)

// todo keySecret createEphemeralKey(stripeVersion,customerId)

// todo initPaymentSheet(paymentIntentClientSecret,merchantDisplayName,ephemeralkeySecret)

// todo presentPaymentSheet()


