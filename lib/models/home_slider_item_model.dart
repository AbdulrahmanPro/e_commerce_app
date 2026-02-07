class HomeSliderItemModel {
  final String id;
  final String imageUrl;
  final String title;
  final String description;

  HomeSliderItemModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}

List<HomeSliderItemModel> dummySliderItems = [
  HomeSliderItemModel(
    id: '1',
    imageUrl:
        'https://images.unsplash.com/photo-1607082350899-7e105aa886ae?w=800&auto=format&fit=crop',
    title: 'Summer Sale',
    description: 'Up to 50% off on selected items',
  ),
  HomeSliderItemModel(
    id: '2',
    imageUrl:
        'https://images.unsplash.com/photo-1483985988355-763728e1935b?w=800&auto=format&fit=crop',
    title: 'New Collection',
    description: 'Discover the latest trends',
  ),
  HomeSliderItemModel(
    id: '3',
    imageUrl:
        'https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=800&auto=format&fit=crop',
    title: 'Limited Edition',
    description: 'Exclusive items for you',
  ),
  HomeSliderItemModel(
    id: '4',
    imageUrl:
        'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=800&auto=format&fit=crop',
    title: 'Flash Deals',
    description: 'Limited time offers',
  ),
  HomeSliderItemModel(
    id: '5',
    imageUrl:
        'https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=800&q=80',
    title: 'Home Essentials',
    description: 'Upgrade your living space',
  ),
  HomeSliderItemModel(
    id: '6',
    imageUrl:
        'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=800&q=80',
    title: 'Tech Gadgets',
    description: 'Latest technology at your fingertips',
  ),
];
