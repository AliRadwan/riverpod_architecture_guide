import 'package:flutter/material.dart';

import 'data/mock_product_repo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(id: '1',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.id});
  final String id;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final itemlist  =  MockProductRepo.instance.getItemList();
    final productlist  =  MockProductRepo.instance.getProductList();
    final product  =  MockProductRepo.instance.getProduct(widget.id)!;
    return Scaffold(
      body: SizedBox(
        height: 300,
        child: Column(
          children: [
            ListTile(title: Text(product.title),),
            ListView.builder(
                itemCount: itemlist.length,
                itemBuilder:(context,index){
                  final item  =  itemlist[index];
              ListTile(title:Text(item.title));
            } ),
            ListView.builder(
                itemCount: productlist.length,
                itemBuilder:(context,index){
                  final product  =  itemlist[index];
              ListTile(title:Text(product.title));
            } ),
          ],
        ),
      )
    );
  }
}
