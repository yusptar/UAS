import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uas/pages/home_page.dart';
import 'package:uas/service/sign_in.dart';

class AddItemWaterfall extends StatefulWidget {
  AddItemWaterfall({this.email});
  final String email;
  @override
  _AddItemWaterfallState createState() => new _AddItemWaterfallState();
}

class _AddItemWaterfallState extends State<AddItemWaterfall> {
  String titlewaterfall = '';
  String locationwaterfall = '';
  String river = '';
  String height = '';

  void _addWaterfallData() {
    FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      CollectionReference _user =
          FirebaseFirestore.instance.collection('waterfall');
      await _user.add({
        "email": email,
        "titlewaterfall": titlewaterfall,
        "locationwaterfall": locationwaterfall,
        "river": river,
        "height": height,
      });
    });
    MaterialPageRoute route = MaterialPageRoute(builder: (_) => HomePage());
    Navigator.push(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://www.ourtasteforlife.com/wp-content/uploads/2019/09/TIBUMANA-WATERFALL-BALI-1.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          FlutterLogo(size: 60),
          SizedBox(
            height: 10,
          ),
          Text(
            "Create Waterfall Data",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: 310,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    onChanged: (String str) {
                      setState(() {
                        titlewaterfall = str;
                      });
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.title),
                      hintText: "Enter Title",
                    ),
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    onChanged: (String str) {
                      setState(() {
                        locationwaterfall = str;
                      });
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.location_city),
                      hintText: "Enter Location",
                    ),
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    onChanged: (String str) {
                      setState(() {
                        river = str;
                      });
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.water),
                      hintText: "Enter River",
                    ),
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    onChanged: (String str) {
                      setState(() {
                        height = str;
                      });
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.height),
                      hintText: "Enter Height of Waterfall (M)",
                    ),
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.check, size: 40.0),
                  onPressed: () {
                    _addWaterfallData();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.close, size: 40.0),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
