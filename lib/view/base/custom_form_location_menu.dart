// import 'package:Kitchen_system/helper/configs/app_dimensions.dart';
// import 'package:Kitchen_system/utill/color_resources.dart';
// import 'package:Kitchen_system/utill/dimensions.dart';
// import 'package:Kitchen_system/utill/extension_sized_box.dart';
// import 'package:Kitchen_system/utill/images.dart';
// import 'package:Kitchen_system/utill/strings.dart';
// import 'package:Kitchen_system/view/base/custom_button.dart';
// import 'package:Kitchen_system/view/base/custom_circle_progress_indecator.dart';
// import 'package:Kitchen_system/view/base/custom_text_field.dart';
// import 'package:Kitchen_system/view/base/drop_down_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class CustomFormLocations extends StatelessWidget {
//   const CustomFormLocations({super.key,this.removeFunction});
//
//   final Function()? removeFunction;
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: 1,
//       shadowColor: ColorResources.COLOR_GREY,
//       borderRadius: BorderRadius.circular(Dimensions.RADIUS_SIZE_DEFAULT),
//       child: Column(
//         children: [
//           Row(mainAxisAlignment: MainAxisAlignment.end, children: [
//             GestureDetector(
//               onTap:removeFunction,
//               child: Image.asset(
//                 Images.remove,
//                 height: AppDimensions.space(1.5),
//               ),
//             )
//           ]),
//           Row(
//             children: [
//               Dimensions.PADDING_SIZE_SMALL.sBW,
//               Expanded(
//                 child: CustomTextField(
//                   label: "${Strings.address.tr}1",
//                   onChanged: (value) {
//                     controller.address[index].address1 = value;
//                   },
//                 ),
//               ),
//               Dimensions.PADDING_SIZE_SMALL.sBW,
//               Expanded(
//                 child: CustomTextField(
//                   label: "${Strings.address.tr}2",
//                 ),
//               ),
//               Dimensions.PADDING_SIZE_SMALL.sBW,
//             ],
//           ),
//           Row(
//             children: [
//               Dimensions.PADDING_SIZE_SMALL.sBW,
//               Expanded(
//                 child: CustomTextField(
//                   label: Strings.zipCode.tr,
//                 ),
//               ),
//               Dimensions.PADDING_SIZE_SMALL.sBW,
//               Expanded(
//                 child: CustomTextField(
//                   label: "${Strings.address.tr}3",
//                 ),
//               ),
//               Dimensions.PADDING_SIZE_SMALL.sBW,
//             ],
//           ),
//           Row(
//             children: [
//               Obx(() => Expanded(
//                     child: DropDownWidget(
//                       label: Strings.region.tr,
//                       onchange: (value) {
//                         controller.statesSelected.value = value!;
//                         controller.getRegions(
//                             stateId: controller.statesSelected.value.id);
//                       },
//                       type: controller.statesSelected.value,
//                       list: controller.statesList,
//                     ),
//                   )),
//               Obx(() => Expanded(
//                     child: controller.loadRegion.value
//                         ? const CustomCircularProgressIndicator()
//                         : DropDownWidget(
//                             label: Strings.city.tr,
//                             onchange: (value) {
//                               controller.regionsSelected.value = value!;
//                             },
//                             type: controller.regionsSelected.value,
//                             list: controller.regionsList,
//                           ),
//                   )),
//             ],
//           ),
//           Dimensions.PADDING_SIZE_SMALL.sBH,
//           CustomButton(
//             radius: Dimensions.RADIUS_SIZE,
//             height: AppDimensions.space(2),
//             width: AppDimensions.space(Dimensions.RADIUS_SIZE_SMALL),
//             onPressed: () {
//               controller.address.add(AddressModel());
//             },
//             buttonText: Strings.add.tr,
//             icon: Icons.add,
//           ),
//           Dimensions.PADDING_SIZE_SMALL.sBH,
//         ],
//       ),
//     );
//   }
// }
