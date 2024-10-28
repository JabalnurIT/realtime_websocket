import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:vendio_id/core/extensions/context_extensions.dart';

import '../../../../core/common/app/providers/qrcode_provider.dart';
import '../../../../core/common/widgets/rounded_button.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/media_res.dart';
import '../../../../core/utils/core_utils.dart';
import '../bloc/qrcode_bloc.dart';

class QrcodeGeneratedScreen extends StatefulWidget {
  const QrcodeGeneratedScreen({super.key});

  static const routeName = '/qrcode-generated';

  @override
  State<QrcodeGeneratedScreen> createState() => _QrcodeGeneratedScreenState();
}

class _QrcodeGeneratedScreenState extends State<QrcodeGeneratedScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QrcodeBloc, QrcodeState>(
      listener: (context, state) {
        if (state is QrcodeError) {
          CoreUtils.showSnackBar(
            context,
            state.message,
            successStatus: false,
          );
        } else if (state is QrcodeExpired) {
          CoreUtils.showSnackBar(
            context,
            state.message,
            successStatus: false,
          );
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            backgroundColor: Colours.backgroundColour,
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: Center(
              child: Consumer<QrcodeProvider>(
                builder: (_, qrcodeProvider, __) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Colours.quaternaryColour10,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.info_outline_rounded,
                                color: Colours.quaternaryColour,
                                size: 30,
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: const Text(
                                  'Tunjukkan QR Code ini ke pembeli untuk discan',
                                  style: TextStyle(
                                    color: Colours.quaternaryColour,
                                    fontSize: 12,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            MediaRes.dummyQrDynamic,
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.width * 0.5,
                          ),
                          const Text(
                            'Nama Merchant',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          // nominal
                          const Text(
                            'NMID: xxxxxxxxx',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        CoreUtils.toCurrencyFormat(qrcodeProvider.nominal),
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Colours.primaryColour,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: const TextSpan(
                          text: 'Batas pembayaran anda hingga ',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colours.baseColour60,
                          ),
                          children: [
                            TextSpan(
                              text: '15:25',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colours.primaryColour,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RoundedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          context.dashboardController.changeIndex(1);
                        },
                        text: 'Cek Pembayaran',
                        maxWidth: true,
                        radius: 8,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
