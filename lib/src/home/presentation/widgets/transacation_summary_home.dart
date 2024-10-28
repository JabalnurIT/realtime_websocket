import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vendio_id/src/transaction/presentation/widgets/tile_transaction.dart';

import '../../../../core/res/colours.dart';

class TransactionSummaryHome extends StatelessWidget {
  const TransactionSummaryHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Transaksi Terbaru',
            style: TextStyle(
              color: Colours.txtDarkColour,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.434,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return TileTransaction(
                  index: index,
                  id: 'ID-VD-000$index',
                  date:
                      DateFormat('dd MMM yyyy HH:mm:ss').format(DateTime.now()),
                  bank: 'Mandiri',
                  amount: 1000000,
                  success: (index % 2 == 0) ? true : false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
