class Product{
  String nom;
  double prix;

  Product(this.nom,  this.prix);

  @override
  String toString() {
    // TODO: implement toString
    return "Name : $nom | Price : $prix";
  }

}