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

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                Icons.menu,
                color: Color.fromARGB(255, 0, 0, 0),
                size: 28, // Changing Drawer Icon Size
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
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
          child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 1.1,
          child: Column(
            children: <Widget>[
              SearchBar(),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Catergories',
                            style: AppTheme.of(context).title1,
                          ),
                          Text(
                            'See all',
                            style: AppTheme.of(context).subtitle1,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 65,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FeaturedScreen())),
                              child: Card(
                                color: Colors.red.shade400,
                                child: SizedBox(
                                  width: 120,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        'Men',
                                        style: AppTheme.of(context).title2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FeaturedScreen())),
                              child: Card(
                                color: Colors.cyan.shade400,
                                child: SizedBox(
                                  width: 120,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        'Women',
                                        style: AppTheme.of(context).title2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FeaturedScreen())),
                              child: Card(
                                color: Colors.blue.shade400,
                                child: SizedBox(
                                  width: 120,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        'kids',
                                        style: AppTheme.of(context).title2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FeaturedScreen())),
                              child: Card(
                                color: Colors.green.shade400,
                                child: SizedBox(
                                  width: 120,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        'babies',
                                        style: AppTheme.of(context).title2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FeaturedScreen())),
                              child: Card(
                                color: Colors.yellow.shade400,
                                child: SizedBox(
                                  width: 120,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        'Watches',
                                        style: AppTheme.of(context).title2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Discounted',
                      style: AppTheme.of(context).title1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'See all',
                      style: AppTheme.of(context).subtitle1,
                    ),
                  ),
                ],
              ),
              Flexible(
                flex: 1,
                child: StreamBuilder(
                  stream: _itemlist.snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    }
                    if (snapshot.hasData) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot documentSnapshot =
                                snapshot.data!.docs[index];
                            return Row(children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ItemDetailsScreen(
                                                  documentSnapshot:
                                                      documentSnapshot)));
                                },
                                child: SizedBox(
                                  width: 160,
                                  height: 310,
                                  child: GFCard(
                                    elevation: 0,
                                    color: Color.fromARGB(255, 221, 221, 221),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 0),
                                    boxFit: BoxFit.fill,
                                    borderRadius: BorderRadius.circular(15.0),
                                    titlePosition: GFPosition.end,
                                    image: Image.network(
                                      documentSnapshot['image'],
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.fitHeight,
                                    ),
                                    showImage: true,
                                    content: GFListTile(
                                      margin: const EdgeInsets.all(0),
                                      padding: const EdgeInsets.all(0),
                                      titleText: documentSnapshot['title'],
                                      subTitleText:
                                          '\$' + documentSnapshot['price'],
                                    ),
                                  ),
                                ),
                              ),
                            ]);
                          });
                    }

                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Top New',
                      style: AppTheme.of(context).title1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'See all',
                      style: AppTheme.of(context).subtitle1,
                    ),
                  ),
                ],
              ),
              Flexible(
                flex: 1,
                child: StreamBuilder(
                  stream: _itemlist.snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    }
                    if (snapshot.hasData) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot documentSnapshot =
                                snapshot.data!.docs[index];
                            if (index != 0) {
                              return Row(children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ItemDetailsScreen(
                                                    documentSnapshot:
                                                        documentSnapshot)));
                                  },
                                  child: SizedBox(
                                    width: 160,
                                    height: 310,
                                    child: GFCard(
                                      elevation: 0,
                                      color: Color.fromARGB(255, 221, 221, 221),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0, vertical: 0),
                                      borderRadius: BorderRadius.circular(15.0),
                                      boxFit: BoxFit.fitHeight,
                                      titlePosition: GFPosition.end,
                                      image: Image.network(
                                        documentSnapshot['image'],
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.fitHeight,
                                      ),
                                      showImage: true,
                                      content: GFListTile(
                                        margin: const EdgeInsets.all(0),
                                        padding: const EdgeInsets.all(0),
                                        titleText: documentSnapshot['title'],
                                        subTitleText:
                                            '\$' + documentSnapshot['price'],
                                      ),
                                    ),
                                  ),
                                ),
                              ]);
                            } else {
                              return const SizedBox();
                            }
                          });
                    }

                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
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

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(20.0),
        child: PhysicalModel(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color: Colors.white,
          elevation: 5.0,
          shadowColor: Color.fromARGB(255, 95, 95, 95),
          child: CupertinoSearchTextField(
            backgroundColor: Colors.white,
            placeholder: 'Type book name or price',
          ),
        ));
  }
}
