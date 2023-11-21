import 'package:Kitchen_system/utill/extension_sized_box.dart';
import 'package:Kitchen_system/view/base/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../helper/configs/app_dimensions.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/styles.dart';

enum GroupValue { first, second }

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
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                          value: GroupValue.first,
                          groupValue: GroupValue.first,
                          onChanged: (GroupValue? value) {},
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
                          value: GroupValue.second,
                          groupValue: GroupValue.first,
                          onChanged: (GroupValue? value) {},
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
                  width: 130,
                  height: 40,
                ),
              ],
            ),
          ),
          26.sBH,
          const Divider(),
          Expanded(
              child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: 2,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // CustomImage(
                      //     height: 120,
                      //     width: 120,
                      //     image:
                      //         "${AppConstants.baseurlImages}${controller.attachmentsFilter[index].attachmentPath}"),
                       Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Text("المنشئ: يارا شادي", style: cairoRegular.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontSize: AppDimensions.font(
                                    Dimensions.FONT_SIZE_EXTRA_SMALL)),),
                            const Spacer(),
                            Text("التاريخ: 17/7/2023", style: cairoRegular.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontSize: AppDimensions.font(
                                    Dimensions.FONT_SIZE_EXTRA_SMALL)),),
                          ],
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text("التنبية: تم اضافه صوره جديده للزبون", style: cairoRegular.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: AppDimensions.font(
                                Dimensions.FONT_SIZE_EXTRA_SMALL)),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: CustomButton(
                          buttonText: "تجاهل",
                          icon: 'assets/image/delete.png',
                          width: 80,
                          height: 30,
                          onPressed: () {},
                          // onPressed: () {
                          //   DialogUtils
                          //       .showCustomDialog(
                          //       context,
                          //       label:
                          //       "هل تريد الحذف ؟",
                          //       onTap: () {
                          //         controller.deleteNote(
                          //             context,
                          //             noteId: controller
                          //                 .notesData[
                          //             index]
                          //                 .id!,
                          //             clientFieldId:
                          //             clientFileId);
                          //       });
                          // },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
