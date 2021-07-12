class Sneakers{

  final String name;
  final int size;
  final String detail;
  final int price;
  final String image;

  Sneakers({this.name, this.size, this.detail, this.price, this.image});
}

final List<Sneakers> dataSneakers = [

  Sneakers(
    name: "Puma Casual",
    size: 41,
    detail: "Sepatu ini enak cocok dipakai pada saat santai maupun formal, karena design dari sepatu ini terlihat simple tetapi memberikan kesan elegan",
    price: 700000,
    image: "assets/images/sneakers_one.png"
  ),

  Sneakers(
      name: "Nike Walk Air",
      size: 42,
      detail: "Sepatu ini cocok untuk dibawa berlari jauh dan cepat, karena sepatu ini dibuat dengan bahan yang lembut dan nyaman",
      price: 500000,
      image: "assets/images/sneakers_two.webp"
  ),

  Sneakers(
      name: "Nike Monster",
      size: 40,
      detail: "Sepatu ini dibuat dengan tampilan yang sangat elegan dan berbeda dari yang lain, bahan yang anti slip membuat pemakain menjadi aman",
      price: 800000,
      image: "assets/images/sneakers_three.webp"
  ),
];