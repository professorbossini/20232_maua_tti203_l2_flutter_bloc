import 'dart:async';
import 'package:email_validator/email_validator.dart';
mixin Validators{
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      if(EmailValidator.validate(email)){
        sink.add(email);
      } 
      else{
        sink.addError('E-mail inválido');
      } 
    }
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if (password.length > 3){
        sink.add(password);
      }
      else{
        sink.addError('Senha deve ter, pelo menos, 4 caracteres');
      }
    }
  );
}