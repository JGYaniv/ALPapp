//https://github.com/zino-app/graphql-flutter/blob/master/examples/starwars/lib/client_provider.dart
import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";

class GraphQLConfiguration {
  static HttpLink httpLink = HttpLink(
    uri: "https://alpappapi.herokuapp.com/graphql",
  );

  static GraphQLClient client;
  static GraphQLConfiguration _instance;

  static initialise() {
    if (_instance == null) {
      _instance = GraphQLConfiguration();
    }
  }

  GraphQLClient getClient() {
    client ??= GraphQLClient(
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
      link: httpLink,
    );
    return client;
  }
}
