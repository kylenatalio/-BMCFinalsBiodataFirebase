import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController nameController = TextEditingController();
final TextEditingController ageController = TextEditingController();
final TextEditingController addressController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController phoneController = TextEditingController();
final TextEditingController genderController = TextEditingController();
final TextEditingController civilstatusController = TextEditingController();
final TextEditingController birthdayController = TextEditingController();
final TextEditingController nationalitydayController = TextEditingController();
final TextEditingController educationController = TextEditingController();
final TextEditingController hobbiesController = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> saveData() async {
  if (nameController.text.trim().isEmpty ||
      ageController.text.trim().isEmpty ||
      addressController.text.trim().isEmpty ||
      emailController.text.trim().isEmpty ||
      phoneController.text.trim().isEmpty ||
      genderController.text.trim().isEmpty ||
      civilstatusController.text.trim().isEmpty ||
      birthdayController.text.trim().isEmpty ||
      nationalitydayController.text.trim().isEmpty ||
      educationController.text.trim().isEmpty ||
      hobbiesController.text.trim().isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please fill in all fields'),
      ),
    );
    return;
  }

  try {
    await firestore.collection('information').add({
      'name': nameController.text.trim(),
      'age': ageController.text.trim(),
      'address': addressController.text.trim(),
      'email': emailController.text.trim(),
      'phone': phoneController.text.trim(),
      'gender': genderController.text.trim(),
      'civilStatus': civilstatusController.text.trim(),
      'birthday': birthdayController.text.trim(),
      'nationality': nationalitydayController.text.trim(),
      'education': educationController.text.trim(),
      'hobbies': hobbiesController.text.trim(),
      'createdAt': FieldValue.serverTimestamp(),
    });

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data saved successfully'),
      ),
    );

    nameController.clear();
    ageController.clear();
    addressController.clear();
    emailController.clear();
    phoneController.clear();
    genderController.clear();
    civilstatusController.clear();
    birthdayController.clear();
    nationalitydayController.clear();
    educationController.clear();
    hobbiesController.clear();
  } catch (e) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error: $e'),
      ),
    );
  }
}

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    addressController.dispose();
    emailController.dispose();
    phoneController.dispose();
    genderController.dispose();
    civilstatusController.dispose();
    birthdayController.dispose();
    nationalitydayController.dispose();
    educationController.dispose();
    hobbiesController.dispose();
    super.dispose();
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Biodata'),
    ),

     body: SingleChildScrollView(padding: const EdgeInsets.all(20),
        child: Container(
  padding: const EdgeInsets.all(20),
  decoration: BoxDecoration(
    border: Border.all(
      color: Colors.blue,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(15),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
          Container(
  padding: const EdgeInsets.all(10),
  decoration: BoxDecoration(
    color: Colors.blue.shade100,
    border: Border.all(
      color: Colors.blue,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(10),
  ),
  child: const Text(
    'Personal Information',
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
  ),
),

          const SizedBox(height: 10),
      TextField(
        controller: nameController,
        decoration: const InputDecoration(
        labelText: 'Full Name',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.person),
              ),
            ),

          const SizedBox(height: 10),
      TextField(
        controller: ageController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
        labelText: 'Age',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.cake),
              ),
            ),

          const SizedBox(height: 10),
      TextField(
        controller: addressController,
        decoration: const InputDecoration(
        labelText: 'Address',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.edit),
              ),
            ),

          const SizedBox(height: 10),
                TextField(
        controller: emailController,
        decoration: const InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.email),
              ),
            ),

          const SizedBox(height: 10),
      TextField(
        controller: phoneController,
        decoration: const InputDecoration(
        labelText: 'Phone Number',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.phone),
              ),
            ),

          const SizedBox(height: 10),

        DropdownButtonFormField<String>(
        initialValue: genderController.text.isEmpty
          ? null
          : genderController.text,
          decoration: const InputDecoration(
          labelText: 'Gender',
          hintText: 'Select gender',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.wc),
        ),
          items: const [
        DropdownMenuItem(
          value: 'Male',
          child: Text('Male'),
        ),
        DropdownMenuItem(
          value: 'Female',
          child: Text('Female'),
        ),
      ],
      onChanged: (value) {
        setState(() {
          genderController.text = value ?? '';
        });
      },
    ),
    const SizedBox(height: 10),

DropdownButtonFormField<String>(
  initialValue: civilstatusController.text.isEmpty
      ? null
      : civilstatusController.text,
  decoration: const InputDecoration(
    labelText: 'Civil Status',
    hintText: 'Select civil status',
    border: OutlineInputBorder(),
    prefixIcon: Icon(Icons.favorite),
  ),
  items: const [
    DropdownMenuItem(
      value: 'Single',
      child: Text('Single'),
    ),
    DropdownMenuItem(
      value: 'Married',
      child: Text('Married'),
    ),
    DropdownMenuItem(
      value: 'Widowed',
      child: Text('Widowed'),
    ),
    DropdownMenuItem(
      value: 'Separated',
      child: Text('Separated'),
    ),
  ],
  onChanged: (value) {
    setState(() {
      civilstatusController.text = value ?? '';
    });
  },
),

const SizedBox(height: 10),

         const SizedBox(height: 10),

TextField(
  controller: birthdayController,
  readOnly: true,
  decoration: const InputDecoration(
    labelText: 'Birthday',
    border: OutlineInputBorder(),
    prefixIcon: Icon(Icons.calendar_today),
  ),
  onTap: () async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      setState(() {
        birthdayController.text =
            '${selectedDate.month}/${selectedDate.day}/${selectedDate.year}';
      });
    }
  },
),
           const SizedBox(height: 10),
      TextField(
        controller: nationalitydayController,
        decoration: const InputDecoration(
        labelText: 'Nationality',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.flag),
              ),
            ),  

          const SizedBox(height: 10),
      TextField(
        controller: educationController,
        decoration: const InputDecoration(
        labelText: 'Education',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.school),
              ),
            ),  

          const SizedBox(height: 10),
      TextField(
        controller: hobbiesController,
        decoration: const InputDecoration(
        labelText: 'Hobbies',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.sports_basketball),
              ),
            ),  


            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveData,
                child: const Text('Save to Firebase'),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    ),
  );
}
}