import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryCard(
            itemName: "Nguồn cung",
            itemIcon: Icon(Icons.store),
            link: 'https://www.nongsanantoanthanhhoa.vn/shop',
          ),
          CategoryCard(
            itemName: "Kết nối cung cầu",
            itemIcon: Icon(Icons.connect_without_contact),
            link: '',
          ),
          CategoryCard(
            itemName: "Thông tin hữu ích",
            itemIcon: Icon(Icons.info),
            link: '',
          ),
          CategoryCard(
            itemName: "Liên hệ",
            itemIcon: Icon(Icons.phone),
            link: '',
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String link;
  final String itemName;
  final Widget itemIcon;
  const CategoryCard({
    Key? key,
    required this.itemName,
    required this.itemIcon,
    required this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await launch(link);
      },
      child: SizedBox(
        width: 55,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: Colors.green[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: itemIcon,
            ),
            SizedBox(height: 5),
            Text(itemName, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
