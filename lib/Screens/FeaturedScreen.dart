// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Screens/FeaturedScreen.dart';
import 'package:ecommerce/Screens/ItemDetailsScreen.dart';
import 'package:ecommerce/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:ecommerce/Screens/Login/LoginScreen.dart';
import 'package:getwidget/getwidget.dart';

class FeaturedScreen extends StatefulWidget {
  const FeaturedScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FeaturedScreen> createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  final CollectionReference _itemlist =
      FirebaseFirestore.instance.collection('items');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 221, 221, 221),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 221, 221, 221),
              ),
              child: Text('Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color.fromARGB(255, 0, 0, 0),
                size: 28, // Changing Drawer Icon Size
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 221, 221, 221),
        actions: [
          IconButton(
            color: Colors.black,
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // handle the press
            },
          ),
          IconButton(
            color: Colors.black,
            icon: const Icon(Icons.push_pin_outlined),
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      body: SafeArea(
          child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 2,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Featured',
                    style: AppTheme.of(context).title1,
                  ),
                ),
              ],
            ),
            Flexible(
              child: StreamBuilder(
                stream: _itemlist.snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  }
                  if (snapshot.hasData) {
                    return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 190,
                                crossAxisSpacing: 20,
                                childAspectRatio: 2.5 / 4,
                                mainAxisSpacing: 0),
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot documentSnapshot =
                              snapshot.data!.docs[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ItemDetailsScreen(
                                          documentSnapshot: documentSnapshot)));
                            },
                            child: GFCard(
                              elevation: 0,
                              color: Color.fromARGB(255, 221, 221, 221),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              borderRadius: BorderRadius.circular(15.0),
                              titlePosition: GFPosition.end,
                              image: Image.network(
                                documentSnapshot['image'],
                                fit: BoxFit.fitWidth,
                              ),
                              showImage: true,
                              content: GFListTile(
                                margin: const EdgeInsets.all(0),
                                padding: const EdgeInsets.all(0),
                                titleText: documentSnapshot['title'],
                                subTitleText: '\$' + documentSnapshot['price'],
                              ),
                            ),
                          );
                        });
                  }

                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}

// onPressed: () {
//               FirebaseAuth.instance.signOut().then((value) => Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: ((context) => LoginScreen()))));
//             },


