import 'dart:convert';
import 'package:fetch_data_task/screens/data_details.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../model/data.dart';


/*
auther: PurnaChandhr
data of created : 2/3/2022
Info: this page is to Fetch data from https://reqres.in/api/users?page=1 and display in list form
* */

class CompleteData extends StatefulWidget {
  const CompleteData({Key? key}) : super(key: key);

  @override
  _CompleteDataState createState() => _CompleteDataState();
}

class _CompleteDataState extends State<CompleteData> {
  final List<Data> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Data")),
        body: ListView.builder(
            itemCount: this.items.length, itemBuilder: _listViewItemBuilder));
  }


  //getData function is used to Fetch data from url
  void getData() async {
    final http.Response response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=1'));
    final Map<String, dynamic> responseData = json.decode(response.body);
    responseData['data'].forEach((dataDetail) {
      final Data data = Data(
        id: dataDetail['id'],
        email: dataDetail['email'],
        first_name: dataDetail['first_name'],
        last_name: dataDetail['last_name'],
        avatar: dataDetail['avatar'],
      );
      setState(() {
        items.add(data);
      });
    });
  }

  Widget _listViewItemBuilder(BuildContext context, int index) {
    var dataDetail = this.items[index];
    return ListTile(
        contentPadding: EdgeInsets.all(10.0),
        leading: _itemThumbnail(dataDetail),
        title: _itemTitle(dataDetail),
        subtitle: _itemSubTitle(dataDetail),
        onTap: () {
          _navigationToDataDetail(context, dataDetail);
        });
  }

  Widget _itemThumbnail(Data dataDetail) {
    return Container(
      constraints: BoxConstraints.tightFor(width: 100.0),
      child: dataDetail.avatar == null
          ? null
          : CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(dataDetail.avatar),
            ),
    );
  }

  Widget _itemTitle(Data dataDetail) {
    return Text(dataDetail.email, style: TextStyle(fontSize: 20.0));
  }

  Widget _itemSubTitle(Data dataDetail) {
    return Text(dataDetail.first_name, style: TextStyle(fontSize: 15.0));
  }

  void _navigationToDataDetail(BuildContext context, Data dataDetail) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DataDetails(dataDetail);
    }));
  }
}
