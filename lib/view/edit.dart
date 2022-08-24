import 'package:flutter/material.dart';
import 'package:testi/viewmodel/edit_user_view_model.dart';
import '../model/user_edit.dart';

import '../model/user.dart';

class EditScreen extends StatefulWidget {
  final User currUser;
  static const route = '/edit';
  const EditScreen({ Key? key, required this.currUser }) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  
  static const editRoute = '/edit';
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final companyController = TextEditingController();

  EditUserViewModel _editUserViewModel = EditUserViewModel();

  @override
  Widget build(BuildContext context) {
    var login = widget.currUser.login;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Edit Login: $login"),
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
                child: FutureBuilder<EditUser>(
                  future: _editUserViewModel.getEditUserList(login),
                  builder: (BuildContext context, AsyncSnapshot<EditUser> snapshot) {
                    if (!snapshot.hasData){
                      return Text("Loading...");
                    }
                    if (snapshot.hasData){
                      final data = snapshot.data;

                      nameController.text = data!.name.toString();
                      emailController.text = data.email.toString();
                      companyController.text = data.company.toString();

                      return Column(
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
                      );
                      // print(snapshot);
                    }
                    else {
                      return Text("Error retrieving data");
                    }
                  },
                ),
              ),
              
            ],
          ),
        )
      ),
    );
  }
}

// class Add extends StatefulWidget {
//   const Add({ Key? key }) : super(key: key);

//   @override
//   State<Add> createState() => _AddState();
// }

// class _AddState extends State<Add> {
//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   final companyController = TextEditingController();
//   var id;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       onGenerateRoute: (settings) {
//         final args = settings.arguments as User;

//         id = args.id;

//         return MaterialPageRoute(
//           builder: (context) {
            
//           }
//         );
//       },
//       title: "oaijsoa",
//       home: Scaffold(
//         appBar: Text("testo"),
//         body: Text("$id"),
//       ),
//     );
//   }
// }