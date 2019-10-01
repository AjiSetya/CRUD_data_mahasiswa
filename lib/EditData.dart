import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class EditData extends StatefulWidget {
  List list;
  int posisi;

  EditData({this.list, this.posisi});

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController kolomNama;
  TextEditingController kolomJurusan;
  TextEditingController kolomAlamat;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kolomNama = TextEditingController(text: widget.list[widget.posisi]['nama']);
    kolomJurusan =
        TextEditingController(text: widget.list[widget.posisi]['jurusan']);
    kolomAlamat =
        TextEditingController(text: widget.list[widget.posisi]['alamat']);
  }

  void editData() {
    var url = "http://172.23.199.163/flutter_mahasiswa/edit_mahasiswa.php";
    http.post(url, body: {
      "id": widget.list[widget.posisi]['id_mahasiswa'],
      "nama": kolomNama.text,
      "jurusan": kolomJurusan.text,
      "alamat": kolomAlamat.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          "Ubah Data",
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          child: Icon(Icons.save),
          onPressed: () {
            editData();
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MyApp()));
          }),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: kolomNama,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(10.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Colors.deepOrange),
                        borderRadius: BorderRadius.circular(10.0)),
                    labelText: "Nama",
                    labelStyle: TextStyle(color: Colors.deepOrange)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: kolomJurusan,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(10.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(10.0)),
                  labelText: "Jurusan",
                  labelStyle: TextStyle(color: Colors.deepOrange),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: kolomAlamat,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(10.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(10.0)),
                  labelText: "Alamat",
                  labelStyle: TextStyle(color: Colors.deepOrange),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
