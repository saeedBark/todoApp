import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo/controller/cubit.dart';
import 'package:todo/controller/state.dart';
import 'package:todo/shared/componant.dart';

class UpdateTasksScreen extends StatelessWidget {
  late int id;
  UpdateTasksScreen({required this.id});
  TextEditingController titleController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descController = TextEditingController();
  var formGlobal = GlobalKey<FormState>();
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
            title: Text('Update you tasks'.tr(),style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white),),
            elevation: 1,
            backgroundColor: Colors.blue.shade900,
          ),
          body: Center(
            child: Form(
              key: formGlobal,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CustomTextFromField(
                        controller: titleController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'please add your title'.tr();
                          }
                        },
                        hinText: 'Add your Title',
                        prifixIcon: Icons.title,
                        type: TextInputType.text,
                        lable: 'Title',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextFromField(
                          controller: timeController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'please add your Time'.tr();
                            }
                          },
                          hinText: 'Add your Time',
                          prifixIcon: Icons.watch_later_outlined,
                          type: TextInputType.datetime,
                          lable: 'Time',
                          onTap: () {
                            showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now())
                                .then((value) {
                              timeController.text = value!.format(context);
                            }).catchError((error) {
                              timeController.clear();
                            });
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextFromField(
                          controller: dateController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'please add your date'.tr();
                            }
                          },
                          hinText: 'Add your Date',
                          prifixIcon: Icons.calendar_view_day,
                          type: TextInputType.datetime,
                          lable: 'Date',
                          onTap: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2040-12-30'))
                                .then((value) {
                              dateController.text =
                                  DateFormat.yMMMd().format(value!);
                            }).catchError((error) {
                              dateController.clear();
                            });
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextFromField(
                        controller: descController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'please add your description'.tr();
                          }
                        },
                        hinText: 'Add your Descripion',
                        prifixIcon: Icons.note,
                        type: TextInputType.text,
                        lable: 'Descripion',
                        line: 5,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      MaterialButton(
                        height: 40,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        onPressed: () {
                          if (formGlobal.currentState!.validate()) {
                            cubit.updateDataIntoDatabase(
                                title: titleController.text,
                                date: dateController.text,
                                time: timeController.text,
                                description: descController.text,
                                id: id);
                          }
                        },
                        color: Colors.blue.shade900,
                        child: Text('Update Task'.tr(),style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white)),
                        minWidth: double.infinity,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
