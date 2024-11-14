
import 'dart:io'; 
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

import '../widget/custom_textform.dart';
import 'student_profile.dart';

class AddStudent extends StatelessWidget {
  AddStudent({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  File? _image;


void saveStudent(String name, String place, String email, String phone) async {
  final studentBox = Hive.box<Student>('studentsBox');
  final newStudent = Student(name: name, place: place, email: email, phone: phone);
  await studentBox.add(newStudent); 


  Future<void> _pickImage(ImageSource source, void Function(File) onImagePicked) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      onImagePicked(File(pickedFile.path));
    }
  }

  void _showImagePickerOptions(BuildContext context, void Function(File) onImagePicked) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choose Image Source'),
        actions: [
          TextButton(
            onPressed: () {
              _pickImage(ImageSource.gallery, onImagePicked);
              Navigator.pop(context);
            },
            child: const Text('Gallery'),
          ),
          TextButton(
            onPressed: () {
              _pickImage(ImageSource.camera, onImagePicked);
              Navigator.pop(context);
            },
            child: const Text('Camera'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile picture with camera icon
              ValueListenableBuilder<File?>(
                valueListenable: ValueNotifier<File?>(_image),
                builder: (context, image, child) {
                  return Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: image != null
                            ? FileImage(image)
                            : const AssetImage('assets/default_profile.png')
                                as ImageProvider,
                      ),
                      InkWell(
                        onTap: () => _showImagePickerOptions(context, (file) {
                          _image = file;
                        }),
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.teal,
                          child: Icon(Icons.camera_alt, color: Colors.white),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),

              // Form fields using CustomTextfield
              CustomTextfield(
                controller: nameController,
                prefixIcon: const Icon(Icons.person),
                labelText: 'Name',
                keyboardtype: TextInputType.text,
              ),
              const SizedBox(height: 16),

              CustomTextfield(
                controller: placeController,
                prefixIcon: const Icon(Icons.location_on),
                labelText: 'Place',
                keyboardtype: TextInputType.text,
              ),
              const SizedBox(height: 16),

              CustomTextfield(
                controller: emailController,
                prefixIcon: const Icon(Icons.email),
                labelText: 'Email',
                keyboardtype: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              CustomTextfield(
                controller: phoneController,
                prefixIcon: const Icon(Icons.phone),
                labelText: 'Phone',
                keyboardtype: TextInputType.phone,
              ),
              const SizedBox(height: 24),

              // Save and Cancel buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
  onPressed: () {
    saveStudent(
      nameController.text,
      placeController.text,
      emailController.text,
      phoneController.text,
    );
    Navigator.pop(context); 
  },
  child: const Text('Save'),
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.teal,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  ),
),

                  OutlinedButton(
                    onPressed: () {
                    
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}}