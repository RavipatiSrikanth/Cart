import 'package:cart/screens/basket_page.dart';
import 'package:cart/store/my_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    MyStore store = Provider.of<MyStore>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(store.activeProduct.name),
          centerTitle: true,
          actions: [
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BasketPage()));
                },
                child: Column(
                  children: [
                    Text(store.getBasketQuantity().toString()),
                    Icon(
                      Icons.shopping_basket,
                      size: 35,
                    )
                  ],
                )),
          ],
        ),
        body: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Hero(
                tag: store.activeProduct.id,
                child: FadeInImage.assetNetwork(
                    width: 150,
                    height: 150,
                    fit: BoxFit.contain,
                    placeholder: 'images/',
                    image: store.activeProduct.pic),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(store.activeProduct.name),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('₹ ' + store.activeProduct.price.toString()),
              ),
              SizedBox(
                height: 200,
              ),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.green)),
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(Icons.remove),
                        color: Colors.red,
                        onPressed: () {
                          store.removeOneItemToBasket(store.activeProduct);
                        }),
                    Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(store.activeProduct.qty.toString()),
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.add),
                        color: Colors.green,
                        onPressed: () {
                          store.addOneItemToBasket(store.activeProduct);
                        }),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
