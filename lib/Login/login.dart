
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login/add_user.dart';
import 'package:flutter_application_1/Login/welcome.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


    final double? textFieldWidth = 100;

  TextEditingController loginController = TextEditingController(text: "");
  TextEditingController passController = TextEditingController(text: "");



  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
             SizedBox(
              width: getTextwidth(),
              child: TextField(
                textAlign: TextAlign.center,
                controller: loginController,
                decoration: const InputDecoration(hintText: "Login Id",
                  fillColor: Colors.lightBlue),
              ),
            ),
             SizedBox(
              width: getTextwidth(),
              child: TextField(
                controller:passController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(hintText: "Password",
                  fillColor: Colors.lightBlue),
              ),
            ),

            TextButton(
              onPressed: (){
                // ignore: todo
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: const Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            
            ElevatedButton(
              style: ButtonStyle(padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15, horizontal: 23))),
              onPressed: (){

                var route = MaterialPageRoute(builder: (context)=> Welcome(loginid: loginController.text, password: passController.text));

                Navigator.push(context, route);

              }, 
              child: const Text("Login", style: TextStyle(fontSize: 20),),
            ),

            SizedBox(
              height: 50,
              child: OutlinedButton(onPressed: (){
                var route = MaterialPageRoute(builder: (context){
                  return const AddUser();

                });
                Navigator.push(context, route);
              }, 
              child: const Text("New User") ),
            )
            
          ],
        ),
      ),
    );
  }


  static double getTextwidth(){
    return 200;
  }
}