import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vendio_id/core/common/widgets/i_fields.dart';

import '../../../../core/res/colours.dart';
import '../widgets/tile_settlement.dart';

class SettlementScreen extends StatefulWidget {
  const SettlementScreen({
    super.key,
  });

  @override
  State<SettlementScreen> createState() => _SettlementScreenState();
}

class _SettlementScreenState extends State<SettlementScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initListener();
  }

  void _initListener() {
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settlement',
          style: TextStyle(
            color: Colours.txtLightColour,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: Colours.primaryColour,
      ),
      body: Center(
          child: Column(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colours.backgroundColour,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IFields(
                        controller: _searchController,
                        suffixIcon: const Icon(
                          Icons.search,
                          color: Colours.btnDisabledColour,
                        ),
                        hintText: 'Cari settlement',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.filter_list_outlined,
                      size: 40,
                      color: Colours.btnDisabledColour,
                    ),
                    onPressed: () {},
                  ),
                ],
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return TileSettlement(
                    index: index,
                    id: 'ID-VD-000$index',
                    date: DateFormat('dd MMM yyyy HH:mm:ss')
                        .format(DateTime.now()),
                    bank: 'Mandiri',
                    amount: 1000000,
                    success: (index % 2 == 0) ? true : false,
                  );
                },
              ),
            ),
          ),
        ],
      )),
    );
  }
}
