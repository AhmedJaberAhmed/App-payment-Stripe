import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymentcorrect/features/checkout/data/repo/checkout_repo.dart';
import 'package:paymentcorrect/features/checkout/data/repo/checkout_repo_implementation.dart';
import 'package:paymentcorrect/features/checkout/presentation/views/payment_modal_sheet.dart';

import '../manager/stripe_payment_cubit/stripe_payment_cubit.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            //     Navigator.of(context).push(
            // MaterialPageRoute(
            //   builder: (context) => PaymentDetails(),
            // ),

            //);
            //
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                context: context,
                builder: (context) {
                  return BlocProvider(
                    create: (context) =>
                        StripePaymentCubit(CheckOutRepoImplemtntaion()),
                    child: PaymentBottomSheet(),
                  );
                });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            minimumSize: Size(double.infinity, 70),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Text color
            ),
          ),
        ),
      ),
    );
  }
}
