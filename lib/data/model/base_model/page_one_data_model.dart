

class PageOneDataModel{

  static List<CategoryModel> categoryList =[
    CategoryModel("Cycle", "assets/Icon.png"),
    CategoryModel("My Health", "assets/Group 3178.png"),
    CategoryModel("Shop", "assets/Icon_basket.png"),];

  static List<CategoryModel> categoryList2 =[
    CategoryModel("Category 1", "assets/Group 3181.png"),
    CategoryModel("Category 2", "assets/Group 3181.png"),
    CategoryModel("Category 3", "assets/Group 3181.png"),
    CategoryModel("Category 4", "assets/Group 3181.png"),
    ];

  static List<String> bannerImageList =[
    "assets/banner_image.jpg",
    "assets/banner_image.jpg",
    "assets/banner_image.jpg",
    "assets/banner_image.jpg",
  ];

  static List<String> dayNameList=["Mon","Tue","Wed","Thu","Fri","Sat","Sun","Mon","Tue","Wed","Thu","Fri","Sat","Sun","Mon","Tue","Wed","Thu","Fri","Sat","Sun","Mon","Tue","Wed","Thu","Fri","Sat","Sun"];
  static List<int> dateNameList=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,];
}

class CategoryModel{
  String categoryName;
  String categoryIcon;

  CategoryModel(this.categoryName,this.categoryIcon);
}