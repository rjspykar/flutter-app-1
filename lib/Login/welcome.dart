
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key, required this.loginid, required this.password});
  final String loginid;
  final String password;

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Welcome"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            const Text("Welcome"),
            const SizedBox(height: 5,),
            Text(widget.loginid),
            const SizedBox(height: 5,),
            Text(widget.password),
          ],
      ),),
    ),
    );
  }
    
  
}