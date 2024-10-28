import 'package:flutter/material.dart';

import '../../../../core/res/colours.dart';
import '../../../../core/res/media_res.dart';
import '../widgets/company_home.dart';
import '../widgets/transacation_summary_home.dart';
import '../widgets/transaction_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          MediaRes.appIconName,
          width: 100,
          height: 100,
          colorBlendMode: BlendMode.srcIn,
          color: Colours.txtLightColour,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: const Icon(Icons.headset_mic_outlined),
              onPressed: () {},
              color: Colours.txtLightColour,
              iconSize: 30,
            ),
          ),
        ],
        backgroundColor: Colours.primaryColour,
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: const BoxDecoration(
                color: Colours.primaryColour,
              ),
            ),
            Column(
              children: [
                const CompanyHome(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const TransactionHome(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const TransactionSummaryHome(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
