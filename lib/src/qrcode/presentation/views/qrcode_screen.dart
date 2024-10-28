import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:vendio_id/src/qrcode/presentation/views/qrcode_generated_screen.dart';
import 'package:vendio_id/src/qrcode/presentation/widgets/static_qrcode.dart';

import '../../../../core/common/app/providers/qrcode_provider.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/utils/core_utils.dart';
import '../bloc/qrcode_bloc.dart';
import '../widgets/dynamic_qrcode.dart';

class QrcodeScreen extends StatefulWidget {
  const QrcodeScreen({
    super.key,
  });

  @override
  State<QrcodeScreen> createState() => _QrcodeScreenState();
}

class _QrcodeScreenState extends State<QrcodeScreen> {
  final TextEditingController _nominalController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initListener();
  }

  @override
  void dispose() {
    _nominalController.dispose();
    super.dispose();
  }

  void _initListener() {
    _nominalController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      DynamicQrcode(
        nominalController: _nominalController,
      ),
      const StaticQrcode(),
    ];
    return BlocConsumer<QrcodeBloc, QrcodeState>(
      listener: (context, state) {
        if (state is QrcodeError) {
          CoreUtils.showSnackBar(
            context,
            state.message,
            successStatus: false,
          );
        } else if (state is QrcodeCreated) {
          Navigator.of(context).pushNamed(
            QrcodeGeneratedScreen.routeName,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'QRIS',
              style: TextStyle(
                color: Colours.txtLightColour,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            backgroundColor: Colours.primaryColour,
          ),
          body: Center(
            child: Consumer<QrcodeProvider>(
              builder: (_, qrcodeProvider, __) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                qrcodeProvider.setTabIndex(0);
                              },
                              child: Text(
                                'Dinamis',
                                style: TextStyle(
                                  color: (qrcodeProvider.tabIndex == 0)
                                      ? Colours.btnActiveColour
                                      : Colours.btnDisabledColour,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: 2,
                              color: (qrcodeProvider.tabIndex == 0)
                                  ? Colours.btnActiveColour
                                  : Colors.transparent,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                qrcodeProvider.setTabIndex(1);
                              },
                              child: Text(
                                'Statis',
                                style: TextStyle(
                                  color: (qrcodeProvider.tabIndex == 1)
                                      ? Colours.btnActiveColour
                                      : Colours.btnDisabledColour,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: 2,
                              color: (qrcodeProvider.tabIndex == 1)
                                  ? Colours.btnActiveColour
                                  : Colors.transparent,
                            ),
                          ],
                        ),
                      ],
                    ),
                    screens[qrcodeProvider.tabIndex],
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
