import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  static const route = '/add';
  const AddScreen({ Key? key }) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final companyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Add User"),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 200),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 15),
                height: 170,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name:"),
                    Text("Email:"),
                    Text("Company:")
                  ]
                ),
              ),
              Spacer(flex: 1),
              Container(
                height: 170,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 250,
                      child: TextField(
                        controller: nameController,
                        
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: TextField(
                        controller: emailController,
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: TextField(
                        controller: companyController,
                      ),
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}