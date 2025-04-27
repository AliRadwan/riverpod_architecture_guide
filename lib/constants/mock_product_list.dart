

import 'package:riverpod_architecture_guide/data/test_products.dart';

const String baseImageUrl ='https://imageio.forbes.com/specials-images/imageserve/65df2e0562b5d061b718a4af/Skin-and-hair-care-beauty-product-mock-up--lotion-bottle--oil--cream--isolated-on/960x0.jpg?format=jpg&width=1440'; // Replace with your actual base URL

const List<Product> testProducts = [
  Product(
    id: '1',
    imageUrl: '${baseImageUrl}',
    title: 'Bruschetta plate',
    description: 'Fresh tomatoes, basil, garlic and mozzarella on toasted bread',
    price: 15.99,
  ),
  Product(
    id: '2',
    imageUrl: '${baseImageUrl}',
    title: 'Mozzarella plate',
    description: 'Fresh mozzarella with tomatoes and basil drizzled with olive oil',
    price: 13.50,
  ),
  Product(
    id: '3',
    imageUrl: '${baseImageUrl}',
    title: 'Pasta plate',
    description: 'Homemade pasta with your choice of sauce',
    price: 17.25,
  ),
  Product(
    id: '4',
    imageUrl: '${baseImageUrl}',
    title: 'Piggy Bank Blue',
    description: 'Ceramic blue piggy bank for your savings',
    price: 12.00,
  ),
  Product(
    id: '5',
    imageUrl: '${baseImageUrl}',
    title: 'Piggy Bank Green',
    description: 'Ceramic green piggy bank for your savings',
    price: 12.00,
  ),
  Product(
    id: '6',
    imageUrl: '${baseImageUrl}',
    title: 'Piggy Bank Pink',
    description: 'Ceramic pink piggy bank for your savings',
    price: 12.00,
  ),
];


const String commonImageUrl = 'https://imageio.forbes.com/specials-images/imageserve/65df2e0562b5d061b718a4af/Skin-and-hair-care-beauty-product-mock-up--lotion-bottle--oil--cream--isolated-on/960x0.jpg?format=jpg&width=1440';

const List<Item> testItems = [
  Item(
    id: 'cart1',
    title: 'Shopping Item 1',
    price: 19.99,
    imageUrl: commonImageUrl,
    quantity: 2,
    description: 'Premium quality product',
  ),
  Item(
    id: 'cart2',
    title: 'Shopping Item 2',
    price: 29.99,
    imageUrl: commonImageUrl,
    quantity: 1,
    description: 'Eco-friendly materials',
  ),
  Item(
    id: 'cart3',
    title: 'Shopping Item 3',
    price: 9.99,
    imageUrl: commonImageUrl,
    quantity: 3,
    description: 'Limited edition',
  ),
];


