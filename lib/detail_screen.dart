import 'package:flutter/material.dart';
import 'package:shoes_app/model/Shoes_detail.dart';

class DetailScreen extends StatelessWidget {
  final ShoesDetail shoesDt;

  DetailScreen({required this.shoesDt});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    shoesDt.merk + "(" + shoesDt.codeShoes + ")",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    shoesDt.typeShoes,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            Image.asset(
              shoesDt.imageAsset1,
              height: 350,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        shoesDt.nameShoes,
                        style: TextStyle(
                            fontFamily: 'Oxygen',
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            shoesDt.priceShoes,
                            textAlign: TextAlign.left,
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[FavoriteButton()],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '- Description -',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    shoesDt.description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(15.0),
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: shoesDt.imageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(url),
                    ),
                  );
                }).toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  Text(
                    '- Product Details -',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    shoesDt.productDetails,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.deepOrangeAccent,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
