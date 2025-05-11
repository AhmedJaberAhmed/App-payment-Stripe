import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

 import '../../../../core/utils/text_style.dart';
import 'CardInfoWidget.dart';
import 'PaymentItemInfo.dart';
import 'TotalPrice.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFFEEEEEE),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Column(
          children: [
            Text("Thank You", style: Styles.textStyle25),
            Text(
              'Your transaction was successful',
              textAlign: TextAlign.center,
              style: Styles.textStyle20,
            ),
            SizedBox(height: 42),
            PaymentItemInfo(
              value: "Date",
              title: "2025/2/5",
            ),
            SizedBox(height: 20),
            PaymentItemInfo(
              value: "Time",
              title: "8:00 Am",
            ),
            SizedBox(height: 20),
            PaymentItemInfo(
              value: "To",
              title: "Ahmed Jaber",
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                height: 60,
                thickness: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TotalPrice(title: "Total", value: r"$50.65"),
            ),
            SizedBox(height: 30),
            CardInfoWidget(),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FaIcon(FontAwesomeIcons.barcode,size: 64 ,),
                  Container(
                    width: 113,
                    height: 58,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1.50,
                          color: Color(0xFF34A853),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: const Text(
                        'PAID',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF34A853),
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                  ),

                ],

              ),
            ),
            SizedBox(height: 60,)
          ],
        ),
      ),
    );
  }
}
