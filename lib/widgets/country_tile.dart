import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/home.dart';

class CountryTile extends StatelessWidget {
  @override
  final imageUrl, countryname;
  CountryTile({this.imageUrl, this.countryname});
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(countryname),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl:imageUrl,
                width: 250,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 250,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                //color: Colors.black26,
              ),
              child: Text(
                countryname.toUpperCase(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
