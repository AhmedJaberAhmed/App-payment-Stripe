import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:paymentcorrect/features/checkout/presentation/views/thank_you_view-body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: FaIcon(size: 35, FontAwesomeIcons.arrowLeft)),
          ),
        ),
        body: const ThankYouViewbody());
  }
}
