import 'dart:convert';

import 'package:equatable/equatable.dart';

import '_schema.dart';

class UserSchema extends Equatable {
  const UserSchema({
    required this.id,
    required this.uid,
    required this.name,
    required this.phone,
  });

  static const idKey = 'id';
  static const uidKey = 'uid';
  static const phoneKey = 'phone';
  static const nameKey = 'name';

  final String? id;
  final String? uid;
  final String? name;
  final CountrySchema phone;

  @override
  List<Object?> get props {
    return [
      uid,
      uid,
      phone,
    ];
  }

  UserSchema copyWith({
    String? id,
    String? uid,
    String? name,
    CountrySchema? phone,
  }) {
    return UserSchema(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      phone: phone ?? this.phone,
      name: name ?? this.name,
    );
  }

  UserSchema clone() {
    return copyWith(
      id: id,
      uid: uid,
      phone: phone,
      name: name,
    );
  }

  static UserSchema fromMap(Map<String, dynamic> data) {
    return UserSchema(
      id: data[idKey],
      uid: data[uidKey],
      name: data[nameKey],
      phone: CountrySchema.fromJson(data[phoneKey]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      idKey: id,
      uidKey: uid,
      nameKey: name,
      phoneKey: phone.toMap(),
    };
  }

  static List<UserSchema> fromListJson(String source) {
    return List.of(
      (jsonDecode(source) as List).map((map) => fromMap(map)),
    );
  }

  static UserSchema fromJson(String source) {
    return fromMap(jsonDecode(source));
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
