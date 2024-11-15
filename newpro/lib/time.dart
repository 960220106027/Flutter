import 'package:flutter/material.dart';



class Time extends StatefulWidget {
  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Time Picker Example'),
        actions: [
          IconButton(
              onPressed: () {
          
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selected Time:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$selectedTime',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: Text('Select Time'),
            ),
          ],
        ),
      ),
    );
  }
}
