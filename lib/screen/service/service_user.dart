import 'dart:async';

import 'package:flutter/foundation.dart';

import '_service.dart';

class UserService extends ValueNotifier<UserState> {
  UserService([
    UserState value = const InitUserState(),
  ]) : super(value);

  static UserService? _instance;

  static UserService instance([
    UserState value = const InitUserState(),
  ]) {
    return _instance ??= UserService(value);
  }

  Future<void> handle(UserEvent event) => event._execute(this);
}

abstract class UserEvent {
  const UserEvent();

  Future<void> _execute(UserService service);
}

class QueryBulkUsers extends UserEvent {
  const QueryBulkUsers({
    this.uid,
    this.phone,
    this.subscription = false,
  });

  final bool subscription;

  final String? uid;
  final CountrySchema? phone;

  @override
  Future<void> _execute(UserService service) async {

  }
}

class QueryUser extends UserEvent {
  const QueryUser({
    this.uid,
    this.phone,
    this.subscription = false,
  });

  final bool subscription;

  final String? uid;
  final CountrySchema? phone;

  @override
  Future<void> _execute(UserService service) async {}
}

class CreateUser extends UserEvent {
  const CreateUser({
    this.uid,
    required this.name,
    required this.phone,
  });

  final String name;
  final String? uid;
  final CountrySchema phone;

  @override
  Future<void> _execute(UserService service) async {}
}

class UpdateUser extends UserEvent {
  const UpdateUser({
    this.name,
    this.phone,
    required this.item,
  });

  final UserSchema item;

  final String? name;
  final CountrySchema? phone;

  @override
  Future<void> _execute(UserService service) async {}
}

class DeleteUser extends UserEvent {
  const DeleteUser({
    required this.item,
  });

  final UserSchema item;

  @override
  Future<void> _execute(UserService service) async {}
}
