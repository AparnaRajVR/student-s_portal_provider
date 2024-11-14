// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:students_portal_provider/View/Screen/add_student.dart';
// // import 'package:students_portal_provider/View/Screen/edit_student.dart';

// // Placeholder data structure for demonstration purposes
// class Student {
//   final String name;
//   final String place;
//   final String imageUrl;

//   Student({required this.name, required this.place, this.imageUrl = ''});
// }

// // Dummy list to simulate data
// final List<Student> names = [
//   Student(name: "John Doe", place: "New York"),
//   Student(name: "Jane Smith", place: "Los Angeles"),
//   // Add more items as needed
// ];

// class StudentList extends StatelessWidget {
//   final TextEditingController searchController = TextEditingController();

//   StudentList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.teal,
//         onPressed: () {
          
//           Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => AddStudent()));
//         },
//         child: const Icon(Icons.add),
//       ),
//       appBar: AppBar(
//         title: const Text(
//           'Student Portal',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(50.0),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: searchController,
//               decoration: InputDecoration(
//                 hintText: 'Search',
//                 hintStyle: const TextStyle(color: Colors.grey),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                   borderSide: BorderSide.none,
//                 ),
//                 filled: true,
//                 fillColor: const Color.fromARGB(24, 0, 0, 0),
//                 prefixIcon: const Icon(
//                   Icons.search,
//                   color: Colors.grey,
//                 ),
//               ),
//               onChanged: (value) {
//                 // Trigger a UI update on text change
//                 (context as Element).markNeedsBuild();
//               },
//             ),
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//         itemCount: names.length,
//         itemExtent: 100, // Set a fixed height for each item
//         itemBuilder: (context, index) {
//           final student = names[index];
//           return Card(
//             color: Colors.teal.withOpacity(0.5),
//             child: ListTile(
//               onTap: () {
//                 // Uncomment when you have the ProfileScreen
//                 // Navigator.of(context).push(MaterialPageRoute(
//                 //   builder: (ctx) => ProfileScreen(nameEntry: student),
//                 // ));
//               },
//               leading: student.imageUrl.isNotEmpty
//                   ? CircleAvatar(
//                       radius: 30,
//                       backgroundImage: FileImage(File(student.imageUrl)),
//                     )
//                   : const CircleAvatar(
//                       radius: 30,
//                       child: Icon(Icons.person),
//                     ),
//               title: Text(
//                 student.name,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               subtitle: Text(
//                 student.place,
//                 overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(
//                   color: Color.fromARGB(255, 224, 221, 221),
//                   fontSize: 12,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               trailing: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   IconButton(
//                     onPressed: () {
//                       // Uncomment when you have the EditStudent screen
//                       // Navigator.of(context).push(MaterialPageRoute(
//                       //   builder: (ctx) => EditStudent(),
//                       // ));
//                     },
//                     icon: const Icon(Icons.edit, color: Colors.white),
//                   ),
//                   IconButton(
//                     onPressed: () {
//                       showDialog(
//                         context: context,
//                         builder: (context) {
//                           return AlertDialog(
//                             title: const Text("Delete"),
//                             content: const Text('Are you sure want to delete this?'),
//                             actions: [
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.of(context).pop();
//                                 },
//                                 child: const Text('Cancel'),
//                               ),
//                               TextButton(
//                                 onPressed: () {
//                                   // Handle deletion logic here
//                                   Navigator.of(context).pop();
//                                 },
//                                 child: const Text(
//                                   'Delete',
//                                   style: TextStyle(color: Colors.red),
//                                 ),
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     },
//                     icon: const Icon(Icons.delete, color: Colors.red),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
