// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Widgets/Button.dart';
import 'package:ecommerce/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';

const List<Widget> size = <Widget>[
  Text(
    'S',
    style: TextStyle(color: Colors.black),
  ),
  Text(
    'M',
    style: TextStyle(color: Colors.black),
  ),
  Text(
    'L',
    style: TextStyle(color: Colors.black),
  ),
  Text(
    'XXL',
    style: TextStyle(color: Colors.black),
  ),
];

class ItemDetailsScreen extends StatefulWidget {
  final DocumentSnapshot documentSnapshot;
  const ItemDetailsScreen({
    Key? key,
    required this.documentSnapshot,
  }) : super(key: key);

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  final List<bool> _selectedsize = <bool>[false, true, false, false];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16, 16, 16, 16),
                        child: Hero(
                          tag: 'mainImage',
                          transitionOnUserGestures: true,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              widget.documentSnapshot['image'],
                              width: double.infinity,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.documentSnapshot['title'],
                              style: AppTheme.of(context).title1,
                              maxLines: 1,
                              overflow: TextOverflow.visible,
                            ),
                            const Icon(Icons.bookmark)
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                        child: Row(
                          children: [
                            Text(
                              '\$ ' + widget.documentSnapshot['price'] + '  ',
                              textAlign: TextAlign.start,
                              style: AppTheme.of(context).subtitle1,
                            ),
                            Text(
                              '\$ ' + widget.documentSnapshot['ogprice'],
                              textAlign: TextAlign.start,
                              style: AppTheme.of(context).subtitle2,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          const Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    RoundedButtonWidget(
                                        buttonText:
                                            widget.documentSnapshot['rating'],
                                        width: 50,
                                        onpressed: () {}),
                                    double.parse(widget
                                                .documentSnapshot['rating']) >=
                                            4
                                        ? Text('Very Good')
                                        : Text('Good'),
                                  ],
                                ),
                                Text(widget.documentSnapshot['reviews'] +
                                    ' reviews')
                              ],
                            ),
                          ),
                          const Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                            child: Divider(
                              thickness: 1,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                        child: Text(
                          'Description',
                          style: AppTheme.of(context).title2,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                        child: ReadMoreText(
                          widget.documentSnapshot['details'],
                          trimLines: 4,
                          colorClickableText: Colors.lightBlue,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Show more',
                          trimExpandedText: 'Show less',
                          style: AppTheme.of(context).bodyText2,
                        ),
                      ),
                      Column(
                        children: [
                          const Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Select Size',
                                          style: AppTheme.of(context).title3,
                                        )),
                                    TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Select Color',
                                          style: AppTheme.of(context).title3,
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                          ToggleButtons(
                            direction: Axis.horizontal,
                            onPressed: (int index) {
                              setState(() {
                                // The button that is tapped is set to true, and the others to false.
                                for (int i = 0; i < _selectedsize.length; i++) {
                                  _selectedsize[i] = i == index;
                                }
                              });
                            },
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            selectedColor: Colors.white,
                            fillColor: Color.fromARGB(255, 223, 178, 230),
                            color: Color.fromARGB(255, 240, 177, 229),
                            constraints: const BoxConstraints(
                              minHeight: 40.0,
                              minWidth: 50.0,
                            ),
                            isSelected: _selectedsize,
                            children: size,
                          ),
                        ],
                      ),
                      RoundedButtonWidget(
                          onpressed: () {}, width: 400, buttonText: 'BUY NOW'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
