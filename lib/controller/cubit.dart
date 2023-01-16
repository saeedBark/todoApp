

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/controller/state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(InitialTodoState());

  static TodoCubit get(context) => BlocProvider.of(context);

  Database? database;

  void creatDatabase() {
    //path here is the file name
    //db database
    openDatabase('Todo.db', version: 1, onCreate: (database, verson) {
      //here our database is create (only for the first time )
      print('the database is create');
      database
          .execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY ,title TEXT, date TEXT ,time TEXT,description TEXT,status TEXT)')
          .then((value) {
        print('our table  is create succ');
      }).catchError((error) {
        print('our table is not  create in database ');
      });
    }, onOpen: (database) {
      print('database file is opned ');
      gettingDataFromDatabase(database);
    }).then((value) {
      // the database file is opened succ
      database = value;
      emit(CreateTodoDatabaseState());
    }).catchError((error) {
      print('database file is not opned');
    });
  }

  void insrtTodoDatabase({
    required title,
    required date,
    required time,
    required description,
    String status = 'new',
  }) {
    //insert into table
    database!.transaction((txn) async {
      txn
          .rawInsert(
          'INSERT INTO tasks (title ,date , time ,description,status) VALUES("$title ","$date","$time","$description","$status")')
          .then((value) {
        print('$value is insert successfully');
        gettingDataFromDatabase(database);
        emit(SuccessInsertIntoTodoDatabaseState());
      }).catchError((error) {
        print('an error when insert into database');
      });
    });
  }

  List tasks = [];

  void gettingDataFromDatabase(Database? database) {
    tasks = [];
    emit(LoadingGetDataFromTodoDatabaseState());
    database!.rawQuery('SELECT * FROM tasks').then((value) {
      print('our get data is succ');
      value.forEach((element) {
        tasks.add(element);
      });
      print(value);
      emit(SuccessGetDataFromTodoDatabaseState());
    }).catchError((error) {
      print('an error get data from databse ${error.toString()}');
    });
  }

  void updateDataIntoDatabase({
    required String title,
    required String date,
    required String time,
    required String description,
    required int id,
  }) {
    database!.update('tasks', {
      'title': title,
      'time': time,
      'date': date,
      'description': description,

    }, where: 'id =?', whereArgs: [id]).then((value) {
      print('updating data has successfully happened');
      gettingDataFromDatabase(database);
    }).catchError((error) {
      print('an error when updating data');
    });
  }

  void deleteDataFromDatabase({
    required int id,
  }) {
    database!.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      print('$value success delete data from database ');
      gettingDataFromDatabase(database);
    }).catchError((error) {
      print('an error delete data from database');
    });
  }

  void changeLanguageToArabic(BuildContext context) {
    if (EasyLocalization.of(context)!.locale ==  Locale('en', 'US')) {
      context.locale =  Locale('ar', 'EG');
    }
    emit(ChangeLanguageToArabic());
  }

  void changeLanguageToEnglish(BuildContext context) {
    if (EasyLocalization.of(context)!.locale ==  Locale('ar', 'EG')) {
      context.locale =  Locale('en', 'US');
    }
    emit(ChangeLanguageToEnglish());
  }
}