class Dish{

  String? name;
  int? price;
  int? quantity;
  int? totalPrice;
  String? imageURL;

  Dish({this.imageURL, this.name, this.price, this.quantity, this.totalPrice});

  // Named Constructor
  Dish.myDish();

  toMap(){
    return {
      "imageURL": imageURL,
      "name": name,
      "price": price,
      "quantity": quantity,
      "totalPrice": totalPrice,
    };
  }
}