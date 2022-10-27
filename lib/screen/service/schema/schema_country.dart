import 'dart:convert';

import 'package:equatable/equatable.dart';

class CountrySchema extends Equatable {
  const CountrySchema({
    required this.name,
    required this.code,
    required this.id,
  });

  static const schema = 'countries';

  static const idKey = 'id';
  static const nameKey = 'name';
  static const codeKey = 'code';

  final String id;
  final String name;
  final String code;

  @override
  String toString() {
    return '$code $name';
  }

  CountrySchema copyWith({
    String? id,
    String? name,
    String? code,
  }) {
    return CountrySchema(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
    );
  }

  CountrySchema clone() {
    return copyWith(
      id: id,
      name: name,
      code: code,
    );
  }

  static List<CountrySchema> fromMapList(List<Map<String, dynamic>> data) {
    return data.map((e) => fromMap(e)).toList();
  }

  static CountrySchema fromMap(Map<String, dynamic> data) {
    return CountrySchema(
      id: data[idKey],
      code: data[codeKey],
      name: data[nameKey],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      idKey: id,
      codeKey: code,
      nameKey: name,
    };
  }

  static List<CountrySchema> fromJsonList(String source) {
    return List.of(
      (jsonDecode(source) as List).map((map) => fromMap(map)),
    );
  }

  static CountrySchema fromJson(String source) {
    return fromMap(jsonDecode(source));
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  @override
  List<Object?> get props => [
        id,
        code,
        name,
      ];
}
