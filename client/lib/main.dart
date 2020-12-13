// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'package:ALPapp/services/auth_service.dart'; //data layer for authentication
// import 'package:ALPapp/services/book_service.dart'; //data layer for book model
// import 'package:ALPapp/services/graphql_service.dart'; //graphQL configuration
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ALPapp/theme/standard_theme.dart';
// import 'package:ALPapp/pages/show.dart';
import 'package:ALPapp/pages/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  final HttpLink link = HttpLink(
    uri: 'https://alpappapi.herokuapp.com/graphql/',
  );

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: link,
    ),
  );

  runApp(App(client: client));
}

class App extends StatelessWidget {
  final ValueNotifier<GraphQLClient> client;

  const App({Key key, this.client}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: CacheProvider(
        child: MaterialApp(
            title: 'ALPapp',
            theme: StandardThemeData.themeData(),
            home: IndexPage(),
            // routes: {
            //   '/show': (context) => ShowPage(),
            // }
        ),
      )
    );
  }
}
