import 'package:flutter/material.dart';

import 'package:newpro/Widget/MealsWidget.dart';
import 'package:newpro/api/foodapi.dart';

import 'package:provider/provider.dart';

class MealsScreen extends StatefulWidget {
     static const routeName = 'categories';
  const MealsScreen({super.key});

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
   @override
  void initState() {
    Provider.of<MealProvider>(context, listen: false)
        .getAllMealsData(context: context);
  
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     final farmer = Provider.of<MealProvider>(context);
     final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 238, 247),
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text('Products',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
      ),
      body:
       
    farmer.loadingSpinner
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('loading'),
                          CircularProgressIndicator(
                            color: Colors.green,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                       
                        ],
                      )
                    : farmer.products.isEmpty
                        ? Text('No products...')
                        : SizedBox(
                          height: size.height * 0.9,
                            child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 2,crossAxisSpacing: 2,childAspectRatio: 0.2),
                              scrollDirection: Axis.vertical,
                              itemCount: farmer.products.length,
                              itemBuilder: (context, intex) {
                                return MealWidget(
                                  idCategory: farmer.products[intex].idCategory,
                                  strCategory:farmer.products[intex].strCategory,
                                  strCategoryThumb:farmer.products[intex].strCategoryThumb,
                                 strCategoryDescription:farmer.products[intex].strCategoryDescription,

                                  
        
                             
                             
                                 
                                
                                );
                              },
                            ),
                          ),
          
    );
  }
}