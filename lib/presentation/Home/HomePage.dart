import 'package:flutter/material.dart';
import 'package:knolink/datasources/env/env.dart';
import 'package:knolink/presentation/Profile/CustomerProfile.dart';
import 'package:knolink/presentation/Profile/TutorProfile.dart';
import '../Orders/CustomerHistoryOfOrders.dart';
import '../Orders/CustomerMyOrders.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);

    // TODO: implement initState
    super.initState();
  }

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    List<Widget> customerPages = [
      const MyOrders(),
      const CustomerOrdersHistory(),
      CustomerProfile(),
    ];
    List<Widget> tutorPages = [
      const MyOrders(),
      const CustomerOrdersHistory(),
      TutorProfile(),
    ];
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.10,
              child: TabBar(
                indicator: const BoxDecoration(),
                isScrollable: true,
                splashFactory: NoSplash.splashFactory,
                controller: tabController,
                labelStyle: const TextStyle(
                  fontFamily: primaryFontFamily,
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                ),
                unselectedLabelStyle: const TextStyle(
                  color: Colors.white,
                  fontFamily: primaryFontFamily,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
                tabs: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      screenSize.width * 0.022,
                      screenSize.height * 0.0125 * 2,
                      screenSize.width * 0.022,
                      screenSize.height * 0.0125 * 2,
                    ),
                    child: const Text(
                      "Активные заказы",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      screenSize.width * 0.022,
                      screenSize.height * 0.0125 * 2,
                      screenSize.width * 0.022,
                      screenSize.height * 0.0125 * 2,
                    ),
                    child: const Text(
                      "История заказов",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      screenSize.width * 0.022,
                      screenSize.height * 0.0125 * 2,
                      screenSize.width * 0.022,
                      screenSize.height * 0.0125 * 2,
                    ),
                    child: const Text(
                      "Профиль",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.9,
              child: TabBarView(
                controller: tabController,
                children: customerPages,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
