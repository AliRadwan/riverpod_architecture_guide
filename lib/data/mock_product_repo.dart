import 'package:riverpod_architecture_guide/constants/mock_product_list.dart';
import 'package:riverpod_architecture_guide/data/test_products.dart';


class MockProductRepo {
  MockProductRepo._();
  static MockProductRepo instance = MockProductRepo._();

  final List<Product> _products = kTestProducts;
  final List<Item> _items = testItems;

  List<Product> getProductList(){
    return _products;
}

List<Item> getItemList(){
    return _items;
}

Product? getProduct(String id ){
    return _products.firstWhere((product)=>product.id== id);
}
Item? getItem(String id){
    return _items.firstWhere((item)=>item.id==id);
}

Future<List<Product>> featchProductList(){
    return Future.value(_products);
}

Future<List<Item>> fetchItemList(){
    return Future.value(_items);
}

Stream<List<Product>> watchProduct(){
    return Stream.value(_products);
}
Stream<List<Item>> watchItem(){
    return Stream.value(_items);
}
}