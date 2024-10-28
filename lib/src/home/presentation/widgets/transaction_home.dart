import 'package:flutter/material.dart';

import '../../../../core/common/widgets/rounded_button.dart';
import '../../../../core/res/colours.dart';

class TransactionHome extends StatelessWidget {
  const TransactionHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      height: 120,
      decoration: BoxDecoration(
        color: Colours.backgroundColour,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colours.btnDisabledColour.withOpacity(0.3),
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'TRANSAKSI HARI INI',
                        style: TextStyle(
                          color: Colours.txtDarkColour.withOpacity(0.5),
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Text(
                        'Rp20.000.000',
                        style: TextStyle(
                          color: Colours.txtDarkColour,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  RoundedButton(
                    onPressed: () {},
                    text: 'Lihat',
                    horizontalPadding: 24,
                    verticalPadding: 8,
                  ),
                ],
              ),
            ),
            TextButton.icon(
              onPressed: () {
                print('Lihat QR');
              },
              label: const Text(
                'Lihat QR',
                style: TextStyle(
                  color: Colours.btnActiveColour,
                  fontSize: 14,
                ),
              ),
              icon: const Icon(
                Icons.qr_code,
                color: Colours.btnActiveColour,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
