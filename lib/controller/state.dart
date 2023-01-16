
abstract class TodoState {}

class InitialTodoState extends TodoState {}

class CreateTodoDatabaseState extends TodoState{}

class SuccessInsertIntoTodoDatabaseState extends TodoState{}

class LoadingGetDataFromTodoDatabaseState extends TodoState{}

class SuccessGetDataFromTodoDatabaseState extends TodoState{}

class SuccessUpdateDataFromTodoDatabaseState extends TodoState{}

class ChangeLanguageToEnglish extends TodoState{}

class ChangeLanguageToArabic extends TodoState{}