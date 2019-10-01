import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class InsertData extends StatefulWidget {
  @override
  _InsertDataState createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {
  TextEditingController kolomNama = new TextEditingController();
  TextEditingController kolomJurusan = new TextEditingController();
  TextEditingController kolomAlamat = new TextEditingController();

  void addData() {
    var url = "http://172.23.199.163/flutter_mahasiswa/insert_mahasiswa.php";
    http.post(url, body: {
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
          "Data Baru",
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          child: Icon(Icons.save),
          onPressed: () {
            addData();
            Navigator.pop(
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
