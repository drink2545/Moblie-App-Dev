// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class widget_UI_generator extends StatelessWidget {
//   const widget_UI_generator({super.key});

//   @override
//   Widget card() {
//     return Padding(
//       padding: EdgeInsets.all(5),
//       child: GestureDetector(
//         onTap: () {
//           debugPrint('Card clik');
//         },
//         child: Container(
//           child: Column(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(5), // Image border
//                 child: SizedBox.fromSize(
//                   size: Size.fromRadius(48), // Image radius
//                   child: Image.network('https://picsum.photos/seed/244/600',
//                       fit: BoxFit.cover),
//                 ),
//               ),
//               Padding(
//                   padding: EdgeInsets.all(5),
//                   child: SizedBox(
//                     width: 100,
//                     height: 30,
//                     child: Text(
//                       'Music name',
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // music banner for top songs
//   Widget small_music_banner(int counter) {
//     return Padding(
//       padding: EdgeInsets.all(5),
//       child: GestureDetector(
//         onTap: () => debugPrint('Banner click'),
//         child: Container(
//           width: 300,
//           height: 50,
//           child: Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Image.network(
//                 'https://picsum.photos/seed/386/600',
//                 width: 55,
//                 height: 55,
//               ),
//               VerticalDivider(
//                 width: 10,
//                 thickness: 0,
//                 indent: 0,
//                 endIndent: 0,
//               ),
//               Text('$counter'),
//               VerticalDivider(),
//               SizedBox(
//                 width: 180,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Music name',
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     Text(
//                       'Artist name',
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () => debugPrint('3 dot click'),
//                 child: Icon(Icons.more_vert),
//               )
              
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // more button
//   Widget more_button() {
//     return Container(
//       width: 72,
//       height: 25,
//       child: OutlinedButton(
//         style: OutlinedButton.styleFrom(
//             primary: Color.fromARGB(255, 255, 255, 255),
//             side: BorderSide(
//               color: Color.fromARGB(62, 99, 92, 92),
//             ),
//             backgroundColor: Color.fromARGB(20, 245, 245, 245),
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(90)))),
//         onPressed: () {
//           debugPrint('more click');
//         },
//         child: Text('more'),
//       ),
//     );
//   }

//   // one line Track
//   Widget one_line_playTrack() {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Column(
//         children: [
//           Row(
//             // generate card
//             children: [
//               for (int x = 0; x < 10; x++)
//                 // card
//                 card()
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }