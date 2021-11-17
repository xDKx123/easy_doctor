import 'package:easy_doctor/src/app.dart';
import 'package:easy_doctor/src/graphQl/graphql.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  final ValueNotifier<GraphQLClient> client =
      GraphQl.getTestingEnvironmentClient();

  runApp(App(
    client: client,
  ));
}
