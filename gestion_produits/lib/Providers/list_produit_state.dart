import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../Entity/Product.dart';

class ListProduitState extends ChangeNotifier {
  List<Product> products = [];

  TextEditingController nomProdController = TextEditingController();
  TextEditingController prixProdController = TextEditingController();

  ajouterProduit() {
    Product p =
    Product(nomProdController.text, double.parse(prixProdController.text));
    products.add(p);
    notifyListeners();
  }

  supprimerProduit(int index) {
    products.removeAt(index);
    notifyListeners();
  }
}