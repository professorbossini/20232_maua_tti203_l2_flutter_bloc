import 'dart:async';
import 'validators.dart';

class Bloc with Validators{
  final _emailStreamController = StreamController <String> ();
  final _passwordStreamController = StreamController <String>();

 Function(String) get changeEmail => _emailStreamController.sink.add;

 Function(String) get changePassword => _passwordStreamController.sink.add;

 Stream<String> get email => _emailStreamController.stream;

 Stream <String> get password => _passwordStreamController.stream;
}

// void teste(){
//   // final bloc = Bloc();
//   // bloc._emailStreamController.sink.add('kewalçjfw');
//   // bloc.changeEmail(2);
//   // bloc.email.listen();
// }