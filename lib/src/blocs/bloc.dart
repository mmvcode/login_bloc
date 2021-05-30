import 'dart:async';
import '../mixins/validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // Change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  // Add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  // DEPRECTAED: Observable.combineLatest2((email, password, (e,p)) => true)
  // Combines the two email and pw streams into one
  Stream<bool> get submitValid =>
      CombineLatestStream.combine2(email, password, (e, p) => true);

  submit() {
    final validEmail = _email.value;
    final validPw = _password.value;

    print('Email is $validEmail and pw is $validPw');
  }

  dispose() {
    _email.close();
    _password.close();
  }
}

//final bloc = Bloc();
