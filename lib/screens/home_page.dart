import 'package:cart/screens/products_page.dart';
import 'package:cart/store/my_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    MyStore store = Provider.of<MyStore>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
          centerTitle: true,
        ),
        body: GridView.builder(
          itemCount: store.products.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                store.setActiveProduct(store.products[index]);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductsPage()));
              },
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    child: FadeInImage.assetNetwork(
                        fit: BoxFit.contain,
                        placeholder: 'images/',
                        image: store.products[index].pic),
                  ),
                  Text(store.products[index].name),
                ],
              ),
            );
          },
        ));
  }
}
