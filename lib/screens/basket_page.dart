import 'package:cart/store/my_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasketPage extends StatefulWidget {
  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  Widget build(BuildContext context) {
    MyStore store = Provider.of<MyStore>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Basket'),
          centerTitle: true,
          actions: [
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BasketPage()));
                },
                child: Text(store.getBasketQuantity().toString())),
          ],
        ),
        body: ListView.builder(
          itemCount: store.baskets.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Expanded(
                  flex: 2,
                  child: FadeInImage.assetNetwork(
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                      placeholder: 'images/',
                      image: store.baskets[index].pic),
                ),
                Expanded(
                  flex: 2,
                  child: Text(store.baskets[index].name),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.remove),
                            color: Colors.red,
                            onPressed: () {
                              store.removeOneItemToBasket(store.baskets[index]);
                            }),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(store.baskets[index].qty.toString()),
                          ),
                        ),
                        IconButton(
                            icon: Icon(Icons.add),
                            color: Colors.green,
                            onPressed: () {
                              store.addOneItemToBasket(store.baskets[index]);
                            })
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
