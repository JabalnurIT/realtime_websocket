import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../core/res/colours.dart';
import '../providers/dashboard_controller.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  static const routeName = '/dashboard';

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    context.read<DashboardController>().getScreens();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardController>(builder: (_, controller, __) {
      return Scaffold(
        body: IndexedStack(
          index: controller.currentIndex,
          children: controller.screens,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colours.secondaryColour,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(1),
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: SafeArea(
            child: BottomNavigationBar(
              currentIndex: controller.currentIndex,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              onTap: controller.changeIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: controller.currentIndex == 0
                              ? Colours.accentColour
                              : Colors.transparent,
                          width: 5.0,
                        ),
                      ),
                    ),
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Icon(
                      Icons.bar_chart,
                      size: 32,
                      color: controller.currentIndex == 0
                          ? Colours.accentColour
                          : Colors.grey,
                    ),
                  ),
                  label: 'Chart',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: controller.currentIndex == 1
                              ? Colours.accentColour
                              : Colors.transparent,
                          width: 5.0,
                        ),
                      ),
                    ),
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Icon(
                      Icons.data_exploration,
                      size: 32,
                      color: controller.currentIndex == 1
                          ? Colours.accentColour
                          : Colors.grey,
                    ),
                  ),
                  label: 'Watchlist',
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
