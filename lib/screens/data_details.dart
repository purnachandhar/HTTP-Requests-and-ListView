import 'package:fetch_data_task/model/data.dart';
import 'package:flutter/material.dart';

class DataDetails extends StatelessWidget {
  final Data datadetails;

  DataDetails(this.datadetails);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${datadetails.first_name}"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.0,
            ),
            _dataImage(datadetails),
            SizedBox(
              height: 10.0,
            ),
            _dataEmail(datadetails),
            SizedBox(
              height: 30.0,
            ),
            _dataFullNameAndLastName(datadetails)
          ],
        ),
      ),
    );
  }

  Widget _dataImage(Data datadetails) {
    return Container(
        child: CircleAvatar(
            radius: 80.0,
            backgroundImage: NetworkImage(
              datadetails.avatar,
            )));
  }

  Widget _dataEmail(Data datadetails) {
    return Text(
      "${datadetails.email}",
      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
    );
  }

  Widget _dataFullNameAndLastName(Data datadetails) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("${datadetails.first_name}",
            style: TextStyle(fontSize: 15.0)),
        Text("${datadetails.last_name}",
            style: TextStyle(fontSize: 15.0)),
      ],
    );
  }
}
