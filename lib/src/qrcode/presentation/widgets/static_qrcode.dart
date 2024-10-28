import 'package:flutter/material.dart';

import '../../../../core/res/media_res.dart';

class StaticQrcode extends StatelessWidget {
  const StaticQrcode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.7,
      child: Image.asset(
        MediaRes.dummyQrStatis,
        colorBlendMode: BlendMode.srcIn,
      ),
    );
  }
}
