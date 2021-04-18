import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/db_service.dart';
import 'layout.dart';

void main() {
  runApp(ALPapp());
}

class ALPapp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DBService>(
          create: (_) => DBService.ensureInitialized(),
        )
      ],
      child: MaterialApp(
        home: Layout(),
        title: "ALPapp"
      ),
    );
  }
}
