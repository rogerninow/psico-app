import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Carousel extends StatelessWidget {

  Carousel(this.items);

  final List<Widget> items;

  @override
  Widget build(context) {
    int currentIndex = 1;
    final CarouselController controller = CarouselController();

    return
      SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .08,
              child: TextButton(
                onPressed: () => {
                  if (currentIndex > 0) {
                    currentIndex--,
                    controller.animateToItem(
                        currentIndex,
                        curve: Curves.easeIn,
                        duration: Duration(milliseconds: 500)
                    )
                  }
                },
                child: FaIcon(FontAwesomeIcons.chevronLeft)
              )
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .75,
              child: Scaffold(
                body: CarouselView(
                controller: controller,
                scrollDirection: Axis.horizontal,
                itemExtent: double.infinity,
                children: List.generate(items.length, (int index) {
                  return Padding(
                    padding: EdgeInsetsGeometry.all(10),
                    child: items[index],
                  );
                }),
              )),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .08,
              child: TextButton(
                onPressed: () => {
                if (currentIndex < items.length) {
                  currentIndex++,
                  controller.animateToItem(
                    currentIndex,
                    curve: Curves.easeIn,
                    duration: Duration(milliseconds: 500)
                  )
                }
                },
                child: FaIcon(FontAwesomeIcons.chevronRight)
              )
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .18
      );
  }

}

