import 'package:flutter/material.dart';

import '../../../../core/res/colours.dart';

class CompanyHome extends StatelessWidget {
  const CompanyHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(
            top: 20,
            left: 16,
            right: 16,
            bottom: 16,
          ),
          height: 60,
          decoration: BoxDecoration(
            color: Colours.backgroundColour.withOpacity(0.4),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: const Center(
            child: Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Icon(
                  Icons.store_outlined,
                  color: Colours.txtLightColour,
                  size: 30,
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PT. Company Name',
                      style: TextStyle(
                        color: Colours.txtLightColour,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      'Location',
                      style: TextStyle(
                        color: Colours.txtLightColour,
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
