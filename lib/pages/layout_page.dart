import 'package:flutter/material.dart';
import '../widges/action.dart';

class LayoutPage extends StatelessWidget {
  LayoutPage({super.key});

  final String imageUrl =
      'https://media.istockphoto.com/id/517188688/photo/mountain-landscape.jpg?s=612x612&w=0&k=20&c=A63koPKaCyIwQWOTFBRWXj_PwCrR4cEoOw2S9Q7yVl8=';
  final String bodyText =
      'Chất lượng sản phẩm tốt 5 sao, xiến tạo 5 sao ờ ờ ờ. vinh test update review Chất lượng sản phẩm tốt 5 sao, xiến tạo 5 sao ờ ờ ờ. vinh test update review Chất lượng sản phẩm tốt 5 sao, xiến tạo 5 sao ờ ờ ờ. vinh test update review Chất lượng sản phẩm tốt 5 sao, xiến tạo 5 sao ờ ờ ờ. vinh test update review Chất lượng sản phẩm tốt 5 sao, xiến tạo 5 sao ờ ờ ờ. vinh test update review';

  final List<Map<String, Object>> actionList = [
    {
      'label': 'Call',
      'icon': Icons.call,
    },
    {
      'label': 'Route',
      'icon': Icons.route,
    },
    {
      'label': 'Share',
      'icon': Icons.share,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Layout Page')),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 240,
              width: double.infinity,
              child: FittedBox(
                child: Image(
                  image: NetworkImage(imageUrl),
                ),
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Hoa Bac Ecolodge Camping',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Da Nang, Viet Nam',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.star,
                            color: Colors.red,
                          ),
                          Text('41')
                        ],
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
                    child: ActionContainer(actionList),
                  ),
                  Text(bodyText)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
