import 'package:flutter/material.dart';
import 'package:students_portal_provider/View/Screen/add_student.dart';
import 'package:students_portal_provider/View/widget/custom_textform.dart';

// Import your custom widgets here
// import 'path/to/your/CustomTextfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  List<String> students = ['John Doe', 'Jane Smith', 'Alice Johnson'];
  List<String> filteredStudents = [];

  @override
  void initState() {
    super.initState();
    filteredStudents = students;
  }

  void filterStudents(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredStudents = students;
      } else {
        filteredStudents = students
            .where((student) => student.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Portal"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search field using your CustomTextfield widget
            CustomTextfield(
              controller: searchController,
              prefixIcon: const Icon(Icons.search),
              labelText: "Search..",
              keyboardtype: TextInputType.text,
            ),
            const SizedBox(height: 16.0),

            // Display the student list
            Expanded(
              child: ListView.builder(
                itemCount: filteredStudents.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(filteredStudents[index]),
                      leading: CircleAvatar(
                        child: Text(filteredStudents[index][0]),
                      ),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () {
                        // Handle tap event here, e.g., navigate to details
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AddStudent()));
        },
        child:  Icon(Icons.add),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
