import 'package:flutter/material.dart';

class CategoryText extends StatelessWidget {
  //CategoryText({super.key});

  final List<String> _categoryLabel = [
    'Agricultural Products',
    'Electrical Products',
    'Foods',
    'Solar Installation',
    'Training Courses',
    'Training Courses',
    'Training Courses',
    'Training Courses',
    'Training Courses',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories',
            style: TextStyle(fontSize: 19),
          ),
          Container(
            height: 40,
            child: Row(
              children: [
                Expanded(
                    child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categoryLabel.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ActionChip(
                        onPressed: () {},
                        backgroundColor: Colors.yellow.shade900,
                        label: Center(
                          child: Text(
                            _categoryLabel[index],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  },
                )),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
