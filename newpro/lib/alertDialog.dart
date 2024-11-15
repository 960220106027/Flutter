import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class AlertBarExercise extends StatefulWidget {
  const AlertBarExercise({super.key});

  @override
  State<AlertBarExercise> createState() => _AlertBarExerciseState();
}

class _AlertBarExerciseState extends State<AlertBarExercise> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
               showDialog(context: context, builder: (context) {
                 return AlertDialog(content: Text("Are you sure to exit?"),
                 actions: [
                  TextButton(onPressed:() {
                    
                  }, child: Text("yes")),

                   TextButton(onPressed:() {
                    Navigator.pop(context);
                    
                  }, child: Text("No")),
                 ],
                 );
                 
               },);
                
              }, child: Text("logout",style: TextStyle(color: Colors.white),),),
            ),
            Icon(LineIcons.home),
            SizedBox(height: size.height*0.01,),
            Icon(Icons.home),
            Text("Home",),
            
        ],
      ),
    );
  }
}