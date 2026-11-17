import 'package:flutter/material.dart';
enum Product{  
  dart(
    title: 'Dart',
    description: 'the best object language',
    image: 'assets/dart.png',
  ),
  flutter(
    title: 'Flutter',
    description: 'the best mobile widget library',
    image: 'assets/flutter.png',
  ),
  firebase(
    title: 'Firebase',
    description: 'the best cloud database',
    image: 'assets/firebase.png',
  );
  final String title;
  final String description;
  final String image;

  const Product({
    required this.title,
    required this.description,
    required this.image,
  });

}

class ProductCard extends StatelessWidget{
  final Product product;

  const ProductCard({
    super.key,
    required this.product
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          Image.asset(product.image,width: 100),
          Text(product.title, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
          Text(product.description)
        ],
      ),
    );
  }
}


void main (){
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hi"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.blue,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for(final p in Product.values)
                   ProductCard(product:p)
                ],
              ),
              
            )
          ],

        ),
      ),
    )
  );
}