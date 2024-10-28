import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:vendio_id/src/qrcode/presentation/bloc/qrcode_bloc.dart';

import '../../../../core/common/app/providers/qrcode_provider.dart';
import '../../../../core/common/widgets/i_fields.dart';
import '../../../../core/common/widgets/loading_button.dart';
import '../../../../core/common/widgets/rounded_button.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/utils/core_utils.dart';

class DynamicQrcode extends StatelessWidget {
  const DynamicQrcode({
    required this.nominalController,
    super.key,
  });

  final TextEditingController nominalController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QrcodeBloc, QrcodeState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.7,
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Consumer<QrcodeProvider>(
              builder: (_, qrcodeProvider, __) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nominal Transaksi',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 20,
                        children: List.generate(
                            qrcodeProvider.transactionNominal.length, (index) {
                          return RoundedButton(
                            backgroundColor:
                                (qrcodeProvider.selectedNominalIndex == index)
                                    ? Colours.primaryColour10
                                    : Colours.backgroundColour,
                            foregroundColor:
                                (qrcodeProvider.selectedNominalIndex == index)
                                    ? Colours.primaryColour
                                    : Colours.txtDarkColour,
                            horizontalPadding: 0,
                            text: "Rp${CoreUtils.formatCurrency(
                              qrcodeProvider.transactionNominal[index],
                            )}",
                            fontWeight: FontWeight.w600,
                            onPressed: () {
                              qrcodeProvider.setSelectedNominalIndex(
                                index,
                              );
                              if (qrcodeProvider.selectedNominalIndex ==
                                  index) {
                                nominalController.text =
                                    CoreUtils.formatCurrency(
                                  qrcodeProvider.transactionNominal[index],
                                );
                              } else {
                                nominalController.text = '';
                              }
                            },
                          );
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Nominal Lainnya',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    IFields(
                      controller: nominalController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.right,
                      hintText: 'Masukkan nominal',
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        color: Colours.baseColour60,
                      ),
                      fontWeight: FontWeight.w600,
                      prefixText: 'Rp',
                      onChanged: (value) {
                        nominalController.text =
                            CoreUtils.formatCurrency(value);

                        qrcodeProvider.setSelectedNominalIndex(-1);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (state is QrcodeLoading)
                      const LoadingButton()
                    else
                      IgnorePointer(
                        ignoring: nominalController.text.isEmpty,
                        child: RoundedButton(
                          onPressed: () {
                            qrcodeProvider.setNominal(
                              CoreUtils.currencyToDouble(
                                nominalController.text,
                              ),
                            );
                            context.read<QrcodeBloc>().add(
                                  CreateQrcodeEvent(
                                    nominal: CoreUtils.currencyToDouble(
                                      nominalController.text,
                                    ),
                                  ),
                                );
                          },
                          maxWidth: true,
                          text: 'Buat QR',
                          backgroundColor: nominalController.text.isEmpty
                              ? Colours.btnDisabledColour
                              : Colours.primaryColour,
                        ),
                      ),
                    const Expanded(
                      child: SizedBox(),
                    ),
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
