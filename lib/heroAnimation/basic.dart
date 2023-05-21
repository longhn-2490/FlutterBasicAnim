
import 'package:flutter/material.dart';

class BasicHero extends StatelessWidget {
  const BasicHero({Key? key}) : super(key: key);

  Widget _blueRectangle(Size size) {
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.blue,
    );
  }

  void _gotoDetailsPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('second Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                transitionOnUserGestures: true,
                flightShuttleBuilder: (flightContext, animation, direction,
                    fromContext, toContext) {
                  if(direction == HeroFlightDirection.push) {
                    return Icon(
                      Icons.opacity,
                      size: 150.0,
                    );
                  } else if (direction == HeroFlightDirection.pop){
                    return Icon(
                      Icons.opacity,
                      size: 70.0,
                    );
                  }
                  return Icon(
                    Icons.opacity,
                    size: 70.0,
                  );
                },
                tag: 'hero-rectangle',
                child: _blueRectangle(const Size(200, 200)),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 20.0,
          ),
          ListTile(
            leading: Hero(
              flightShuttleBuilder: (flightContext, animation, direction,
                  fromContext, toContext) {
                if(direction == HeroFlightDirection.push) {
                  return Icon(
                    Icons.opacity,
                    size: 150.0,
                  );
                } else if (direction == HeroFlightDirection.pop){
                  return Icon(
                    Icons.opacity,
                    size: 70.0,
                  );
                }
                return Icon(
                  Icons.opacity,
                  size: 70.0,
                );
              },
              transitionOnUserGestures: true,
              tag: 'hero-rectangle',
              child: _blueRectangle(const Size(50, 50)),
            ),
            onTap: () => _gotoDetailsPage(context),
            title: const Text('Tap on the icon to view hero animation transition.'),
          ),
        ],
      ),
    );
  }
}
