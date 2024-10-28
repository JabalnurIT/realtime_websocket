import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vendio_id/core/common/widgets/i_fields.dart';

import '../../../../core/res/colours.dart';
import '../widgets/tile_transaction.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({
    super.key,
  });

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
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
          'Transaksi',
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
          // Search and Filter
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
                        hintText: 'Cari transaksi',
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
                  return TileTransaction(
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
