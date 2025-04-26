import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture_guide/constants/mock_product_list.dart';
import 'package:riverpod_architecture_guide/data/test_products.dart';


class MockProductRepo {
  // MockProductRepo._();
  // static MockProductRepo _instance = MockProductRepo._();

  final List<Product> _products = testProducts;
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

final productProvider = Provider<MockProductRepo>((ref) {
  return MockProductRepo();
});

// final futureProductProvider = FutureProvider<List<Product>>((ref) async {
//   final  productListFutureProvider =  ref.watch(productProvider);
//   return  productListFutureProvider.getProductList();
// });
//
// final futuerItemProvider = FutureProvider<List<Item>>((ref) async {
//   final itemListFutureProvider  =ref.watch(productProvider);
//   return itemListFutureProvider.getItemList();
// });
//
// final streamProudctProvider = StreamProvider<List<Product>>((ref) {
//   final streamProductData =  ref.watch(productProvider);
//   return streamProductData.watchProduct();
// });
//
// final  StreamItemProvider = StreamProvider<List<Item>>((ref) {
//   final streamItemPtovider =  ref.watch(productProvider);
//   return streamItemPtovider.watchItem();
// });