class ProductItemModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final bool isFavorite;
  final String category;
  ProductItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
    required this.category,
  });
}

List<ProductItemModel> dummyProducts = [
  ProductItemModel(
    id: '1',
    name: 'Smartphone',
    description: 'A high-end smartphone with a sleek design.',
    price: 999.99,
    imageUrl:
        'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?auto=format&fit=crop&w=800&q=80',
    category: 'Electronics',
  ),
  ProductItemModel(
    id: '2',
    name: 'Running Shoes',
    description: 'Comfortable and stylish running shoes for all terrains.',
    price: 79.99,
    imageUrl:
        'https://images.unsplash.com/photo-1528701800489-20bfc0e8a75c?auto=format&fit=crop&w=800&q=80',
    category: 'Footwear',
  ),
  ProductItemModel(
    id: '3',
    name: 'Wireless Headphones',
    description: 'Noise-cancelling wireless headphones with long battery life.',
    price: 199.99,
    imageUrl:
        'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=800&q=80',
    category: 'Electronics',
  ),
  ProductItemModel(
    id: '4',
    name: 'Coffee Maker',
    description:
        'Brew the perfect cup of coffee with this easy-to-use coffee maker.',
    price: 49.99,
    imageUrl:
        'https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=800&q=80',
    category: 'Home Appliances',
  ),
  ProductItemModel(
    id: '5',
    name: 'Leather Wallet',
    description: 'A stylish leather wallet with multiple card slots.',
    price: 39.99,
    imageUrl:
        'https://images.unsplash.com/photo-1512499617640-c2f999fe8c9e?auto=format&fit=crop&w=800&q=80',
    category: 'Accessories',
  ),
  ProductItemModel(
    id: '6',
    name: 'Yoga Mat',
    description: 'A non-slip yoga mat for all your fitness needs.',
    price: 29.99,
    imageUrl:
        'https://images.unsplash.com/photo-1594737625785-1b9c8e0a1f3c?auto=format&fit=crop&w=800&q=80',
    category: 'Fitness',
  ),
  ProductItemModel(
    id: '7',
    name: 'Sunglasses',
    description: 'UV-protected sunglasses with a trendy design.',
    price: 59.99,
    imageUrl:
        'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80',
    category: 'Accessories',
  ),
  ProductItemModel(
    id: '8',
    name: 'Backpack',
    description:
        'A durable backpack with multiple compartments for organization.',
    price: 89.99,
    imageUrl:
        'https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?auto=format&fit=crop&w=800&q=80',
    category: 'Bags',
  ),
];
