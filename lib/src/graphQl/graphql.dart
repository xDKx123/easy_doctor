import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQl {
  static HttpLink testingServer = HttpLink("http://10.0.2.2:4000/");
  static HttpLink productionServer = HttpLink(""); //TODO: set when done

  static ValueNotifier<GraphQLClient> getTestingEnvironmentClient() {
    ValueNotifier<GraphQLClient> client = ValueNotifier(
        GraphQLClient(cache: GraphQLCache(), link: testingServer));

    return client;
  }

  static ValueNotifier<GraphQLClient> getProductionEnvironmentClient() {
    ValueNotifier<GraphQLClient> client = ValueNotifier(
        GraphQLClient(cache: GraphQLCache(), link: productionServer));

    return client;
  }
}
