import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_mate/config.dart';
import 'package:home_mate/model/service_model.dart';
import 'package:home_mate/screens/provider/update_service.dart';

class AllProviderServices extends StatefulWidget {
  const AllProviderServices({Key? key}) : super(key: key);

  @override
  State<AllProviderServices> createState() => _AllProviderServicesState();
}

class _AllProviderServicesState extends State<AllProviderServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("services").where("providerId",isEqualTo: providerUser.id).snapshots(),
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            if(snapshot.hasData){
              List<ServiceModel> serviceList = snapshot.data!.docs.map((e) => ServiceModel.fromMap(e.data())).toList();
              if(serviceList.isNotEmpty){
                return ListView.builder(
                    itemCount: serviceList.length,
                    itemBuilder: (context,index)=>ListTile(
                      onTap: (){},
                      title: Text(serviceList[index].name),
                      subtitle: Text(serviceList[index].category),
                      trailing: SizedBox(
                        width: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateService(service: serviceList[index])));
                                },
                                child: Icon(Icons.edit)),
                            InkWell(
                                onTap: ()async{
                                  await FirebaseFirestore.instance.collection("services").doc(serviceList[index].id).delete();
                                },
                                child: Icon(Icons.delete)),
                          ],
                        ),
                      ),
                    )
                );
              }
              return Center(child: Text("No Services Found"),);
            }
            return Center(child: Text("Something went wrong"),);

          }),
    );
  }
}
