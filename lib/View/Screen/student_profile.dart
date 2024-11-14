import 'dart:io';
import 'package:flutter/material.dart';

class Student {
  final String name;
  final String place;
  final String phoneNumber;
  final int age;
  final String imageUrl;

  Student({
    required this.name,
    required this.place,
    required this.phoneNumber,
    required this.age,
    required this.imageUrl,
  });
}

class ProfileScreen extends StatelessWidget {
  final Student nameEntry;
  const ProfileScreen({super.key, required this.nameEntry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "${nameEntry.name}'s Profile",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  if (nameEntry.imageUrl.isNotEmpty)
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.blue.shade50,
                        child: ClipOval(
                          child: Image.file(
                            File(nameEntry.imageUrl),
                            fit: BoxFit.cover,
                            width: 150,
                            height: 150,
                          ),
                        ),
                      ),
                    )
                  else
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.blue.shade50,
                      child: Icon(
                        Icons.person,
                        size: 70,
                        color: Colors.blue.shade200,
                      ),
                    ),
                  const SizedBox(height: 20),
                  Text(
                    nameEntry.name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CustomInfoCard(
                    icon: Icons.place,
                    label: 'Place',
                    value: nameEntry.place,
                  ),
                  const SizedBox(height: 15),
                  CustomInfoCard(
                    icon: Icons.calendar_today,
                    label: 'Age',
                    value: nameEntry.age.toString(),
                  ),
                  const SizedBox(height: 15),
                  CustomInfoCard(
                    icon: Icons.phone,
                    label: 'Phone',
                    value: nameEntry.phoneNumber,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomInfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const CustomInfoCard({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: Colors.blue,
              size: 24,
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}