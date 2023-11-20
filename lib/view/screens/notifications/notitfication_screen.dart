import 'package:Kitchen_system/utill/extension_sized_box.dart';
import 'package:Kitchen_system/view/base/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../helper/configs/app_dimensions.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/styles.dart';

enum groupValue { first, second }

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: GestureDetector(
        //     onTap: () {
        //       // if (scaffoldKey.currentState!.isDrawerOpen) {
        //       //   scaffoldKey.currentState?.openEndDrawer();
        //       // } else {
        //       //   scaffoldKey.currentState?.openDrawer();
        //       // }
        //     },
        //     child: Icon(Icons.menu, color: Theme.of(context).primaryColor)),
        centerTitle: true,
        title: Text("التنبيهات",
            style: cairoRegular.copyWith(
                color: Theme.of(context).primaryColor,
                fontSize: AppDimensions.font(Dimensions.FONT_SIZE_SMALL))),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ListTile(
                        visualDensity: const VisualDensity(horizontal: -4.0),
                        horizontalTitleGap: 0,
                        minLeadingWidth: 0,
                        title: const Text('     تم مشاهدته'),
                        trailing: Radio(
                          value: groupValue.first,
                          groupValue: groupValue.first,
                          onChanged: (groupValue? value) {},
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        horizontalTitleGap: 0,
                        visualDensity: const VisualDensity(horizontal: -4.0),
                        minLeadingWidth: 0,
                        title: const Text('لم يتم مشاهدته'),
                        trailing: Radio(
                          value: groupValue.second,
                          groupValue: groupValue.first,
                          onChanged: (groupValue? value) {},
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'من تاريخ 12/10/2023',
                      style: cairoMedium.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontSize: AppDimensions.font(
                              Dimensions.FONT_SIZE_EXTRA_SMALL)),
                    ),
                    Text(
                      'الي تاريخ 12/11/2023',
                      style: cairoMedium.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontSize: AppDimensions.font(
                              Dimensions.FONT_SIZE_EXTRA_SMALL)),
                    ),
                  ],
                ),
                40.sBH,
                CustomButton(
                  buttonText: 'تحديث',
                  onPressed: () {},
                  width: 140,
                  height: 45,
                ),
              ],
            ),
          ),
          26.sBH,
          const Divider(),
        ],
      ),
    );
  }
}
