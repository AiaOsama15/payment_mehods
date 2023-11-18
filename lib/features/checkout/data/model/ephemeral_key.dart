class EphemeralKeyModel {
  late final String id;
  late final String object;
  late final List<AssociatedObjects> associatedObjects;
  late final num created;
  late final num expires;
  late final bool livemode;
  late final String secret;

  EphemeralKeyModel.fromJson(Map<String, dynamic> json){
    id = json['id'] ?? "";
    object = json['object'] ?? "";
    associatedObjects = List.from(json['associated_objects'] ?? []).map((e)=>AssociatedObjects.fromJson(e)).toList();
    created = json['created'] ?? 0;
    expires = json['expires'] ?? 0;
    livemode = json['livemode'] ?? false;
    secret = json['secret'] ?? "";
  }
}

class AssociatedObjects {
  late final String id;
  late final String type;

  AssociatedObjects.fromJson(Map<String, dynamic> json){
    id = json['id'] ?? "";
    type = json['type'] ?? "";
  }
}