import 'package:fazrisubmission/features/model/sneakers_model.dart';
import 'package:fazrisubmission/features/ui/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {

  int _page = 0;
  PageController _pageController = PageController(initialPage: 0, viewportFraction: 0.8);

  final currencyFormatter = NumberFormat.currency(locale: 'id', symbol: 'Rp ',decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 60.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    Icons.menu,
                    size: 35.0,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                'Planet Sneakers',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              height: 500.0,
              width: double.infinity,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int index) {
                  _page = index;
                },
                itemCount: dataSneakers.length,
                itemBuilder: (BuildContext context, int index) {
                  return _sneakers(index, context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _sneakers(int index, BuildContext context) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 500.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetailPage(
                  dataSneakers[index].name,
                  dataSneakers[index].size,
                  dataSneakers[index].detail,
                  dataSneakers[index].price,
                  dataSneakers[index].image
              ),
            ),
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 30.0),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Hero(
                      tag: dataSneakers[index].image,
                      child: Image(
                        height: 280.0,
                        width: 280.0,
                        image: AssetImage(
                          '${dataSneakers[index].image}',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30.0,
                    right: 30.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '${currencyFormatter.format(dataSneakers[index].price)}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 30.0,
                    bottom: 40.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${dataSneakers[index].name} | ${dataSneakers[index].size}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 4.0,
              child: RawMaterialButton(
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
                elevation: 2.0,
                fillColor: Colors.orange.shade300,
                child: Icon(
                  Icons.add_circle,
                  color: Colors.black,
                  size: 30.0,
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailPage(
                          dataSneakers[index].name,
                          dataSneakers[index].size,
                          dataSneakers[index].detail,
                          dataSneakers[index].price,
                          dataSneakers[index].image
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
