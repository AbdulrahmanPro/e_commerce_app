import 'package:e_commerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String name;
  final int productCount;
  final Color bgColor;
  final Color textColor;
  final String? imageUrl;
  CategoryModel({
    required this.id,
    required this.name,
    required this.productCount,
    this.bgColor = AppColors.primaryColor,
    this.textColor = AppColors.textColor,
    required this.imageUrl,
  });
}

List<CategoryModel> dummyCategories = [
  CategoryModel(
    id: '1',
    name: 'Electronics',
    productCount: 120,
    bgColor: AppColors.primaryColor,
    textColor: AppColors.textColor,
    imageUrl:
        'https://ix-marketing.imgix.net/case-study_exposure2.png?auto=format,compress&w=1946',
  ),
  CategoryModel(
    id: '2',
    name: 'Fashion',
    productCount: 80,
    bgColor: AppColors.secondaryColor,
    textColor: AppColors.textColor,
    imageUrl:
        'https://ix-marketing.imgix.net/case-study_culturekings2.png?auto=format,compress&w=1946',
  ),
  CategoryModel(
    id: '3',
    name: 'Home & Garden',
    productCount: 60,
    bgColor: Colors.green,
    textColor: AppColors.textColor,
    imageUrl:
        'https://images.unsplash.com/photo-1505691938895-1758d7feb511?auto=format&fit=crop&w=400&q=80',
  ),
  CategoryModel(
    id: '4',
    name: 'Sports',
    productCount: 40,
    bgColor: Colors.orange,
    textColor: AppColors.textColor,
    imageUrl:
        'https://images.unsplash.com/photo-1517649763962-0c623066013b?auto=format&fit=crop&w=400&q=80',
  ),
];
