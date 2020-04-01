class XProduct {
  String id;
  String price;
  String name;
  String img;

  XProduct({this.id, this.price, this.name, this.img});

  XProduct.fromMap(Map snapshot, String id):
    id = id ?? '',
    price = snapshot['price'] ?? '',
    name = snapshot['name'] ?? '',
    img = snapshot['img'] ?? '';

    toJson(){
      return {
        "price": price,
        "name" : name,
        "img" : img,
      };
    }
        
}






