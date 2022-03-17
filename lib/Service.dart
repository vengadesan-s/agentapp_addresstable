import 'dart:convert';
import 'dart:io';
import '';

import 'package:agentapp/Address.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';



class Service{

  Future<List<Address>> getAllAddressses() async{
    Response res = await get(Uri.parse("http://192.168.8.124:8090/address/getall"));
    if(res.statusCode==200){
      List<dynamic> body = jsonDecode(res.body);
      List<Address> address = body.map((e) => Address.fromJson(e)).toList();
      print(address.toString());
      return address;
    }
    throw Exception("Data not found");
  }

  void deleteAddress(id) async{
    final response = await patch(
      Uri.parse('http://192.168.8.124:8090/address/delete/$id'),
    );
  }

  Future<Address> createAddress(Address address) async{
    final response = await post(Uri.parse("http://192.168.8.124:8090/address/add"),
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
      body: jsonEncode({
        "id": address.id,
        "toAddress": address.toAddress,
        "addressLine1": address.addressLine1,
        "addressLine2": address.addressLine2,
        "city": address.city,
        "state": address.state,
        "country": address.country,
        "pincode": address.pincode,
        "addressType": address.addressType,
        "isPresentAddress": address.isPresentAddress,
      }),
    );
    return Address.fromJson(jsonDecode(response.body));

  }

  Future<Address> updateAddress(id,Address address) async{
    final response = await patch(Uri.parse('http://192.168.8.124:8090/address/$id'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "id": address.id,
        "toAddress": address.toAddress,
        "addressLine1": address.addressLine1,
        "addressLine2": address.addressLine2,
        "city": address.city,
        "state": address.state,
        "country": address.country,
        "pincode": address.pincode,
        "addressType": address.addressType,
        "isPresentAddress": address.isPresentAddress,
      }),
    );
    return Address.fromJson(jsonDecode(response.body));

  }

  void harddeleteAddress(id) async{
    final response = await delete(
      Uri.parse('http://192.168.8.124:8090/address/harddelete/$id'),
    );
  }

}