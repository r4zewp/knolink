import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knolink/presentation/Auth/Utils/TutorAddNickname.dart';
import 'package:knolink/presentation/Auth/Utils/TutorAddUni.dart';

import '../bloc/tutor/tutor_bloc.dart';

class TutorAdd extends StatefulWidget {
  const TutorAdd({Key? key}) : super(key: key);

  @override
  State<TutorAdd> createState() => _TutorAddState();
}

class _TutorAddState extends State<TutorAdd>
    with SingleTickerProviderStateMixin {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        pageSnapping: false,
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          TutorAddNickname(
            pagec: pageController,
          ),
          TutorAddUniv(
            pagec: pageController,
          ),
        ],
      ),
    );
  }
}
