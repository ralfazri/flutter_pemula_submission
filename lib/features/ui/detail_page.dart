
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';

// ignore: must_be_immutable
class DetailPage extends StatelessWidget {

  String name;
  int size;
  String detail;
  int price;
  String image;

  DetailPage(this.name, this.size, this.detail, this.price, this.image);

  final currencyFormatter = NumberFormat.currency(locale: 'id', symbol: 'Rp ',decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      left: 30.0,
                      right: 30.0,
                      top: 60.0,
                    ),
                    height: 520.0,
                    color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Icon(
                                Icons.arrow_back,
                                size: 30.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Nama Produk',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 40.0),
                        Text(
                          'Harga',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          '${currencyFormatter.format(price)}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 40.0),
                        Text(
                          'Ukuran',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          '${size.toString()}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 40.0),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 20.0,
                    bottom: 30.0,
                    child: Hero(
                      tag: image,
                      child: Image(
                        height: 280.0,
                        width: 280.0,
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 400.0,
                transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        left: 30.0,
                        right: 30.0,
                        top: 40.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Detail Produk',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            detail,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 20.0,
                        ),
                        child: OrderButton()
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class OrderButton extends StatefulWidget{
  @override
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {

  bool isOrder = false;

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30.0,
        vertical: 20.0,
      ),
      child: GestureDetector(
        onTap: (){
          setState(() {
            isOrder = !isOrder;
            Toast.show(isOrder? "Pesanan diterima":"Pesanan dibatalkan", context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP);
          });
        },
        child: Container(
          height: 50,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 100,vertical: 15),
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(50))
          ),
          child: Center(child: Text(isOrder? "Batal":"Pesan", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
        ),
      ),
    );
  }
}
