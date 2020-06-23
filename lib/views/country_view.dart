import 'package:flutter/material.dart';
import 'package:news_app/helper/country.dart';
import 'package:news_app/models/country_model.dart';
import 'package:news_app/widgets/country_tile.dart';

class CountryView extends StatefulWidget {
  final String country;
  CountryView(this.country);
  @override
  _CountryViewState createState() => _CountryViewState();
}

class _CountryViewState extends State<CountryView> {
  List<CountryModel> countries = new List<CountryModel>();
    // bool _loading = true;


  // getCategoryNews() async {
  //   CountryNews newsClass = CountryNews();
  //   await newsClass.getNews(widget.country);
  //   //countries = newsClass.news;
  //   setState(() {
  //     _loading = false;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    countries = getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Flutter"),
              Text(
                "News",
                style: TextStyle(color: Colors.blue, fontSize: 20),
              ),
            ],
          ),
          ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 84),
                child: Container(
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    itemCount: countries.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CountryTile(
                        imageUrl: countries[index].imageUrl,
                        countryname: countries[index].countryName,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
