// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:students_portal_provider/model/student_model.dart';

// class EditStudent extends StatefulWidget {
//   final StudentModel student;
//   final int index;

//   const EditStudent({
//     super.key, 
//     required this.student, 
//     required this.index
//   });

//   @override
//   State<EditStudent> createState() => _EditStudentState();
// }

// class _EditStudentState extends State<EditStudent> {
//   late TextEditingController nameController;
//   late TextEditingController placeController;
//   late TextEditingController emailController;
//   late TextEditingController phoneController;
//   String? selectedImage;
//   final formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     super.initState();
//     nameController = TextEditingController(text: widget.student.name);
//     placeController = TextEditingController(text: widget.student.place);
//     emailController = TextEditingController(text: widget.student.email);
//     phoneController = TextEditingController(text: widget.student.phone.toString());
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     placeController.dispose();
//     emailController.dispose();
//     phoneController.dispose();
//     super.dispose();
//   }

//   Future<void> pickImage(ImageSource source) async {
//     final pickedFile = await ImagePicker().pickImage(source: source);
//     if (pickedFile != null) {
//       setState(() {
//         selectedImage = pickedFile.path;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           "Edit Profile",
//           style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.symmetric(vertical: 20),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: const BorderRadius.only(
//                   bottomLeft: Radius.circular(30),
//                   bottomRight: Radius.circular(30),
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.1),
//                     spreadRadius: 1,
//                     blurRadius: 10,
//                     offset: const Offset(0, 1),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 children: [
//                   Stack(
//                     children: [
//                       CircleAvatar(
//                         radius: 60,
//                         backgroundColor: Colors.blue.shade50,
//                         child: ClipOval(
//                           child: selectedImage != null
//                               ? Image.file(
//                                   File(selectedImage!),
//                                   fit: BoxFit.cover,
//                                   width: 120,
//                                   height: 120,
//                                 )
//                               : Icon(
//                                   Icons.person,
//                                   size: 60,
//                                   color: Colors.blue.shade300,
//                                 ),
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 0,
//                         right: 0,
//                         child: GestureDetector(
//                           onTap: () => showModalBottomSheet(
//                             context: context,
//                             builder: (context) => Container(
//                               padding: const EdgeInsets.all(20),
//                               height: 180,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Text(
//                                     'Choose Profile Photo',
//                                     style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 20),
//                                   ListTile(
//                                     leading: const Icon(Icons.photo_library),
//                                     title: const Text('Choose from Gallery'),
//                                     onTap: () {
//                                       pickImage(ImageSource.gallery);
//                                       Navigator.pop(context);
//                                     },
//                                   ),
//                                   ListTile(
//                                     leading: const Icon(Icons.camera_alt),
//                                     title: const Text('Take a Photo'),
//                                     onTap: () {
//                                       pickImage(ImageSource.camera);
//                                       Navigator.pop(context);
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           child: Container(
//                             padding: const EdgeInsets.all(8),
//                             decoration: BoxDecoration(
//                               color: Colors.blue,
//                               shape: BoxShape.circle,
//                               border: Border.all(color: Colors.white, width: 2),
//                             ),
//                             child: const Icon(
//                               Icons.camera_alt,
//                               color: Colors.white,
//                               size: 20,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 15),
//                   Text(
//                     widget.student.name,
//                     style: const TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20),
//               child: Form(
//                 key: formKey,
//                 child: Column(
//                   children: [
//                     buildTextField(
//                       controller: nameController,
//                       label: 'Full Name',
//                       icon: Icons.person_outline,
//                     ),
//                     const SizedBox(height: 20),
//                     buildTextField(
//                       controller: placeController,
//                       label: 'Place',
//                       icon: Icons.location_on_outlined,
//                     ),
//                     const SizedBox(height: 20),
//                     buildTextField(
//                       controller: emailController,
//                       label: 'Email',
//                       icon: Icons.email_outlined,
//                       keyboardType: TextInputType.emailAddress,
//                     ),
//                     const SizedBox(height: 20),
//                     buildTextField(
//                       controller: phoneController,
//                       label: 'Phone Number',
//                       icon: Icons.phone_outlined,
//                       keyboardType: TextInputType.phone,
//                     ),
//                     const SizedBox(height: 40),
//                     Container(
//                       width: double.infinity,
//                       height: 55,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           // Save functionality here
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           elevation: 5,
//                           shadowColor: Colors.blue.withOpacity(0.5),
//                         ),
//                         child: const Text(
//                           'Save Changes',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildTextField({
//     required TextEditingController controller,
//     required String label,
//     required IconData icon,
//     TextInputType keyboardType = TextInputType.text,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 10,
//             offset: const Offset(0, 1),
//           ),
//         ],
//       ),
//       child: TextFormField(
//         controller: controller,
//         keyboardType: keyboardType,
//         decoration: InputDecoration(
//           labelText: label,
//           prefixIcon: Icon(icon, color: Colors.blue),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: BorderSide.none,
//           ),
//           filled: true,
//           fillColor: Colors.white,
//           contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//         ),
//       ),
//     );
//   }
// }