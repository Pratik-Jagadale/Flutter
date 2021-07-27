
import 'package:flutter/material.dart';
  void main(){

    runApp(MyApplication() );

  }

  class MyApplication extends StatelessWidget {
    Widget build(BuildContext context){
      return MaterialApp(home: Scaffold(
          appBar: AppBar(
                  title: Text("My First App") 
          ),
          body: Text("this is my default text"),
        ),
      );
    }
  }

  /*
//Dart basic program
class Person{
  String name = "Pratik";
  int age = 21;
}

void addNumbers(int num1,int num2){
  print(num1+num2); 
}

void main() {
  
  addNumbers(20,30);
  
  for (int i = 0; i < 5; i++) {
    print('hello ${i + 1}');
  }
}
  */