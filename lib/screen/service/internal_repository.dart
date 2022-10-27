import 'package:graphql/client.dart';

class RepositoryService {
  const RepositoryService._();

  static final _rootURL = Uri(host: 'localhost', port: 8080, path: 'graphql');

  static String? _wsURL;
  static String get wsURL => _wsURL!;

  static String? _httpURL;
  static String get httpURL => _httpURL!;

  static void development() {
    _wsURL = _rootURL.replace(scheme: 'ws').toString();
    _httpURL = _rootURL.replace(scheme: 'http').toString();
  }

  static void production() {
    development();
  }

  static GraphQLClient get client {
    final httpLink = HttpLink(httpURL);
    final wsLink = WebSocketLink(wsURL);
    final link = Link.split((request) => request.isSubscription, wsLink, httpLink);
    final cache = GraphQLCache(store: HiveStore());
    return GraphQLClient(link: link, cache: cache);
  }
}
