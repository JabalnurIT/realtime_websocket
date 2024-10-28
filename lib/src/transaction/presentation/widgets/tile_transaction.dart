import 'package:flutter/material.dart';
import 'package:vendio_id/core/utils/core_utils.dart';

import '../../../../core/res/colours.dart';

class TileTransaction extends StatelessWidget {
  const TileTransaction(
      {super.key,
      required this.index,
      required this.id,
      required this.date,
      required this.bank,
      required this.amount,
      required this.success});

  final int index;
  final String id;
  final String date;
  final String bank;
  final double amount;
  final bool success;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Card(
          elevation: 3,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colours.baseColour40,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      id,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colours.baseColour70,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colours.baseColour70,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colours.backgroundColour,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bank,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          CoreUtils.toCurrencyFormat(amount),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colours.secondaryColour,
                          ),
                        ),
                      ],
                    ),
                    Card(
                      elevation: 1,
                      color: success
                          ? Colours.secondaryColour10
                          : Colours.tertiaryColour10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          success ? 'Berhasil' : 'Gagal',
                          style: TextStyle(
                            fontSize: 14,
                            color: success
                                ? Colours.secondaryColour
                                : Colours.tertiaryColour,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
