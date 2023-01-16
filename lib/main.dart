import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/controller/cubit.dart';
import 'package:todo/shared/styles/themes.dart';
import 'package:todo/views/home_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(path: 'assets/translations',supportedLocales: [
    Locale('en','US'),
    Locale('ar','EG'),
  ],
  fallbackLocale:  Locale('en','US'),

  child: const Todo()));
}

class Todo extends StatelessWidget {
  const Todo({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodoCubit()..creatDatabase(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: lightTheme,
        // darkTheme: darkTheme,
        home: AnimatedSplashScreen(
          splash: Image.asset(
            'assets/images/todo1.jpg',
            fit: BoxFit.cover,
          ),
          nextScreen: HomeScreen(),
          splashIconSize: double.infinity,
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
          backgroundColor: Colors.transparent,
          duration: 1000,
        ),
      ),
    );
  }
}
