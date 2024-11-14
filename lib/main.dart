import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:students_portal_provider/View/Screen/home_screen.dart';

import 'View/Screen/student_profile.dart';

// import 'package:hive_flutter/hive_flutter.dart'; // Import hive_flutter package
// import 'package:provider/provider.dart';
// import 'package:student_management_provider/controller/student_provider.dart';
// import 'package:student_management_provider/model/student_model.dart';
// import 'package:student_management_provider/screens/student_list.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized(); // Ensure widgets are initialized before Hive
  // await Hive.initFlutter(); // Use Hive.initFlutter() from hive_flutter
  // Hive.registerAdapter(StudentAdapter());
  // await Hive.openBox<Student>('Student');
  
  await Hive.initFlutter();
  Hive.registerAdapter(StudentAdapter()); 
  await Hive.openBox<Student>('studentsBox');
  
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    // ChangeNotifierProvider(
      // create: (context) => StudentProvider(),
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          primaryColor: Colors.teal,
          // scaffoldBackgroundColor: Colors.blue[50],
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
          ),
          buttonTheme: const ButtonThemeData(
            buttonColor: Colors.teal,
            textTheme: ButtonTextTheme.primary,
          ),
        ),
        home:HomeScreen(),
      );
    // );
  }
}
