import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymentcorrect/core/utils/api_keys.dart';
import 'package:paymentcorrect/features/checkout/data/models/Amount.dart';
import 'package:paymentcorrect/features/checkout/data/models/itemList.dart';
import 'package:paymentcorrect/features/checkout/presentation/manager/stripe_payment_cubit/stripe_payment_cubit.dart';
import 'package:paymentcorrect/features/checkout/presentation/views/thank_you_view.dart';

import '../../data/models/AmountDetails.dart';
import '../../data/models/item.dart';
import '../../data/models/paymentIntentInputModel.dart';
import 'ButtonHero.dart';

class ButtonHeroConsumer extends StatelessWidget {
  const ButtonHeroConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripePaymentCubit, StripePaymentState>(
      listener: (context, state) {
        if (state is StripePaymentSuccess) {
          Navigator.pushReplacement(
            context, // ✅
            MaterialPageRoute(
              builder: (context) => ThankYouView(), // ✅
            ),
          );
        }
        if (state is StripePaymentFailure) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(content: Text(state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return ButtonHero(
          onPressed: () {
            var transactions = getTransactionsData();
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (BuildContext context) => PaypalCheckoutView(
            //     sandboxMode: true,
            //     clientId: ApiKeys.clientSectret,
            //     secretKey: ApiKeys.paypalSecret,
            //     transactions: [
            //       {
            //         "amount": transactions.amount.toJson(),
            //         "description": "The payment transaction description.",
            //         // "payment_options": {
            //         //   "allowed_payment_method":
            //         //       "INSTANT_FUNDING_SOURCE"
            //         // },
            //         "item_list": transactions.amount.toJson(),
            //       }
            //     ],
            //     note: "Contact us for any questions on your order.",
            //     onSuccess: (Map params) async {
            //       print("onSuccess: $params");
            //     },
            //     onError: (error) {
            //       print("onError: $error");
            //       Navigator.pop(context);
            //     },
            //     onCancel: () {
            //       print('cancelled:');
            //     },
            //   ),
            // ));

            PaymentIntentInputModel paymentIntentInputModel =
            PaymentIntentInputModel(amount: "542", currency: "USD",customerId:"cus_RiEJqmuaPB7hjf");
            BlocProvider.of<StripePaymentCubit>(context)
                .makePayment(paymentIntentInputModel: paymentIntentInputModel);
          },
          isLoading: state is StripePaymentLoading ? true : false,
        );
      },
    );
  }

 }

({Amount amount, ItemList itemList}) getTransactionsData() {
  var amount = Amount(
      total: "100",
      currency: "USD",
      details:
          AmountDetails(shipping: "0", shippingDiscount: 0, subtotal: "100"));

  List<Item> orders = [
    Item(name: "Apple", quantity: 10, price: "4", currency: "USD"),
    Item(name: "Apple", quantity: 10, price: "4", currency: "USD"),
  ];
  var itemList = ItemList(items: orders);

  return (amount: amount, itemList: itemList);
}
