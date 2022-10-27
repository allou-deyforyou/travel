
import 'dart:async';

import '_service.dart';


abstract class UserState {
  const UserState();
}

class InitUserState extends UserState {
  const InitUserState();
}

class PendingUserState extends UserState {
  const PendingUserState();
}

class FailureUserState extends UserState {
  const FailureUserState({
    required this.message,
    this.event,
  });
  final UserEvent? event;
  final String message;
}

class UserItemListState extends UserState {
  const UserItemListState({
    required this.data,
    this.subscription,
  });
  final StreamSubscription? subscription;
  final List<UserSchema> data;
}

class UserItemState extends UserState {
  const UserItemState({
    required this.data,
  });
  final UserSchema data;
}
