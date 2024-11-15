import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != DateTime.now()) {
      // Format the date and set it in the TextField
      String formattedDate = "${picked.year}-${picked.month}-${picked.day}";
      _dateController.text = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Picker in TextField'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                hintText: 'Select a date',
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () {
                    _selectDate(context);
                  },
                ),
              ),
             // readOnly: true, // To prevent manual editing
            ),
          ],
        ),
      ),
    );
  }
}

