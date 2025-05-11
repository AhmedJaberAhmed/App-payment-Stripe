// import 'package:flutter/material.dart';
// import 'package:paymentcorrect/features/checkout/presentation/views/thank_you_view.dart';
// import 'PaymentMethodsListView.dart';
// import 'custom_credit_card.dart';
//
// class Paymentdetailsviewbody extends StatefulWidget {
//   const Paymentdetailsviewbody({super.key});
//
//   @override
//   State<Paymentdetailsviewbody> createState() => _PaymentdetailsviewbodyState();
// }
//
// class _PaymentdetailsviewbodyState extends State<Paymentdetailsviewbody> {
//   final GlobalKey<FormState> formKey = GlobalKey();
//   AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(slivers: [
//       SliverToBoxAdapter(child: PaymentMethodsListView()),
//       SliverToBoxAdapter(
//         child: CustomCreditCard(
//           autovalidateMode: autovalidateMode,
//           formKey: formKey,
//         ),
//       ),
//       SliverFillRemaining(
//         hasScrollBody: false,
//         child: Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//                 padding: EdgeInsets.only(bottom: 12, left: 16, right: 16),
//                 child: Center(
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: ElevatedButton(
//                       onPressed: () {
//                         if (formKey.currentState!.validate()) {
//                           formKey.currentState!.save();
//                         } else {
//                           Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: (context) {
//                                 return const ThankYouView();
//                               },
//                             ),
//                           );
//
//                           autovalidateMode = AutovalidateMode.always;
//                           setState(() {});
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.green,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         minimumSize: Size(double.infinity, 70),
//                       ),
//                       child: Text(
//                         "Payment",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ))),
//       )
//     ]);
//   }
// }
