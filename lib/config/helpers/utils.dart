import 'package:truequealo/config/helpers/constants.dart';
import 'package:truequealo/domain/entities/category.dart';

Category getCategoryData(String categoryId) {
  return categories.firstWhere((category) => category.id == categoryId);
}
