import 'package:flutter/material.dart';
import 'package:gestion_produits/Entity/Product.dart';
import 'package:provider/provider.dart';

import '../Providers/list_produit_state.dart';

class Produits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Gestion des produits",
          style: TextStyle(letterSpacing: 3, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
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
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.drive_file_rename_outline,
                          color: Colors.green),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.green),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.green),
                      ),
                    ),
                    controller:
                        Provider.of<ListProduitState>(context, listen: false)
                            .nomProdController,
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
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.price_change,
                        color: Colors.green,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                    controller:
                        Provider.of<ListProduitState>(context, listen: false)
                            .prixProdController,
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
                  color: Colors.green,
                  onPressed: () {
                    Provider.of<ListProduitState>(context, listen: false)
                        .ajouterProduit();
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
          Expanded(
            child: Consumer<ListProduitState>(
              builder: (context, listeProduitsState, child) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: listeProduitsState.products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(
                              listeProduitsState.products[index].nom
                                  .substring(0, 1),
                              style: const TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.green,
                          ),
                          trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.green,
                              ),
                              onPressed: () {
                                listeProduitsState.supprimerProduit(index);
                                ;
                              }),
                          title: Text(
                              listeProduitsState.products[index].toString()),
                        ),
                      );
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}
