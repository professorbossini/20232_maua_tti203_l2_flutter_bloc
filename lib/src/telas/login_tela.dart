import 'package:flutter/material.dart';
import 'package:gerenciamento_de_estadov2/src/blocs/bloc.dart';

class LoginTela extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(),
          passwordField(),
          Row(
            children: [
              Expanded(
                child: Container(
                margin: EdgeInsets.only(top: 12.0),
                child: submitButton(),
                )
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget emailField(){
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, AsyncSnapshot <String> snapshot){
        return TextField(
          onChanged: (valor){bloc.changeEmail(valor);},
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'seu@email.com',
            labelText: 'Digite seu e-mail',
            errorText: snapshot.hasError ? '${snapshot.error}' : null 
          ),
        );
      },
    );
  }

  Widget passwordField(){
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Senha',
        labelText: 'Senha'
      ),
    );
  }

  Widget submitButton(){
    return ElevatedButton(
      onPressed: null, 
      child: Text('OK')
    );
  }
}