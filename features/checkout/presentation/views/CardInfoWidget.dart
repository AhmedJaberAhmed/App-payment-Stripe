
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/text_style.dart';


class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      width: 305,
      height: 73,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ), // RoundedRectangleBorder
      ),
      child: Row(children: [
        Image.asset( "images/Mastercard-Logo.wine.png"),

        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(children: [
            Text('Credit Card',style: Styles.textStyle20,),
            Text("Mastercard ** 71",style: Styles.textStyle18.copyWith(
                color: Colors.grey
            ),)
          ],),
        )
      ],),// ShapeDecoration
    );
  }
}
