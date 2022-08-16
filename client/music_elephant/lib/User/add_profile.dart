import 'package:flutter/material.dart';

class AddProfile extends StatefulWidget {
  // final addUser;

  const AddProfile({Key? key}) : super(key: key);

  @override
  State<AddProfile> createState() => _nameState();
}

// ignore: camel_case_types
class _nameState extends State<AddProfile> {
  final profileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create Profile",
          style: TextStyle(
            fontSize: 32,
          ),
        ),
        foregroundColor: const Color(0xffffecb4),
        backgroundColor: const Color(0xffe5771e),
      ),
      body: Container(
        color: const Color(0xffffecb4),
        child: Center(
          child: ListView(
            padding: const EdgeInsets.all(32),
            children: [
              TextField(
                controller: profileController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: "Enter your name",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  primary: const Color(0xffe5771e),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                onPressed: () {
                  // widget.addUser(profileController.text);
                  Navigator.pushNamed(context, '/users');
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 32,
                      color: Color(0xffffecb4),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget buildProfile() => const TextField(
  //       controller: profileController,
  //       decoration: InputDecoration(
  //         prefixIcon: Icon(Icons.person),
  //         labelText: "Enter your name",
  //         border: OutlineInputBorder(),
  //       ),
  //       keyboardType: TextInputType.name,
  //       textInputAction: TextInputAction.done,
  //     );
}
