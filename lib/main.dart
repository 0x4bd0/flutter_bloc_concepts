import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/cubit/counter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Bloc provider',
        home : Home(),
      ),
    );
  }
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text('Test'),
          FloatingActionButton(
            onPressed: (){
              context.bloc<CounterCubit>().inc();
            }
          ,
          child : Icon(Icons.add),
          ),          
          FloatingActionButton(
            onPressed: (){
              context.bloc<CounterCubit>().dec();
            }
          ,
          child : Icon(Icons.remove),
          )
        ],
      ),
      
    );
  }
}