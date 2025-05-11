import 'AssociatedObject.dart';

class EphemeralKey {
  final String id;
  final String object;
  final List<AssociatedObject> associatedObjects;
  final int created;
  final int expires;
  final bool livemode;
  final String secret;

  EphemeralKey({
    required this.id,
    required this.object,
    required this.associatedObjects,
    required this.created,
    required this.expires,
    required this.livemode,
    required this.secret,
  });

  factory EphemeralKey.fromJson(Map<String, dynamic> json) {
    // ✅ Correct key name and add null safety check
    var list = json['associated_objects'] as List? ?? [];

    // ✅ Ensure the list is properly mapped
    List<AssociatedObject> associatedObjectsList =
    list.map((i) => AssociatedObject.fromJson(i as Map<String, dynamic>)).toList();

    return EphemeralKey(
      id: json['id'],
      object: json['object'],
      associatedObjects: associatedObjectsList,
      created: json['created'],
      expires: json['expires'],
      livemode: json['livemode'],
      secret: json['secret'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'object': object,
      'associated_objects': associatedObjects.map((i) => i.toJson()).toList(),
      'created': created,
      'expires': expires,
      'livemode': livemode,
      'secret': secret,
    };
  }
}
