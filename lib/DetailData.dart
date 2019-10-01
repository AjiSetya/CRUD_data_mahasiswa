import 'package:flutter/material.dart';
import 'EditData.dart';
import 'main.dart';
import 'package:http/http.dart' as http;

class DetailData extends StatefulWidget {
  List list;
  int posisi;

  DetailData({this.list, this.posisi});

  @override
  _DetailDataState createState() => _DetailDataState();
}

class _DetailDataState extends State<DetailData> {
  void hapusData() {
    var url = "http://172.23.199.163/flutter_mahasiswa/hapus_mahasiswa.php";
    http.post(url, body: {"id": widget.list[widget.posisi]['id_mahasiswa']});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          widget.list[widget.posisi]["nama"],
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditData(
                            list: widget.list, posisi: widget.posisi)));
              },
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                hapusData();
                Navigator.pop(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.list[widget.posisi]["nama"],
              style: TextStyle(fontSize: 30.0),
            ),
            Text(
              widget.list[widget.posisi]["jurusan"],
            ),
            Text(
              widget.list[widget.posisi]["alamat"],
            ),
          ],
        ),
      ),
    );
  }
}
