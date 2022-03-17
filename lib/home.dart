





import 'package:agentapp/AddAddress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Address.dart';
import 'Service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {

  Service serviceapi = Service();
  String? to;
  String? al1;
  String? al2;
  String? cit;
  String? sta;
  String? count;
  String? pin;
  String? addtype;
  bool? present;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Address"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => const AddAddress()
            )
            ).then((value){
                setState(() {});
            });
          }, icon: const Icon(
            Icons.add,
            color: Colors.white,
          ))
        ],
      ),
      body: FutureBuilder(builder: (
          BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        print(snapshot.hasData);
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: Card(
                child: Column(
                  children: [
                    Text("id: ${snapshot.data[index].id}"),
                    Text("Name: ${snapshot.data[index].toAddress}"),
                    Text("Address Line 1: ${snapshot.data[index].addressLine1}"),
                    Text("Address Line 2: ${snapshot.data[index].addressLine2}"),
                    Text("City: ${snapshot.data[index].city}"),
                    Text("State: ${snapshot.data[index].state}"),
                    Text("Country: ${snapshot.data[index].country}"),
                    Text("Pincode: ${snapshot.data[index].pincode}"),
                    Text("Address Type: ${snapshot.data[index].addressType}"),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "${snapshot.data[index].id}"
                      ),
                    ),
                    IconButton(onPressed: (){
                      showDialog<void>(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('AlertDialog Title'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children:<Widget>[
                                  SizedBox(height: 10),
                                  TextFormField(
                                    initialValue: '${snapshot.data[index].toAddress}',
                                    onChanged: (e){
                                      setState(() {
                                        to = e;
                                      });
                                    },
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "To",
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  TextFormField(
                                    initialValue: '${snapshot.data[index].addressLine1}',
                                    onChanged: (e){
                                      setState(() {
                                        al1 = e;
                                      });
                                    },
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "Address Line 1",
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  TextFormField(
                                    initialValue: '${snapshot.data[index].addressLine2}',
                                    onChanged: (e){
                                      setState(() {
                                        al2 = e;
                                      });
                                    },
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "Address Line 2",
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  TextFormField(
                                    initialValue: '${snapshot.data[index].city}',
                                    onChanged: (e){
                                      setState(() {
                                        cit = e;
                                      });
                                    },
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "City",
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  TextFormField(
                                    initialValue: '${snapshot.data[index].state}',
                                    onChanged: (e){
                                      setState(() {
                                        sta = e;
                                      });
                                    },
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "State",
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  TextFormField(
                                    initialValue: '${snapshot.data[index].country}',
                                    onChanged: (e){
                                      setState(() {
                                        count = e;
                                      });
                                    },
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "Country",
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  TextFormField(
                                    initialValue: '${snapshot.data[index].pincode}',
                                    onChanged: (e){
                                      setState(() {
                                        pin = e;
                                      });
                                    },
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "Pincode",
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  TextFormField(
                                    initialValue: '${snapshot.data[index].addressType}',
                                    onChanged: (e){
                                      setState(() {
                                        addtype = e;
                                      });
                                    },
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "Address Type",
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Checkbox(
                                    checkColor: Colors.white,
                                    value: isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text('Save'),
                                onPressed: () {
                                  serviceapi.updateAddress(snapshot.data[index].id, Address(
                                    id: snapshot.data[index].id,
                                    toAddress: to,
                                    addressLine1: al1,
                                    addressLine2: al2,
                                    city: cit,
                                    state: sta,
                                    country: count,
                                    pincode: pin,
                                    addressType: addtype,
                                    isPresentAddress: isChecked,
                                  ));
                                  setState(() {
                                    serviceapi.getAllAddressses();
                                  });
                                },
                              ),
                            ],
                          );
                        },
                      );
                      setState(() {
                        serviceapi.getAllAddressses();
                      });
                    }, icon: const Icon(Icons.edit)
                    ),
                    IconButton(onPressed: (){
                      serviceapi.deleteAddress(snapshot.data[index].id);
                      setState(() {
                        serviceapi.getAllAddressses();
                      });
                    }, icon: const Icon(Icons.delete_forever)
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
        future: serviceapi.getAllAddressses(),
      ),
    );
  }
}
