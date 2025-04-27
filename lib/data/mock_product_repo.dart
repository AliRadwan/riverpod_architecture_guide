import 'dart:async';

import 'package:flutter/cupertino.dart';
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

Future<List<Product>> featchProductList()async{
    await Future.delayed(Duration(seconds: 2));
    return Future.value(_products);
}

Stream<Product> getProductitem(String id){
    return watchProduct().map((prods)=> prods.firstWhere((prod)=> prod.id == id) );
}
Future<List<Item>> fetchItemList()async{
  await Future.delayed(Duration(seconds: 2));
  return Future.value(_items);
}

Stream<List<Product>> watchProduct()async*{
  await Future.delayed(Duration(seconds: 4));
  yield _products;
}
Stream<List<Item>> watchItem()async*{
  await Future.delayed(Duration(seconds: 4));
  yield _items;
}
}

final productProvider = Provider<MockProductRepo>((ref) {
  return MockProductRepo();
});

final futureProductProvider = FutureProvider<List<Product>>((ref) {
  final  productListFutureProvider =  ref.watch(productProvider);
  return  productListFutureProvider.getProductList();
});

final futuerItemProvider = FutureProvider<List<Item>>((ref) {
  final itemListFutureProvider  =ref.watch(productProvider);
  return itemListFutureProvider.getItemList();
});

final streamProudctProvider = StreamProvider<List<Product>>((ref) {
  final streamProductData =  ref.watch(productProvider);
  return streamProductData.watchProduct();
});

final  streamItemProvider = StreamProvider<List<Item>>((ref) {
  final streamItemPtovider =  ref.watch(productProvider);
  return streamItemPtovider.watchItem();
});

final getProductProvider = StreamProvider.autoDispose.family<Product,String>((ref,id) {
  debugPrint('created productProvider($id)');
  ref.onResume(() => debugPrint('resume productProvider($id)'));
  ref.onCancel(() => debugPrint('cancel productProvider($id)'));
  ref.onDispose(() => debugPrint('disposed productProvider($id)'));
  final link =  ref.keepAlive();
  final timer = Timer(Duration(seconds: 10), ()=>link.close());
  ref.onDispose(()=>timer.cancel());
  final prod  = ref.watch(productProvider) ;
  return prod.getProductitem(id);
});