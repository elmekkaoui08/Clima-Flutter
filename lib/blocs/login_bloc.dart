import 'dart:async';

class LoginBloc {
  final _emailController = StreamController();
  final _passwordController = StreamController();
  final emailValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (data, sink) {
    if (data.contains('@')) {
      sink.add(data);
    } else {
      sink.addError('Invalid Email!');
    }
  });
  final passwordValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (data, sink) {
    if (data.length > 6) {
      sink.add(data);
    } else {
      sink.addError('Enter a valid password !');
    }
  });

  Function(String) get changedEmail => _emailController.sink.add;
  Function(String) get changedPassword => _passwordController.sink.add;

  Stream<String> get email => _emailController.stream;
  Stream<String> get password => _passwordController.stream;

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
