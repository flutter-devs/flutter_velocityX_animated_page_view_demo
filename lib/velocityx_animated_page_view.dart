import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class VelocityXAnimatedPageView extends StatefulWidget {
  @override
  _VelocityXAnimatedPageViewState createState() => _VelocityXAnimatedPageViewState();
}

class _VelocityXAnimatedPageViewState extends State<VelocityXAnimatedPageView> {
  final List<double> _imgMap = [1.0, 0.7, 1.1, 0.9, 1.2, 0.8];
  int _currentIndex = 0;

  List<String> dummyImages() {
    return [
      "https://images.unsplash.com/photo-1565065598196-aa15dde2cbca?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHx0b3BpYy1mZWVkfDMxfEo5eXJQYUhYUlFZfHxlbnwwfHx8&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1603788059192-43ee674988c0?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHx0b3BpYy1mZWVkfDE2fEo5eXJQYUhYUlFZfHxlbnwwfHx8&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1461749280684-dccba630e2f6?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHx0b3BpYy1mZWVkfDEzMXxKOXlyUGFIWFJRWXx8ZW58MHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1603785608232-44c43cdc0d70?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHx0b3BpYy1mZWVkfDY4fEo5eXJQYUhYUlFZfHxlbnwwfHx8&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1581090124360-558a029c4148?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHx0b3BpYy1mZWVkfDEwMXxKOXlyUGFIWFJRWXx8ZW58MHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1599524882167-39718267c453?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHx0b3BpYy1mZWVkfDIwMXxKOXlyUGFIWFJRWXx8ZW58MHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    ];
  }

  double calculateImg(int index) {
    return _imgMap[index];
  }

  @override
  Widget build(BuildContext context) {
    final List<String> img = dummyImages();
    if (img.isEmpty) {
      return Container();
    }

    final Widget child = VxAnimatedHeightView<PageView>(
      pageViewChild: PageView.builder(
        itemCount: img.length,
        controller: PageController(),
        itemBuilder: (context, index) {
          final String imgUrl = img.elementAt(index);
          final double width = context.screenWidth;
          final double height = width * calculateImg(index);
          return GestureDetector(
            onTap: () {
              print("press img index is $index");
            },
            child: Image.network(imgUrl ?? "",
                width: width,
                height: height,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter
            ),
          );
        },
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      itemCount: img.length,
      currentPageIndex: _currentIndex,
      computeAspectRadio: (index) {
        return calculateImg(index);
      },
      notifyScroll: (scrollNotification) {},
    );
    return child;
  }
}