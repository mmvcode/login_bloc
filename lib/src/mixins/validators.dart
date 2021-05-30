import 'dart:async';

mixin Validators {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if(email.contains('@')) {
        sink.add(email);
      } else {
        sink.addError('Invalid email');
      }
    }
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if(password.length >= 8) {
        sink.add(password);
      } else {
        sink.addError('Password must be greater than 8 characters');
      }
    }
  );
}
