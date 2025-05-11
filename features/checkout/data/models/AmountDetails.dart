
class AmountDetails {
  final String subtotal;
  final String shipping;
  final int shippingDiscount;

  AmountDetails({
    required this.subtotal,
    required this.shipping,
    required this.shippingDiscount,
  });

  // Factory constructor to create an instance from JSON
  factory AmountDetails.fromJson(Map<String, dynamic> json) {
    return AmountDetails(
      subtotal: json['subtotal'],
      shipping: json['shipping'],
      shippingDiscount: json['shipping_discount'],
    );
  }

  // Method to convert the Dart object back to JSON
  Map<String, dynamic> toJson() {
    return {
      'subtotal': subtotal,
      'shipping': shipping,
      'shipping_discount': shippingDiscount,
    };
  }
}
