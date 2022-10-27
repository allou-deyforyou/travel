import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';

import '_service.dart';

class CountryService extends ValueNotifier<CountryState> {
  CountryService([
    CountryState value = const InitCountryState(),
  ]) : super(value);

  static CountryService? _instance;

  static CountryService instance([
    CountryState value = const InitCountryState(),
  ]) {
    return _instance ??= CountryService(value);
  }

  @override
  set value(CountryState value) {
    debugPrint(value.toString());
    super.value = value;
  }

  Future<void> handle(CountryEvent event) => event._execute(this);
}

abstract class CountryEvent extends Equatable {
  const CountryEvent();

  GraphQLClient get client => RepositoryService.client;

  Future<void> _execute(CountryService service);

  @override
  List<Object?> get props => List.empty();
}

class QueryBulkCountry extends CountryEvent {
  const QueryBulkCountry();

  static const String _actionName = 'QueryBulkCountry';
  static const String _document = '''
    query $_actionName {
      $_actionName: ${CountrySchema.schema} {
        ${CountrySchema.idKey}
        ${CountrySchema.codeKey}
        ${CountrySchema.nameKey}
      }
    }
  ''';

  @override
  Future<void> _execute(CountryService service) async {
    service.value = const PendingCountryState();
    try {
      final result = await client.query(QueryOptions(document: gql(_document)));
      if (result.hasException) {
        service.value = FailureCountryState(message: result.exception, event: this);
      } else {
        service.value = CountryItemListState(data: CountrySchema.fromMapList(result.data![_actionName]));
      }
    } catch (error) {
      service.value = FailureCountryState(message: error, event: this);
    }
  }
}
