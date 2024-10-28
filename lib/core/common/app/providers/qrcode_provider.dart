import 'package:flutter/material.dart';

class QrcodeProvider extends ChangeNotifier {
  int _tabIndex = 0;

  int get tabIndex => _tabIndex;

  void setTabIndex(int index) {
    _tabIndex = index;
    notifyListeners();
  }

  final List<String> _transactionNominal = [
    '10000',
    '20000',
    '30000',
    '40000',
    '50000',
    '100000',
  ];

  List<String> get transactionNominal => _transactionNominal;

  int _selectedNominalIndex = -1;

  int get selectedNominalIndex => _selectedNominalIndex;

  void setSelectedNominalIndex(int index) {
    if (_selectedNominalIndex == index) {
      _selectedNominalIndex = -1;
    } else {
      _selectedNominalIndex = index;
    }
    notifyListeners();
  }

  double _nominal = 0;

  double get nominal => _nominal;

  void setNominal(double nominal) {
    _nominal = nominal;
    notifyListeners();
  }
}
