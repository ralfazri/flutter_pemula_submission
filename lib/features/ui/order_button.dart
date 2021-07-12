import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class OrderButton extends StatefulWidget{
  @override
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {

  bool _isOrder = false;

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
            _isOrder = !_isOrder;
            Toast.show(_isOrder? "Pesanan diterima":"Pesanan dibatalkan", context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP);
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
          child: Center(child: Text(_isOrder? "Batal":"Pesan", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
        ),
      ),
    );
  }
}