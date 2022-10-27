import 'package:equatable/equatable.dart';

import '_service.dart';

abstract class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object?> get props => List.empty();
}

class InitCountryState extends CountryState {
  const InitCountryState();
}

class PendingCountryState extends CountryState {
  const PendingCountryState();
}

class FailureCountryState extends CountryState {
  const FailureCountryState({
    required this.message,
    this.event,
  });
  final CountryEvent? event;
  final Object? message;

  @override
  List<Object?> get props => [event, message];
}

class CountryItemState extends CountryState {
  const CountryItemState({
    required this.data,
  });
  final CountrySchema data;

  @override
  List<Object?> get props => [data];
}

class CountryItemListState extends CountryState {
  const CountryItemListState({
    required this.data,
  });
  final List<CountrySchema> data;

  @override
  List<Object?> get props => [data];
}
