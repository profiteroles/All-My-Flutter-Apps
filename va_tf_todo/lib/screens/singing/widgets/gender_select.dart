// Padding(
//             padding: const EdgeInsets.only(top: 10, left: 10),
//             child: Row(
//               children: [
//                 GestureDetector(
//                   onTap: () => controller.isMale(true),
//                   child: Row(
//                     children: [
//                       Container(
//                         width: 30,
//                         height: 30,
//                         margin: const EdgeInsets.only(right: 8),
//                         // decoration: BoxDecoration(color: controller.isMale() ? textColor2 : Colors.transparent, border: Border.all(width: 1, color: controller.isMale() ? Colors.transparent : textColor1), borderRadius: BorderRadius.circular(15)),
//                         child: const Icon(
//                           Icons.account_box_outlined,
//                           // MaterialCommunityIcons.account_outline,
//                           // color: controller.isMale() ? Colors.white : iconColor,
//                         ),
//                       ),
//                       const Text(
//                         "Male",
//                         // style: const TextStyle(color: textColor1),
//                       )
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 30),
//                 GestureDetector(
//                   onTap: () => controller.isMale(false),
//                   child: Row(
//                     children: [
//                       Container(
//                         width: 40,
//                         height: 7.0.wp,
//                         margin: EdgeInsets.only(right: 2.0.wp),
//                         // decoration: BoxDecoration(color: controller.isMale() ? Colors.transparent : textColor2, border: Border.all(width: 1, color: controller.isMale() ? textColor1 : Colors.transparent), borderRadius: BorderRadius.circular(15)),
//                         child: const Icon(
//                           Icons.account_box_outlined,
//                           // MaterialCommunityIcons.account_outline,
//                           // color: controller.isMale() ? iconColor : Colors.white,
//                         ),
//                       ),
//                       const Text(
//                         "Female",
//                         // style: TextStyle(color: textColor1),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),