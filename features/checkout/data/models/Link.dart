
class Linkk {
  dynamic persistentToken;

  Linkk({this.persistentToken});

  factory Linkk.fromJson(Map<String, dynamic> json) {
    return Linkk(
      persistentToken: json['persistent_token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'persistent_token': persistentToken};
  }
}
