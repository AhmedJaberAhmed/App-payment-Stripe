import 'package:flutter/material.dart';
import 'package:paymentcorrect/features/checkout/presentation/views/thank_you_card.dart';

import 'CustomDashedLine.dart';

class ThankYouViewbody extends StatelessWidget {
  const ThankYouViewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ThankYouCard(),

            Positioned(
              bottom: MediaQuery.sizeOf(context).height*0.17 ,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: CustomDashedLine(),
                ),
              ),
            ),
            Positioned(
              left: -20,
              bottom: MediaQuery.sizeOf(context).height * 0.2,
              child: CircleAvatar(
                backgroundColor: Colors.white,
              ),
            ),
            Positioned(
              right: -15,
              bottom: MediaQuery.sizeOf(context).height * 0.2,
              child: CircleAvatar(
                backgroundColor: Colors.white,
              ),
            ),
            Positioned(
              top: -35,
              left: 0,
              right: 0,
              child: CustomCheckIcon(),
            )
          ],
        ),
      ),
    );
  }
}

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Color(0xFFD9D9D9),
      radius: 50,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.green,
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}