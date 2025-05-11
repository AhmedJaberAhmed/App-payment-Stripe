import 'AmountDetails.dart';

class Amount {
  final String total;
  final String currency;
  final AmountDetails details;

  Amount({
    required this.total,
    required this.currency,
    required this.details,
  });

  // Factory constructor to create an instance from JSON
  factory Amount.fromJson(Map<String, dynamic> json) {
    return Amount(
      total: json['total'],
      currency: json['currency'],
      details: AmountDetails.fromJson(json['details']),
    );
  }

  // Method to convert the Dart object back to JSON
  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'currency': currency,
      'details': details.toJson(),
    };
  }
}
