
import 'package:flutter/material.dart';

import 'CustomButton.dart';
import 'OrderInfoItem.dart';
import 'TotalPrice.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 20,),
          Expanded(child: Image.asset("images/img.png")),
          SizedBox(height: 25,),
          OrderInfoItem(title: "Order Subtitle",value: r"$45.65",),
          SizedBox(height: 3,),
          OrderInfoItem(title: "Discount",value: r"$21.65",),
          SizedBox(height: 3,),
          OrderInfoItem(title: "Shipping",value: r"$74.76",),
          SizedBox(height: 5,),
          Divider(color: Colors.grey,
          height: 34,
          thickness: 2,)
          ,
          TotalPrice(title: "Total", value: r"$50.07"),
          SizedBox(height: 16,),
          CustomButton(text: "Complete Payment",),
          SizedBox(height: 12,),
        ],
      ),
    );
  }
}
