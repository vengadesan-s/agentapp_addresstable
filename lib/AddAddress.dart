import 'package:agentapp/Service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Address.dart';

class AddAddress  extends StatefulWidget {
  const AddAddress ({Key? key}) : super(key: key);

  @override
  State<AddAddress> createState() => _AddAddress();
}

class _AddAddress extends State<AddAddress> {
  Service serviceapi = Service();
  TextEditingController id = TextEditingController();
  TextEditingController toAddress = TextEditingController();
  TextEditingController addressLine1 = TextEditingController();
  TextEditingController addressLine2 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController addressType = TextEditingController();
  TextEditingController isPresentAddress = TextEditingController();
  bool isChecked = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Add Address"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: id,
              decoration: const InputDecoration(
                labelText: "Id",
                border: OutlineInputBorder(),
              ),
            ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 250,
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: toAddress,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "To:",
                    ),
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return "Enter Text";
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 250,
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: addressLine1,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Address Line 1",
                    ),
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return "Enter Text";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  width: 250,
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: addressLine2,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Address Line 2",
                    ),
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return "Enter Text";
                      }
                      return null;
                    },
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 250,
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: city,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "City",
                    ),
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return "Enter Text";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  width: 250,
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: state,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "State",
                    ),
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return "Enter Text";
                      }
                      return null;
                    },
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 250,
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: country,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Country",
                    ),
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return "Enter Text";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  width: 250,
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: pincode,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Pincode",
                    ),
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return "Enter Text";
                      }
                      return null;
                    },
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 250,
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: addressType,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Address Type",
                    ),
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return "Enter Text";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  width: 250,
                  padding: const EdgeInsets.all(20.0),
                  child: Checkbox(
                    checkColor: Colors.white,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.blueAccent,
              width: 100,
              height: 30,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                  serviceapi.createAddress(Address(
                    id: int.parse(id.text),
                    toAddress: toAddress.text,
                    addressLine1: addressLine1.text,
                    addressLine2: addressLine2.text,
                    city: city.text,
                    state: state.text,
                    country: country.text,
                    pincode: pincode.text,
                    addressType: addressType.text,
                    isPresentAddress: isChecked,
                  ));
                  setState(() {
                    serviceapi.getAllAddressses();
                  });
                }, child: const Text(
                "Submit",
                style: TextStyle(color: Colors.black),
              ),
              ),

            )
          ],
        ),
      ),
    );
  }
}
