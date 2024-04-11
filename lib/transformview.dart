import 'dart:math';

import 'package:flutter/material.dart';

class PP extends StatefulWidget {
  const PP({Key? key}) : super(key: key);

  @override
  State<PP> createState() => _PPState();
}

class _PPState extends State<PP> {
  final _controller = PageController(viewportFraction: 0.6);
  double _currentPage = 0.0;

  void _listener() {
    setState(() {
      _currentPage = _controller.page!;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_listener);
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _opty;
    List<String> imagenes = [
      'https://cdn.promo.capcomusa.com/boxart/115159.png',
      'https://cdn.promo.capcomusa.com/boxart/112137.png',
      'https://cdn.promo.capcomusa.com/boxart/158157.png',
      'https://cdn.promo.capcomusa.com/boxart/118160.png',
      'https://cdn.promo.capcomusa.com/boxart/112156.png',
      'https://cdn.promo.capcomusa.com/boxart/111151.png',
      'https://cdn.promo.capcomusa.com/boxart/111144.png',
      'https://cdn.promo.capcomusa.com/boxart/116049.png',
      'https://cdn.promo.capcomusa.com/boxart/111061.png'
    ];
    return SizedBox(
      height: 500.0,
      child: PageView.builder(
        controller: _controller,
        itemCount: imagenes.length,
        itemBuilder: (_, i) {
          if (i == _currentPage) {
            _opty = 1;
            return Transform.scale(
              scale: 1.3,
              child: _pageImages(imagenes[i], _opty),
            );
          } else if (i < _currentPage) {
            _opty = max(1 - (_currentPage - i), 0.5);
            return Transform.scale(
              scale: max(1.3 - (_currentPage - i), 0.8),
              child: _pageImages(imagenes[i], _opty),
            );
          } else {
            _opty = max(1 - (i - _currentPage), 0.5);
            return Transform.scale(
              scale: max(1.3 - (i - _currentPage), 0.8),
              child: _pageImages(imagenes[i], _opty),
            );
          }
        },
      ),
    );
  }
}

_pageImages(String images, double opty) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 85.0, horizontal: 8.0),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
          image: DecorationImage(
              image: NetworkImage(images),
              fit: BoxFit.fitHeight,
              opacity: opty)),
    ),
  );
}
