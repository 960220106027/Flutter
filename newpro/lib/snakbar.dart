import 'package:flutter/material.dart';

class SnakbarExercise extends StatefulWidget {
  const SnakbarExercise({super.key});

  @override
  State<SnakbarExercise> createState() => _SnakbarExerciseState();
}

class _SnakbarExerciseState extends State<SnakbarExercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
            Center(
              child: ElevatedButton(onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text("Login Successfull"),backgroundColor: Colors.green,duration: const Duration(seconds: 5) ,));
                
              }, child: Text("login")),
            ),
        ],
      ),
    );
  }
}