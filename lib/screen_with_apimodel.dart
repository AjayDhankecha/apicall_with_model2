import 'package:apicall_with_model2/api_model.dart';
import 'package:apicall_with_model2/api_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ScreenWithApiModel extends StatefulWidget {
  const ScreenWithApiModel({super.key});

  @override
  State<ScreenWithApiModel> createState() => _ScreenWithApiModelState();
}

class _ScreenWithApiModelState extends State<ScreenWithApiModel> {
  bool isReady = false;
  List<ApiModel> apiDataModel = [];

  _getDataFromApiServices() {
    isReady = true;
    ApiServices().getApiData().then((value) {
      setState(() {
        apiDataModel = value!;
        isReady = false;
      });
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  @override
  void initState() {
    _getDataFromApiServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'MultiData With Api Model',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: isReady == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: apiDataModel.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.yellow,
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          color: Colors.white,
                          margin: EdgeInsets.only(left: 125, right: 125),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ID : ' + apiDataModel[index].id.toString(),
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: Colors.white,
                              width: 70,
                              child: Center(
                                child: Text(
                                  ' TITLE | ',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(width: 5,),
                            Expanded(
                              child: Text(
                                apiDataModel[index].name.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ' EMAIL | ',
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: Text(
                                apiDataModel[index].email.toString(),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ' BODY | ',
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: Text(
                                apiDataModel[index].body.toString(),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}
