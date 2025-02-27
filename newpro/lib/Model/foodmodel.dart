class Categories {
 final String idCategory;
 final String strCategory;
 final String strCategoryThumb;
 final String strCategoryDescription;

  Categories(
      {required this.idCategory,
      required this.strCategory,
      required this.strCategoryThumb,
      required this.strCategoryDescription});

factory Categories.fromJson(Map<String, dynamic> json) {
  return Categories(
    idCategory : json['idCategory'],
    strCategory : json['strCategory'],
    strCategoryThumb : json['strCategoryThumb'],
    strCategoryDescription : json['strCategoryDescription'],
  );
    
  }
}
  
