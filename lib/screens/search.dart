import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:home_mate/config.dart';
import 'package:home_mate/constant/colors.dart';
import 'package:home_mate/model/provider_model.dart';
import 'package:home_mate/model/service_model.dart';
import 'package:home_mate/widgets/services_card.dart';

class SearchService extends StatefulWidget {
  const SearchService({Key? key}) : super(key: key);

  @override
  State<SearchService> createState() => _SearchServiceState();
}

class _SearchServiceState extends State<SearchService> {
  TextEditingController search = TextEditingController();
  int filter = 1;
  String query = "";
  List<ServiceModel> result = userServices;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clBG,
      appBar: AppBar(
        backgroundColor: clPrimary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Search Services",style: TextStyle(color: Colors.white),),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 60,
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: clContainer,
                ),
                child: TextField(
                  controller: search,
                  onChanged: (value){
                      setState(() {
                        query = value;
                        result = filterResult(query, filter);
                        log(result.toString());
                      });
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: "Search Services",
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              PopupMenuButton(
                offset: Offset(0,70),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    onTap: (){
                      setState(() {
                        filter = 1;
                        result = filterResult(query, filter);
                        log(result.toString());

                      });
                    },
                    value: 1,
                    child: const Text(
                      "Service Name",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                  ),
                  PopupMenuItem(
                    onTap: (){
                      setState(() {
                        filter = 2;
                        result = filterResult(query, filter);
                        log(result.toString());

                      });
                    },
                    value: 2,
                    child: const Text(
                      "Service Provider",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
                icon: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 60,
                    width: 60,
                    color: clPrimary,
                    child: const Icon(
                      Icons.filter_alt,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                  // child:
                ),

            ],
          ),
          (result.isNotEmpty)?
          Column(
            children: [
              for(ServiceModel i in result)
                ServiceCard(
                  info: i,
                  width: MediaQuery.of(context).size.width,
                )
            ],
          ):Center(child: Text("No Services Found"),)
        ],
      ),
    );
  }
  List<ServiceModel> filterResult(String query,int filter){
    switch (filter){
      case 1:
        return userServices.where((element) => element.name.toLowerCase().contains(query.toLowerCase())).toList();
      case 2:
        return userServices.where((element) => (ProviderUserModel.fromMap(element.provider).fName.toLowerCase() + ProviderUserModel.fromMap(element.provider).lName.toLowerCase()).contains(query.toLowerCase())).toList();
      default:
        return [];

    }
  }
}
