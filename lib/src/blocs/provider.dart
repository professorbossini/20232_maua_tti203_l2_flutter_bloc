import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget{
  final bloc = Bloc();
  //se fosse Java...
  // Provider({Key? key, required Widget child}){
  //   super(key, child);
  // }

  //mas não é...
  Provider({super.key, required super.child});
  // Provider({Key? key, required Widget child}): super(key: key, child: child);
  

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static Bloc of (BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<Provider>()!.bloc;  
  }
}