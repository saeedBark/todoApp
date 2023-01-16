import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/controller/cubit.dart';
import 'package:todo/controller/state.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = TodoCubit.get(context);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('change your Language'.tr(),style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white),),
            SizedBox(height: 15,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  color: Colors.deepOrange,
                  onPressed: () {
                    cubit.changeLanguageToEnglish(context);
                  },
                  child: Text('English'.tr()),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                SizedBox(height: 15,),
                MaterialButton(
                  onPressed: () {
                    cubit.changeLanguageToArabic(context);
                  },
                  child: Text('Arabic'.tr()),
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
