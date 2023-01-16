import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/controller/cubit.dart';
import 'package:todo/controller/state.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = TodoCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('saeed'),
          ),
          body: Center(
            child: Column(
              children: [

                IconButton(onPressed: (){
                  cubit.insrtTodoDatabase(title: 'go',date: '12',time: '12:12',description: 'welcom');
                }, icon: Icon(Icons.search)),

                IconButton(onPressed: (){
                  cubit.gettingDataFromDatabase(cubit.database);
                }, icon: Icon(Icons.ac_unit)),

                IconButton(onPressed: (){
                  cubit.updateDataIntoDatabase(title: 'went', date: '14', time: '3', description: 'hi', id: 1);
                }, icon: Icon(Icons.update)),

                IconButton(onPressed: (){
                  cubit.deleteDataFromDatabase(id: 1);
                }, icon: Icon(Icons.delete)),

              ],
            ),
          ),
        );
      },
    );
  }
}
