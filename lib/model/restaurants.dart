class Restaurant{

  String? imageURL;
  String? name;
  String? categories; // csv
  int? pricePerPerson;
  double? ratings;


  Restaurant({this.imageURL, this.name, this.categories, this.pricePerPerson,
      this.ratings});

  toMap() => {
    "imageUrl": imageURL,
    "name": name,
    "categories": categories,
    "pricePerPerson": pricePerPerson,
    "ratings": ratings,
  };

  @override
  String toString() {
    return 'Restaurant{imageURL: $imageURL, name: $name, categories: $categories, pricePerPerson: $pricePerPerson, ratings: $ratings}';
  }
}