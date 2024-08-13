import 'package:flutter/material.dart';
import 'package:weather_app/Services/services.dart';
import 'package:weather_app/WeatherData.dart';
class mainpage extends StatefulWidget {
  const mainpage({super.key});

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<Weatherdata?>(
        future: WeatherServices().fetchWeather(),
        builder: (context,Snapshots){
          if(Snapshots.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(Snapshots.hasError){
            return Center(child: Text('Error ${Snapshots.error}',style: TextStyle(color: Colors.white),),);
          }
          else if(Snapshots.hasData){
            final weatherd=Snapshots.data!;
            return  Column(
                children: [
                  Padding(padding: EdgeInsets.all(40)),
                  Text('Pakistan',style: TextStyle(color: Colors.white,fontSize: 30),),
                  SizedBox(height: 20,),
                  Image.asset('assets/images/img.png',height:200,width:200),
                  SizedBox(height: 10,),
                  Text('${weatherd.clouds}"',style: TextStyle(color: Colors.grey,fontSize: 25),),
                  SizedBox(height: 10,),
                  Text('${weatherd.description}',style: TextStyle(color: Colors.grey,fontSize: 20),),
                  SizedBox(height: 70,),
                  Row(children: [
                    SizedBox(width: 30,),
                    Container(
                      height: 150,
                      width: 150,
                      color: Colors.white,
                      child: Column(
                          children: [
                            Text("Tempurature",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                            SizedBox(height: 70,),
                            Text('${weatherd.temp} °C',style: TextStyle(fontSize: 15)),
                          ]
                      ),
                    ),
                    SizedBox(width: 50,),
                    Container(
                      height: 150,
                      width: 150,
                      color: Colors.yellowAccent,
                      child: Column(
                          children: [
                            Text("Humidity",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                            SizedBox(height: 70,),
                            Text("{weatherd.humidity}",style: TextStyle(fontSize: 15)),
                          ]
                      ),
                    ),
                  ],),
                  SizedBox(height: 20,),
                  Row(children: [
                    SizedBox(width: 30,),
                    Container(
                      height: 150,
                      width: 150,
                      color: Colors.blueAccent,
                      child: Column(
                          children: [
                            Text("Main",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                            SizedBox(height: 70,),
                            Text("${weatherd.humidity}}" ,style: TextStyle(fontSize: 15)),
                          ]
                      ),
                    ),
                    SizedBox(width: 50,),
                    Container(
                      height: 150,
                      width: 150,
                      color: Colors.purple,
                      child: Column(
                          children: [
                            Text("Feels-like",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                            SizedBox(height: 70,),
                            Text("${weatherd.feelsLike}",style: TextStyle(fontSize: 15)),
                          ]
                      ),
                    ),
                  ],),



                ]
            );
          }
          else{
            return Center(child: Text('No data available',style: TextStyle(color: Colors.white),));
          }
        },
        )

    );
  }
}
