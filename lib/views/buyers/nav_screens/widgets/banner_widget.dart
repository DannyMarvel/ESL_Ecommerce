import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  //BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final List _bannerImage = [

    
  ];

  getBanners() {
    return _firestore
        .collection('banners')
        .get()
        .then((QuerySnapshot querySnapshot) {
//Now we loop over each doccument
      querySnapshot.docs.forEach((doc) {
        setState(() {
          _bannerImage.add(doc['image']);
        });
      });
    });
  }

  @override
  void initState() {
    //This calls the function anytime the page loads
    // TODO: implement initState
    getBanners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 140,
        //To get the width of our screen
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(
          color: Colors.yellow.shade900,
          borderRadius: BorderRadius.circular(10),
        ),
        child: PageView.builder(
          itemCount: _bannerImage.length,
          itemBuilder: (context, index) {
            return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(_bannerImage[index], fit: BoxFit.cover));
          },
        ),
    
        // PageView(
        //   //PageView gives scrollable horizontal Text or Images
        //   children: [
        //     Center(child: Text('Banner 1')),
        //     Center(child: Text('Banner 2')),
        //     Center(child: Text('Banner 3')),
        //   ],
        // ),
      ),
    );
  }
}
