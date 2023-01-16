import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
Widget CustomTextFromField({
  required TextEditingController? controller,
  required FormFieldValidator? validator,
  ValueChanged<String>? submit,
  required TextInputType? type,
  required String lable,
  required IconData? prifixIcon,
  required String hinText,
  GestureTapCallback? onTap,
  int? line,
}) =>
    TextFormField(
      validator: validator,
      onTap: onTap,
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: submit,
      maxLines:line,
      decoration: InputDecoration(
        labelText: lable.tr(),
        hintText: hinText.tr(),
        prefixIcon: Icon(prifixIcon),
        isDense: true,
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),

      ),
    );
