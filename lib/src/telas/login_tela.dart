import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';
class LoginTela extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          Row(
            children: [
              Expanded(
                child: Container(
                margin: EdgeInsets.only(top: 12.0),
                child: submitButton(bloc),
                )
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc){
    return StreamBuilder(
      stream: bloc.email, 
      builder:(context, snapshot){
        return TextField(
          onChanged: (newValue) => bloc.changeEmail(newValue),
          // onChanged: bloc.changeEmail,
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

  Widget passwordField(Bloc bloc){
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, AsyncSnapshot <String> snapshot) => TextField(
        onChanged: bloc.changePassword,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Senha',
          labelText: 'Senha',
          errorText: snapshot.hasError ? '${snapshot.error}' : null
        ),
      )
    );
  }

  Widget submitButton(Bloc bloc){
    return ElevatedButton(
      onPressed: (){}, 
      child: Text('OK')
    );
  }
}