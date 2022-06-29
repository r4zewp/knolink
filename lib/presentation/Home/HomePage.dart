import 'package:flutter/material.dart';
import 'package:knolink/datasources/env/env.dart';
import 'package:knolink/presentation/Orders/FindOrders.dart';
import 'package:knolink/presentation/Profile/CustomerProfile.dart';
import '../Orders/CustomerHistoryOfOrders.dart';
import '../Orders/CustomerMyOrders.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
    required this.type,
    this.university,
    required this.username,
  }) : super(key: key);

  final String username;
  final String? university;
  final String type;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late TabController tabController;

  @override
  void initState() {
    tabController =
        TabController(length: widget.type == "customer" ? 3 : 4, vsync: this);
    super.initState();
  }

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    /// customer view
    List<Widget> pagesWithSort = [
      FindOrders(type: widget.type),
      MyOrders(type: widget.type),
      CustomerOrdersHistory(type: widget.type),
      CustomerProfile(type: widget.type),
    ];

    /// tutor view
    List<Widget> defaultPages = [
      MyOrders(type: widget.type),
      CustomerOrdersHistory(type: widget.type),
      CustomerProfile(type: widget.type),
    ];

    Size screenSize = MediaQuery.of(context).size;

    List<Widget> defaultTabs = [
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
    ];

    List<Widget> tabsWithSort = [
      Padding(
        padding: EdgeInsets.fromLTRB(
          screenSize.width * 0.022,
          screenSize.height * 0.0125 * 2,
          screenSize.width * 0.022,
          screenSize.height * 0.0125 * 2,
        ),
        child: const Text(
          "Найти заказ",
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
    ];
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
                tabs: widget.type == "customer" ? defaultTabs : tabsWithSort,
              ),
            ),
            if (widget.type == "customer")
              SizedBox(
                height: screenSize.height * 0.9,
                child: TabBarView(
                  controller: tabController,
                  children: defaultPages,
                ),
              ),
            if (widget.type == "tutor")
              SizedBox(
                height: screenSize.height * 0.9,
                child: TabBarView(
                  controller: tabController,
                  children: pagesWithSort,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
