import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/res/colours.dart';
import '../../../../core/res/text_localization.dart';
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
    super.initState();
    context.read<DashboardController>().getScreens();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(1),
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colours.btnActiveColour,
            unselectedItemColor: Colours.btnDisabledColour,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
            backgroundColor: Colours.baseColour10,
            elevation: 0,
            onTap: controller.changeIndex,
            items: [
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Icon(
                      Icons.home_outlined,
                      color: controller.currentIndex == 0
                          ? Colours.btnActiveColour
                          : Colours.btnDisabledColour,
                    ),
                    Text(
                      Tz.getDashboardText(DashboardText.dashboard),
                      style: TextStyle(
                        color: controller.currentIndex == 0
                            ? Colours.btnActiveColour
                            : Colours.btnDisabledColour,
                      ),
                    ),
                  ],
                ),
                label: Tz.getDashboardText(DashboardText.dashboard),
                backgroundColor: Colours.baseColour10,
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Icon(
                      Icons.compare_arrows_sharp,
                      color: controller.currentIndex == 1
                          ? Colours.btnActiveColour
                          : Colours.btnDisabledColour,
                    ),
                    Text(
                      Tz.getDashboardText(DashboardText.transaction),
                      style: TextStyle(
                        color: controller.currentIndex == 1
                            ? Colours.btnActiveColour
                            : Colours.btnDisabledColour,
                      ),
                    ),
                  ],
                ),
                label: Tz.getDashboardText(DashboardText.transaction),
                backgroundColor: Colours.baseColour10,
              ),
              BottomNavigationBarItem(
                icon: Transform.translate(
                  offset: const Offset(0, -12),
                  child: Column(
                    children: [
                      Transform.translate(
                        offset: const Offset(0, -18),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colours.btnActiveColour,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(12),
                          child: const Icon(
                            Icons.qr_code,
                            color: Colours.baseColour10,
                          ),
                        ),
                      ),
                      Text(
                        Tz.getDashboardText(DashboardText.qris),
                        style: TextStyle(
                          color: controller.currentIndex == 2
                              ? Colours.btnActiveColour
                              : Colours.btnDisabledColour,
                        ),
                      ),
                    ],
                  ),
                ),
                label: Tz.getDashboardText(DashboardText.qris),
                backgroundColor: Colours.baseColour10,
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Icon(
                      Icons.account_balance_wallet_outlined,
                      color: controller.currentIndex == 3
                          ? Colours.btnActiveColour
                          : Colours.btnDisabledColour,
                    ),
                    Text(
                      Tz.getDashboardText(DashboardText.settlement),
                      style: TextStyle(
                        color: controller.currentIndex == 3
                            ? Colours.btnActiveColour
                            : Colours.btnDisabledColour,
                      ),
                    ),
                  ],
                ),
                label: Tz.getDashboardText(DashboardText.settlement),
                backgroundColor: Colours.baseColour10,
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Icon(
                      Icons.person_outline,
                      color: controller.currentIndex == 4
                          ? Colours.btnActiveColour
                          : Colours.btnDisabledColour,
                    ),
                    Text(
                      Tz.getDashboardText(DashboardText.profile),
                      style: TextStyle(
                        color: controller.currentIndex == 4
                            ? Colours.btnActiveColour
                            : Colours.btnDisabledColour,
                      ),
                    ),
                  ],
                ),
                label: Tz.getDashboardText(DashboardText.profile),
                backgroundColor: Colours.baseColour10,
              ),
            ],
          ),
        ),
      );
    });
  }
}
