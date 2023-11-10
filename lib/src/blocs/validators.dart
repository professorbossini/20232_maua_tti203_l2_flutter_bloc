import 'dart:async';
import 'package:email_validator/email_validator.dart';
mixin Validators{
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      if(EmailValidator.validate(email)){
        sink.add(email);
      } 
      else{
        sink.addError('E-mail inválido ($email)');
      } 
    }
  );
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      // RegExp e = RegExp('[a-zA-Z0-9]*[^a-zA-Z0-9]+[a-zA-Z0-9]*');
      RegExp e = RegExp('[^a-zA-Z0-9]');
      if(e.hasMatch(password) || password.length < 4){
        sink.addError('Senha não pode ter caracteres especiais e deve ter, pelo menos, 4 caracteres ($password)');
      }
      else{
        sink.add(password);
      }
      
    }
  );
}