import 'package:flutter/material.dart';

import 'widgets/custom_card_widgets.dart';

void main() {
  runApp(const AyBayApp());
}

class AyBayApp extends StatelessWidget {
  const AyBayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 2),
              borderRadius: BorderRadius.circular(20)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 1),
              borderRadius: BorderRadius.circular(20)),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _ayTEController = TextEditingController();

  final _bayTBController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  List<AyBayModel> ayBayList = [
    AyBayModel(ay: "ay", bay: "bay"),
    AyBayModel(ay: "ay", bay: "bay"),
    AyBayModel(ay: "ay", bay: "bay"),
    AyBayModel(ay: "ay", bay: "bay"),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade100,
        centerTitle: true,
        title: Text("Ay Bay Hishab"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _ayTEController,
                    decoration:
                        InputDecoration(hintText: "Ay", labelText: "Ay"),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _bayTBController,
                    decoration:
                        InputDecoration(hintText: 'Bay', labelText: "Bay"),
                  )),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white),
                    onPressed: () {
                      ayBayList.add(AyBayModel(
                          ay: _ayTEController.text.trim(),
                          bay: _bayTBController.text.trim()));
                      _ayTEController.clear();
                      _bayTBController.clear();
                      setState(() {});
                    },
                    child: Text("Add")),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCardWidgets(
                    text: 'Ay',
                    color: Colors.green,
                  ),
                  CustomCardWidgets(
                    text: 'Date',
                    color: Colors.blue,
                  ),
                  CustomCardWidgets(
                    text: 'Bay',
                    color: Colors.brown.shade900,
                  ),
                  CustomCardWidgets(
                    text: 'Deleted',
                    color: Colors.pink,
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 0,
                color: Colors.deepPurple.shade200,
                child: ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: ayBayList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          Expanded(
                            flex: 2,
                            child: Text(
                              ayBayList[index].ay,
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                          Expanded(
                            flex: 3 ,
                            child: Card(
                              child: Center(
                                child: Text(
                                  ayBayList[index].ay,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Expanded(
                            flex: 2,
                            child: Text(
                              ayBayList[index].bay,
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              ayBayList.removeAt(index);
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(thickness: 1, color: Colors.grey.shade300);
                  },
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

/// Ekta data type banalam
class AyBayModel {
  final String ay, bay;
  AyBayModel({required this.ay, required this.bay});
}
