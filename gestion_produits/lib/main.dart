import 'package:flutter/material.dart';
import 'package:gestion_produits/Entity/Product.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController nomProdController = TextEditingController();
  TextEditingController prixProdController = TextEditingController();
  List<Product> products = [];

  ajouterProduit() {
    Product p =
        Product(nomProdController.text, double.parse(prixProdController.text));
    products.add(p);
  }

  supprimerProduit(int index) {
    products.removeAt(index);
  }

  int productsNumber = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Gestion des produits",
            style: TextStyle(letterSpacing: 3, fontWeight: FontWeight.bold),
          ),
          leading: const Padding(
            padding: EdgeInsets.fromLTRB(50,0,0,0),
            child: Icon(Icons.shopping_bag),
          ),
          centerTitle: true,
          backgroundColor: Colors.green[400],
        ),
        body: Column(
          children: [
            Row(
              children: [
                const Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(50, 20, 0, 0),
                      child: Text("Nom Produit : "),
                    )),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 50, 0),
                    child: TextField(
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                      ),
                      controller: nomProdController,
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                const Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(50, 10, 0, 0),
                      child: Text("Prix Produit : "),
                    )),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 50, 0),
                    child: TextField(
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                      ),
                      controller: prixProdController,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                    color: Colors.green[400],
                    onPressed: () {
                      setState(() {
                        ajouterProduit();
                      });
                    },
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ))
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: const Divider(height: 50, color: Colors.green),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Le nombre des produits dans la liste : " +
                    products.length.toString())
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            products[index].nom.substring(0, 1),
                            style: const TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.green[400],
                        ),
                        trailing: IconButton(
                            icon: const Icon(Icons.delete,color: Colors.green,),
                            onPressed: () {
                              setState(() {
                                supprimerProduit(index);
                              });
                            }),
                        title: Text(products[index].toString()),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}