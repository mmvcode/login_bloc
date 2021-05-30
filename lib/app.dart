import 'package:flutter/material.dart';
import 'src/screens/login_screen.dart';
import 'src/blocs/provider.dart';
class App extends StatelessWidget {
  build(context) {
    return Provider(
      key: Key('provider'),
      child: MaterialApp(
        title: 'Log me In',
        home: Scaffold(
          body: LoginScreen(),
        )));
  }
}
