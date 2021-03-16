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
      body: ListView.builder(
        itemCount: store.baskets.length,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  FadeInImage.assetNetwork(
                      width: 100,
                      height: 100,
                      fit: BoxFit.contain,
                      placeholder: 'images/',
                      image: store.baskets[index].pic),
                  Text(
                    store.baskets[index].name,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    '₹ ' +
                        store.itemTotalPrice(store.baskets[index]).toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.remove),
                            color: Colors.red,
                            onPressed: () {
                              store.itemTotalPrice(store.baskets[index]);
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
                              store.itemTotalPrice(store.baskets[index]);
                              store.addOneItemToBasket(store.baskets[index]);
                            })
                      ],
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        height: 70,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Total Amount',
                style: TextStyle(fontSize: 20, color: Colors.white)),
            Text(
                '₹ ' +
                    (store.baskets.length > 0
                        ? store.baskets
                            .map<double>((e) => e.price * e.qty)
                            .reduce((value, element) => value + element)
                            .toStringAsFixed(2)
                        : 0),
                style: TextStyle(fontSize: 20, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
