import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Navigation',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProductListScreen(),
    );
  }
}

class Product {
  final String name;
  final String description;
  final int price;
  final Color color;

  Product({required this.name, required this.description, required this.price, required this.color});
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'Pixel 1', description: 'Pixel is the most featureful phone ever', price: 800, color: Colors.blue),
    Product(name: 'Laptop', description: 'Laptop is most productive development tool', price: 2000, color: Colors.green),
    Product(name: 'Tablet', description: 'Tablet is the most useful device ever for meeting', price: 1500, color: Colors.orange),
    Product(name: 'Pen Drive', description: 'iPhone is the stylist phone ever', price: 100, color: Colors.red),
    Product(name: 'Floppy Drive', description: 'Floppy   is the stylist phone ever', price: 100, color: Colors.teal),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Navigation')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product: products[index]),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(50),
                      color: products[index].color,
                      child: Center(
                        child: Text(
                          products[index].name,
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            products[index].description,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Price: \$${products[index].price}',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: List.generate(3, (index) => Icon(Icons.star, color: Colors.red, size: 20)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                product.name,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: product.color),
              ),
              SizedBox(height: 20),
              Text(
                product.description,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Price: \$${product.price}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) => Icon(Icons.star, color: Colors.red, size: 28)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

