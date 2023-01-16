import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/controller/cubit.dart';
import 'package:todo/controller/state.dart';
import 'package:todo/views/add_tasks_screen.dart';
import 'package:todo/views/drawer_screen.dart';
import 'package:todo/views/update_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoState>(
      listener: (context, state) {
        if (state is SuccessInsertIntoTodoDatabaseState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var cubit = TodoCubit.get(context);
        return Scaffold(

          appBar: AppBar(
            title: Text('My task'.tr(),style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white),),
            elevation: 1,
            backgroundColor: Colors.blue.shade900,
          ),
          drawer: Drawer(
            child: Container(
              color: Colors.blue.shade900,
              alignment: AlignmentDirectional.center,
              child: DrawerScreen(),
            ),
          ),
          body: ConditionalBuilder(
            condition: state is! LoadingGetDataFromTodoDatabaseState,
            builder: (BuildContext context) {
              return (cubit.tasks.isNotEmpty)
                  ? ListView.builder(
                      itemBuilder: (context, index) => Column(
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return UpdateTasksScreen(id: cubit.tasks[index]['id'],);
                              }));
                            },
                            child: Card(
                              margin: EdgeInsets.all(8),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cubit.tasks[index]['title'],
                                          style:
                                              Theme.of(context).textTheme.bodyText1,
                                        ),
                                        Text(
                                          cubit.tasks[index]['time'],
                                          style:
                                              Theme.of(context).textTheme.caption,
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              cubit.deleteDataFromDatabase(
                                                  id: cubit.tasks[index]['id']);
                                            },
                                            icon: Icon(Icons.cancel)),
                                      ],
                                    ),
                                    Text(cubit.tasks[index]['description'],
                                        style:
                                            Theme.of(context).textTheme.headline6),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      itemCount: cubit.tasks.length,
                    )
                  : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.hourglass_empty),
                          Text(
                            'There is no tasks her'.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.deepOrange),
                          )
                        ],
                      ),
                  );
            },
            fallback: (BuildContext context) =>
                Center(child: CircularProgressIndicator()),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AddTasksScreen();
              }));
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
