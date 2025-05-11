
import 'Link.dart';
import 'card.dart';

class PaymentMethodOptions {
  Card? card;
  Linkk? link;

  PaymentMethodOptions({this.card, this.link});

  factory PaymentMethodOptions.fromJson(Map<String, dynamic> json) {
    return PaymentMethodOptions(
      card: json['card'] != null ? Card.fromJson(json['card']) : null,
      link: json['link'] != null ? Linkk.fromJson(json['link']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'card': card?.toJson(),
      'link': link?.toJson(),
    };
  }
}