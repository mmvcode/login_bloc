import 'package:flutter/material.dart';
import '../blocs/provider.dart';
import '../blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  Widget build(context) {
    final bloc = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          Container(margin: EdgeInsets.only(top: 25)),
          submitButton(bloc)
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: 'john@email.com',
                labelText: 'Email address',
                errorText:
                    snapshot.hasError ? snapshot.error.toString() : null),
          );
        });
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                errorText:
                    snapshot.hasError ? snapshot.error.toString() : null),
          );
        });
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.submitValid,
        builder: (context, snapshot) {
          return ElevatedButton(
            onPressed: !snapshot.hasData ? null : bloc.submit,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.login),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text('Login'),
                ),
              ],
            ),
          );
        });
  }
}
