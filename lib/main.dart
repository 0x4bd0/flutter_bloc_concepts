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
        home: Home(),
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
    return Scaffold(
      body: BlocConsumer<CounterCubit, CounterState>(
      listener: (context, state) {
        if(state.up == true){
         Scaffold.of(context).showSnackBar(
           SnackBar(content: Text('added 1',),duration: Duration(microseconds: 200),)
         );
        } else if (state.up == false){
         Scaffold.of(context).showSnackBar(
           SnackBar(content: Text('removed 1'),)
         );
        }
      },
      builder: (context, state) {
          return Row(
          children: [
           Card(
             child: Text('${state.counterVal}'),
           ),
           FloatingActionButton(
              onPressed: () {
                context.bloc<CounterCubit>().inc();
              },
              child: Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () {
                context.bloc<CounterCubit>().dec();
              },
              child: Icon(Icons.remove),
            ),
          ],
        );
     },
      ),
    );
  }
}
