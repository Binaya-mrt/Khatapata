import 'package:flutter/material.dart';
import 'package:onboard/model/transcation.dart';
import 'package:onboard/database/db.dart';

class Transcations extends StatefulWidget {
  const Transcations({Key? key}) : super(key: key);

  @override
  _TranscationsState createState() => _TranscationsState();
}

class _TranscationsState extends State<Transcations> {
  get selectedId => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.green.withOpacity(0.3),
              child: FutureBuilder<List<Transcation>>(
                  future: nafadb.instance.getGroceries(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Transcation>> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                          child: Text(
                        'Loading...',
                        style: TextStyle(fontSize: 25),
                      ));
                    }
                    return snapshot.data!.isEmpty
                        ? Center(
                            child: Text(
                            'No Nafa in List.',
                            style: TextStyle(fontSize: 25),
                          ))
                        : ListView(
                            children: snapshot.data!.map((nafa) {
                              return Card(
                                elevation: 2,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            nafa.invoice,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Text(
                                            nafa.title,
                                            style: TextStyle(fontSize: 30),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  nafadb.instance
                                                      .remove(nafa.id!);
                                                });
                                              },
                                              icon: Icon(Icons
                                                  .delete_forever_outlined)),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Rate: ${nafa.rate}',
                                            style: TextStyle(fontSize: 25),
                                          ),
                                          Text(
                                            'Total: ${nafa.total}',
                                            style: TextStyle(fontSize: 25),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                  }),
            ),
          ),
          ////** Kharcha Display Starts */
          Expanded(
            child: Container(
              color: Colors.red.withOpacity(0.1),
              child: Center(
                child: FutureBuilder<List<Transcation>>(
                    future: nafadb.instance.getKharcha(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Transcation>> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                            child: Text(
                          'Loading...',
                          style: TextStyle(fontSize: 25),
                        ));
                      }
                      return snapshot.data!.isEmpty
                          ? Center(
                              child: Text(
                              'No Kharcha in List.',
                              style: TextStyle(fontSize: 25),
                            ))
                          : ListView(
                              children: snapshot.data!.map((kharcha) {
                                return Card(
                                  elevation: 2,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              kharcha.invoice,
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Text(
                                              kharcha.title,
                                              style: TextStyle(fontSize: 30),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    nafadb.instance
                                                        .delete(kharcha.id!);
                                                  });
                                                },
                                                icon: Icon(Icons
                                                    .delete_forever_outlined)),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Rate: ${kharcha.rate}',
                                              style: TextStyle(fontSize: 25),
                                            ),
                                            Text(
                                              'Total: ${kharcha.total}',
                                              style: TextStyle(fontSize: 25),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
