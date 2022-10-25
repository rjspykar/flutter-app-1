
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Login/show_all_users.dart';
import 'package:flutter_application_1/Models/user.dart';
import 'package:flutter_application_1/Provider/isar_service.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {

  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add User"),),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            
            decoration: const InputDecoration(hintText: "Name"),
            controller: name,
          ),
          TextField(
            
            decoration: const InputDecoration(hintText: "Age", ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly
],
            controller: age,
          ),
          ElevatedButton(
            onPressed: (){
              User user = User(name.text, int.parse(age.text));
              user.toString();
              IsarService service = IsarService();
              service.saveUser(user);
            }, 
            child: const Text("Save"),
            ),


          ElevatedButton(onPressed: (){
            var route = MaterialPageRoute(builder: ((context) {
              return const ListUsers();
            }));
            Navigator.push(context, route);
          }, child: const Text("Show all Users"))
        ],),
      ),
    );
  }
}