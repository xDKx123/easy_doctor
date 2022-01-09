import 'dart:convert';

import 'package:http/http.dart';
/*
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
*/

class RestRequest {
  const RestRequest();

  static const String server = 'http://127.0.0.1:3000';

  static Future<Map<String, dynamic>> postRequest(
      {required String request,
      Map<String, dynamic> body = const <String, dynamic>{}}) async {
    try {
      final Response response = await post(Uri.parse(server + request),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(body));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
      throw Exception(response.statusCode);
    } catch (e) {
      rethrow;
    }
  }
}
