
class AmountDetails {
  Map<String, dynamic>? tip;

  AmountDetails({this.tip});

  factory AmountDetails.fromJson(Map<String, dynamic> json) {
    return AmountDetails(
      tip: Map<String, dynamic>.from(json['tip']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'tip': tip};
  }
}