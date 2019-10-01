import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'InsertData.dart';
import 'DetailData.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // method untuk menampilkan data
  Future<List> getDataMahasiswa() async {
    final response = await http
        .get("http://172.23.199.163/flutter_mahasiswa/get_mahasiswa.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          "Data Mahasiswa",
          style: TextStyle(color: Colors.white),
        ),
        // centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => InsertData()));
          }),
      body: FutureBuilder<List>(
          future: getDataMahasiswa(),
          builder: (context, dataResult) {
            if (dataResult.hasError) print(dataResult.error);
            return dataResult.hasData
                ? ItemList(list: dataResult.data)
                : Center(
                    child: CircularProgressIndicator(),
                  );
          }),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;

  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, posisi) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
            child: Card(
              child: ListTile(
                title: Text(list[posisi]['nama']),
                subtitle: Text(list[posisi]["jurusan"]),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailData(list: list, posisi: posisi)));
                },
              ),
            ),
          );
        });
  }
}
