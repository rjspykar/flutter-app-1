import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/user.dart';
import 'package:flutter_application_1/Provider/isar_service.dart';

class ListUsers extends StatefulWidget {
   const ListUsers({super.key});



  @override
  State<ListUsers> createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {

  var service=IsarService();
  List<User> userList=[];

  void loadUsers() async{
    final list = await service.getAllUsers() ;
    setState(() {
      userList = list;
    });
  }
   
            
     

  @override
  Widget build(BuildContext context) {

    loadUsers();
    return Scaffold(
      appBar: AppBar(title: const Text("User List")),
      body: Scrollbar(
        child: ListView.builder( 
          physics: const AlwaysScrollableScrollPhysics(), 
            itemCount: userList.length,  
            itemBuilder: (context, index) {  
              return ListTile(  
                leading: Text((index+1).toString()),
                title: Text(userList[index].name), 
                subtitle: Text('${userList[index].age}'), 
              ); 
            } 
        ),
      ),
    );
  }
}