import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";

class GraphQLConfig  {


  static String token = "your can get it from a secured storage";
  static HttpLink httpLink = HttpLink(
   'https://api.mpfstyleclub.com/graphql',
  );

  ///if you want to pass token
 static  ValueNotifier<GraphQLClient> graphInit()  {
    // We're using HiveStore for persistence,
    // so we need to initialize Hive.


    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: httpLink,
        // The default store is the InMemoryStore, which does NOT persist to disk
        cache: GraphQLCache(
         
        ),
      ),
    );

    return client;
  }






 GraphQLClient clientToQuery() {
   

  
   return GraphQLClient(
     cache: GraphQLCache(
      
     ),
     link: httpLink,
   );
 }
}