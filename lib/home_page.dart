import 'package:flutter/material.dart';

import 'listing.dart';
import 'data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchTextEditingController = TextEditingController();
  var listTrades;
  var ticket = '';
  var count = 25;

  @override
  void initState() {
    setState(() {
      listTrades = tradesList;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(5, 10, 10, 10),
            child: FlatButton(
              child: Text(
                count.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              onPressed: () {},
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.cyan[200],
            ),
          )
        ],
        title: Container(
          margin: new EdgeInsets.only(bottom: 4.0),
          child: TextFormField(
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),
            controller: searchTextEditingController,
            decoration: InputDecoration(
              hintText: 'By ticket...',
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              filled: true,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
                size: 25.0,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
                onPressed: () {
                  searchTextEditingController.text = '';
                  setState(
                    () {
                      ticket = searchTextEditingController.text;
                      listTrades = tradesList;
                    },
                  );
                },
              ),
            ),
            onChanged: (String tick) {
              setState(
                () {
                  ticket = tick;
                  listTrades = tradesList
                      .where((element) => element['TICKET']
                          .toLowerCase()
                          .contains(tick.toLowerCase()))
                      .toList();
                  ticket = tick;
                },
              );
            },
          ),
        ),
      ),
      body: Stack(
        children: [
          Listing(listTrades, count),
          IconButton(
              icon: Icon(
                Icons.arrow_downward_outlined,
                size: 30,
                color: Colors.cyan[900],
              ),
              onPressed: () {
                setState(() {
                  count += 25;
                  if (count > tradesList.length) count = tradesList.length;
                });
              })
        ],
        alignment: Alignment.bottomCenter,
      ),
    );
  }
}
