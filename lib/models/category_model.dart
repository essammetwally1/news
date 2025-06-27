class CategoryModel {
  final String categoryName;
  final String categoryImage;

  const CategoryModel({
    required this.categoryName,
    required this.categoryImage,
  });
}

const List<CategoryModel> categoryList = [
  CategoryModel(
    categoryName: 'Entertainment',
    categoryImage: 'assets/entertainment.jpg',
  ),
  CategoryModel(
    categoryName: 'Business',
    categoryImage: 'assets/business.jpg',
  ),
  CategoryModel(
    categoryName: 'Health',
    categoryImage: 'assets/health.jpg',
  ),
  CategoryModel(
    categoryName: 'Science',
    categoryImage: 'assets/science.jpg',
  ),
  CategoryModel(
    categoryName: 'Sports',
    categoryImage: 'assets/sports.jpg',
  ),
  CategoryModel(
    categoryName: 'Technology',
    categoryImage: 'assets/technology.jpg',
  ),
];
