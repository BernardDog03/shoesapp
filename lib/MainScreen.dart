import 'package:flutter/material.dart';
import 'package:shoes_app/detail_screen.dart';
import 'package:shoes_app/model/Shoes_detail.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Search Your Shoes',
                    icon: Icon(Icons.search_sharp),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                height: 650,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: ShoesDetailList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ShoesDetail shoesDt = ShoesDetailList[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailScreen(shoesDt: shoesDt);
                        }));
                      },
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Image.asset(
                                shoesDt.imageAsset1,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              shoesDt.nameShoes,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              shoesDt.merk,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
