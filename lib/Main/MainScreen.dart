import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:numericalanalysis/Form/FormScreen.dart';

class MainScreen extends StatelessWidget {
  static const String routeName = 'main Screen';
  List<String> methods = ['Bisection.png' , 'FalsePosition.png' , 'SampleFixedPoint.png' , 'Newton.png' , 'Secant.png'];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg' ,),
          fit: BoxFit.cover
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              items: methods.map((method) => InkWell(
                onTap: () {
                  Navigator.pushNamed(context, FormScreen.routeName , arguments: method.substring(0,method.length-4));
                },
                child: Center(child: Image.asset('assets/images/$method' , height: double.infinity,),))).toList(),
              options: CarouselOptions(
                height: 550,
                viewportFraction: 0.4,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                enlargeCenterPage: true,
                enlargeFactor: 0.4,
                scrollDirection: Axis.horizontal,
              ),
            )
          ],
        ),
      ),
    );
  }
}
