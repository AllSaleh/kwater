import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:khwater/core/constans/colors.dart';
import 'package:khwater/core/functions/custom_snack_bar.dart';
import 'package:khwater/core/styls.dart';
import 'package:khwater/features/home/data/model/custom_messges_model.dart';
import 'package:khwater/features/home/views/widgets/custom_item_icon.dart';
import 'package:share_plus/share_plus.dart';

class CustomItems extends StatelessWidget {
  final CustomMessgesModel  messages;
  const CustomItems({
    super.key,
    required this.messages,
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
                  messages.message!,
                  style: AppStyls.styleregulard18(context),
                ),
                const SizedBox(height: 8),
                Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Text(
                      messages.categorie??'',
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
                CustomItemIcon(
                    icon: FontAwesomeIcons.copy,
                    onTap: () {
                      Clipboard.setData(
                          ClipboardData(text: messages.message!));
                      ScaffoldMessenger.of(context).showSnackBar(
                          customSnackBar(context, title: 'copied'.tr()));
                    }),
                CustomItemIcon(
                    icon: Icons.share,
                    onTap: () async {
                      await Share.share(messages.message!);
                    }),
                CustomItemIcon(icon: FontAwesomeIcons.heart, onTap: () {}),
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
