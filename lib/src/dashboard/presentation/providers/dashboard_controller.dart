import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:vendio_id/src/home/presentation/views/home_screen.dart';
import 'package:vendio_id/src/qrcode/presentation/views/qrcode_screen.dart';

import '../../../../core/common/app/providers/tab_navigator.dart';
import '../../../../core/common/views/persistent_view.dart';
import '../../../../core/services/injection_container.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/views/profile_screen.dart';
import '../../../qrcode/presentation/bloc/qrcode_bloc.dart';
import '../../../settlement/presentation/bloc/settlement_bloc.dart';
import '../../../settlement/presentation/views/settlement_screen.dart';
import '../../../transaction/presentation/bloc/transaction_bloc.dart';
import '../../../transaction/presentation/views/transaction_screen.dart';

class DashboardController extends ChangeNotifier {
  List<int> _indexHistory = [0];
  // I want to get role user from ContextExtensions on BuildContext

  late List<Widget> _screens = [];

  List<Widget> get screens => _screens;

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  bool _isOverlay = false;

  bool get isOverlay => _isOverlay;

  void getScreens() {
    _screens = [
      ChangeNotifierProvider(
          create: (_) => TabNavigator(
                TabItem(
                  child: BlocProvider(
                    create: (context) => sl<AuthBloc>(),
                    child: const HomeScreen(),
                  ),
                ),
              ),
          child: const PersistentView()),
      ChangeNotifierProvider(
          create: (_) => TabNavigator(
                TabItem(
                  child: BlocProvider(
                    create: (context) => sl<TransactionBloc>(),
                    child: const TransactionScreen(),
                  ),
                ),
              ),
          child: const PersistentView()),
      ChangeNotifierProvider(
          create: (_) => TabNavigator(
                TabItem(
                  child: BlocProvider(
                    create: (context) => sl<QrcodeBloc>(),
                    child: const QrcodeScreen(),
                  ),
                ),
              ),
          child: const PersistentView()),
      ChangeNotifierProvider(
          create: (_) => TabNavigator(
                TabItem(
                  child: BlocProvider(
                    create: (context) => sl<SettlementBloc>(),
                    child: const SettlementScreen(),
                  ),
                ),
              ),
          child: const PersistentView()),
      ChangeNotifierProvider(
          create: (_) => TabNavigator(
                TabItem(
                  child: BlocProvider(
                    create: (context) => sl<AuthBloc>(),
                    child: const ProfileScreen(),
                  ),
                ),
              ),
          child: const PersistentView()),
    ];
  }

  void changeIndex(int index) {
    if (index == _currentIndex) return;
    _currentIndex = index;
    _indexHistory.add(index);
    notifyListeners();
  }

  void changeOverlay(bool isOverlay) {
    _isOverlay = isOverlay;
    notifyListeners();
  }

  void goBack() {
    if (_indexHistory.length == 1) return;
    _indexHistory.removeLast();
    _currentIndex = _indexHistory.last;
    notifyListeners();
  }

  void resetIndex() {
    _indexHistory = [0];
    _currentIndex = 0;
    notifyListeners();
  }
}
