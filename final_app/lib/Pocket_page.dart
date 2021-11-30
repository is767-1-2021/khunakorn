import 'dart:ui';
import 'package:final_app/controllers/item_controller.dart';
import 'package:final_app/create_item.dart';
import 'package:final_app/model/item_model.dart';
import 'package:final_app/services/item_service.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemPage extends StatefulWidget {
  var controller;
  var service = FirebaseServices();

  ItemPage() {
    controller = ItemController(service);
  }

  @override
  _ItemPageState createState() => _ItemPageState(this.controller);
}



class _ItemPageState extends State<ItemPage> {
  List<Item> items = List.empty();
  bool isLoading = false;
  var controller;

  _ItemPageState(this.controller);

  @override
  void initState() {
    _getItems();



    super.initState();

    widget.controller.onSync
        .listen((bool synState) => setState(() => isLoading = synState));
  }

  void _getItems() async {
    var newItems = await widget.controller.fectItems();

    setState(() {
      items = newItems;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Your Pocket!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          TableCalendar(
            calendarController: _calendarController,
            initialCalendarFormat: CalendarFormat.week,
            startingDayOfWeek: StartingDayOfWeek.monday,
            formatAnimation: FormatAnimation.slide,
            headerStyle: HeaderStyle(
              centerHeaderTitle: true,
              formatButtonVisible: false,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 16
              ),
              leftChevronIcon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 15,),
              rightChevronIcon: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 15,),
              leftChevronMargin: EdgeInsets.only(left: 70),
              rightChevronMargin: EdgeInsets.only(right: 70),
            ),
            calendarStyle: CalendarStyle(
              weekendStyle: TextStyle(
                color: Colors.white
              ),
              weekdayStyle: TextStyle(
                color: Colors.white
              )
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekendStyle: TextStyle(
                color: Colors.white
              ),
              weekdayStyle: TextStyle(
                color: Colors.white
              )
            ),
          ),
          SizedBox(height: 5,),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                color: Colors.white
              ),
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("18 April 2020", style: TextStyle(
                            color: Colors.grey
                          ),)
                        ],
                      ),
                      SizedBox(height: 15,),
                      Column(
                        children: [
                        
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => CreateItem()));
        },
      ),
    );
  }
  Row dayTask(String time, String name)
  {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width*0.2,
          child: Text(time, style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ), textAlign: TextAlign.right,),
        ),
        
      Expanded(
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: isLoading
            ? CircularProgressIndicator()
            : Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(5)),
                  
                  SizedBox(
                    height: 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                'Balance : ${items.length.toString()} THB!',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.deepPurple),
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 1.5,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(10),
                      itemCount: items.isEmpty ? 1 : items.length,
                      itemBuilder: (BuildContext context, int index) {
                        var ds;
                        if (items.length != 0) {
                          ds = items[index];
                          return InkWell(
                            onTap: () {
                            
                            },
                            child: Card(
                              color: Colors.white,
                              shadowColor: Colors.grey[200],
                              margin: EdgeInsets.only(
                                  top: 5.0, right: 5.0, left: 5.0),
                              shape: Border(
                                  left: BorderSide(
                                      color: Colors.amber, width: 5.0)),
                              child: Container(
                                width: double.infinity,
                                height: 100.0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                        width: 70.0,
                                        height: 70.0,
                                        child: Icon(
                                            items[index].category ==
                                                    'Revenue'
                                                ? Icons.dinner_dining
                                                : items[index].category ==
                                                        'Expense'
                                                    ? Icons.tv
                                                    : null,
                                            size: 35.0,
                                            color: Colors.indigo),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(items[index].description,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.deepPurple,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0)),
                                          Text(items[index].amount.toString(),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.indigo,
                                                  fontSize: 15.0)
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Text('No Item');
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]
    );
  }
}