
class ShippingAddress {
  final String recipientName;
  final String line1;
  final String? line2;  // Optional
  final String city;
  final String countryCode;
  final String postalCode;
  final String phone;
  final String state;

  ShippingAddress({
    required this.recipientName,
    required this.line1,
    this.line2,
    required this.city,
    required this.countryCode,
    required this.postalCode,
    required this.phone,
    required this.state,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> json) {
    return ShippingAddress(
      recipientName: json['recipient_name'],
      line1: json['line1'],
      line2: json['line2'],
      city: json['city'],
      countryCode: json['country_code'],
      postalCode: json['postal_code'],
      phone: json['phone'],
      state: json['state'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'recipient_name': recipientName,
      'line1': line1,
      'line2': line2,
      'city': city,
      'country_code': countryCode,
      'postal_code': postalCode,
      'phone': phone,
      'state': state,
    };
  }
}
