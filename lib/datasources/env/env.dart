import 'package:flutter/material.dart';

const String primaryFontFamily = 'Ubuntu';

const primaryErrorColor = Color.fromARGB(255, 239, 89, 89);

const primaryInputBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.transparent, //Color(0xff303030),
    width: 2.0,
  ),
  borderRadius: BorderRadius.all(Radius.circular(8)),
);

const primaryPurpleInputBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: Color(0xff9C5CEE),
    width: 2.0,
  ),
  borderRadius: BorderRadius.all(Radius.circular(8)),
);

///

const primaryErrorInputBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: Color.fromARGB(255, 239, 89, 89),
    width: 2.0,
  ),
  borderRadius: BorderRadius.all(Radius.zero),
);

const orderCreateCommentBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(8.0),
  ),
  borderSide: BorderSide(
    color: Color(0xff6969B3),
    width: 3.0,
  ),
);

const subjectsList = [
  "Не выбрано",
  "Русский язык",
  "Алгебра",
  "Геометрия",
  "Литература",
  "Физика",
  "Химия",
  "Биология",
  "География",
  "Английский язык",
  "Немецкий язык",
  "Французский язык",
];

const orderTypesList = [
  "Не выбрано",
  "Консультация",
];
