// import 'package:flutter/material.dart';

// class EditProfile extends StatefulWidget {
//   EditProfile({Key? key}) : super(key: key);

//   @override
//   State<EditProfile> createState() => _EditProfileState();
// }

// class _EditProfileState extends State<EditProfile> {
//   final editController = TextEditingController();
//   // ..text = selectedProfile['name'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Edit Profile",
//           style: TextStyle(
//             fontSize: 32,
//           ),
//         ),
//         foregroundColor: const Color(0xffffecb4),
//         backgroundColor: const Color(0xffe5771e),
//       ),
//       body: Container(
//         color: const Color(0xffffecb4),
//         child: Center(
//           child: ListView(
//             padding: const EdgeInsets.all(32),
//             children: [
//               TextField(
//                 controller: editController,
//                 decoration: const InputDecoration(
//                   prefixIcon: Icon(Icons.person),
//                   labelText: "Enter your name",
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.name,
//                 textInputAction: TextInputAction.done,
//               ),
//               const SizedBox(
//                 height: 24,
//               ),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   elevation: 10,
//                   primary: const Color(0xffe5771e),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(32),
//                   ),
//                 ),
//                 onPressed: () {
//                   // Navigator.pushNamed(context, '/profile');
//                 },
//                 child: const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(
//                     "Submit",
//                     style: TextStyle(
//                       fontSize: 32,
//                       color: Color(0xffffecb4),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
