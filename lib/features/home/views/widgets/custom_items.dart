import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:khwater/core/constans/colors.dart';
import 'package:khwater/core/styls.dart';

class CustomItems extends StatelessWidget {
  const CustomItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '''يَارب نعيش شعور هذه الآية 💗 :
‏﴿فَرِحِينَ بِمَا آتَاهُمُ اللَّهُ مِنْ فَضْلِهِ﴾''',
                  style: AppStyls.styleregulard18(context),
                ),
                const SizedBox(height: 8),
                Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Text(
                      'اسلاميه',
                      style: AppStyls.styleregulard20(context),
                    ))
              ],
            ),
            const Divider(color: kPrimaryColor),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  FontAwesomeIcons.copy,
                  color: kPrimaryColor,
                ),
                const Icon(
                  FontAwesomeIcons.whatsapp,
                  color: kPrimaryColor,
                ),
                Container(),
                const Icon(
                  FontAwesomeIcons.heart,
                  color: kPrimaryColor,
                ),
                const Icon(
                  FontAwesomeIcons.share,
                  color: kPrimaryColor,
                )
              ],
            ),
            // SizedBox(
            //   height: 10,
            // )
          ],
        ),
      ),
    );
  }
}
