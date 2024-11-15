import 'package:flutter/material.dart';

class MealWidget extends StatefulWidget {
  final String idCategory;
  final String  strCategory;
  final String strCategoryThumb;
  final String strCategoryDescription;

  

  const MealWidget({super.key,required this.idCategory,required this.strCategory,required this.strCategoryThumb,required this.strCategoryDescription});

  @override
  State<MealWidget> createState() => _MealWidgetState();
}

class _MealWidgetState extends State<MealWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
      color: const Color.fromARGB(255, 158, 206, 247),
       
        child: Center(
          child: Column(
            children: [
              Text(widget.idCategory),
              Image.network(widget.strCategoryThumb,height: 100,width: 120,),
               Text(widget.strCategory),
                Text(widget.strCategoryDescription),
             
            ],
          ),
        ),
      ),
    );
  }
}