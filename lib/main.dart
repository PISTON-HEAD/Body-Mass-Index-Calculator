import 'package:flutter/material.dart';



const bottomcontainerheigth= 50.0;
const activecolor = Color(0xFF1d1e33);
const inactivecolor = Colors.black;
double metre = 0;
main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"BMI",
      home: bmi(),
    );
  }
}

class bmi extends StatefulWidget {

  @override
  _bmiState createState() => _bmiState();
}

class _bmiState extends State<bmi> with TickerProviderStateMixin {

  bool male = true;
  bool female = true;

  @override


  Color malecolor = activecolor;
  Color femalecolor = activecolor;
  late int malefemale ;
  int heightof = 120;
  int weigthof = 50;
  int ageof = 16;
  double k =0;
  String  totalbmi = "";

  void males(){
    setState(() {
      malefemale = 0;
      malecolor = inactivecolor;
      femalecolor =  activecolor;
    });
  }

  void females()
  {
    setState(() {
      malefemale = 1;
      malecolor= activecolor;
      femalecolor = inactivecolor;
    });
  }




  Widget bmicalc(){
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child:Text("The BMI: ${(weigthof/((heightof/100)*(heightof/100)).toDouble()).toString().substring(0,4)}",style: TextStyle(fontSize: 35,color: Colors.white),)
                  ,
                )
              ],
            ),
          )
        ],
      ),
    );
  }




  Widget body_mass_index() {
    return Scaffold(
      backgroundColor: Color(0XFF0A0E21),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: GestureDetector(
                      onTap: male ? males : null,
                      child: customcontainer(colour:malecolor,
                          containerchild:  iconfont(s:"Male",font_icon: Icons.male,)
                      ),
                    )
                ),
                Expanded(
                    child: GestureDetector(
                      onTap: female ? females : null,
                      child: customcontainer(colour:femalecolor,
                        containerchild: iconfont(s: "Female",font_icon: Icons.female,),
                      ),
                    )
                ),
              ],
            ),
          ),
          Expanded(
              child: customcontainer(colour:activecolor,containerchild:
              Column(
                children: <Widget>[
                  Text("Height",
                    style: TextStyle(fontSize: 25,color: Colors.white70,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height:5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(heightof.toString(),
                        style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),),
                      Text("cm",style: TextStyle(fontSize: 18,color: Colors.white),),
                    ],
                  ),
                  Slider(
                    value: heightof.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: Colors.lightBlueAccent[700],
                    inactiveColor: Colors.cyan[100],
                    onChanged: (double newvalue){
                      setState(() {
                        heightof = newvalue.round();
                      });
                    },
                  ),
                ],
              ),)
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: customcontainer(colour:activecolor,
                      containerchild:Column(
                        children: <Widget>[
                          Text("Weight",
                            style: TextStyle(fontSize: 23,color: Colors.white70,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 3,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(weigthof.toString(),
                                style: TextStyle(fontSize: 50,color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("kgs",style: TextStyle(fontSize: 18,color: Colors.white),),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              MaterialButton(
                                onPressed: (){
                                  setState(() {
                                    weigthof = weigthof-1;
                                  });
                                },
                                onLongPress: (){
                                  setState(() {
                                    if(weigthof >= 45 && weigthof <= 120){weigthof = weigthof-10;}
                                  });
                                },
                                child: Icon(Icons.remove_circle,size: 38,color: Colors.white60,),
                                height: 10,
                                minWidth: 10,
                              ),
                              SizedBox(width: 15,),
                              MaterialButton(
                                onPressed: (){
                                  setState(() {
                                    if(weigthof >= 45 && weigthof <= 120){weigthof = weigthof+1;}
                                  });
                                },
                                onLongPress:(){
                                  setState(() {
                                    if(weigthof >= 45 && weigthof <= 120){weigthof = weigthof+10;}
                                  });
                                },
                                height: 10,
                                minWidth: 10,
                                child: Icon(Icons.add_circle,size: 38,color: Colors.white60,),
                              ),
                            ],
                          )
                        ],
                      ),)
                ),
                Expanded(
                    child: customcontainer(colour:activecolor,
                      containerchild: Column(
                        children: <Widget>[
                          Text("Age",
                            style: TextStyle(fontSize: 23,color: Colors.white70,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 3,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(ageof.toString(),
                                style: TextStyle(fontSize: 50,color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("yrs",style: TextStyle(fontSize: 18,color: Colors.white),)
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              MaterialButton(
                                onPressed: (){
                                  setState(() {
                                    if(ageof > 16 && ageof <= 65){ageof =ageof-1;}
                                  });
                                },
                                onLongPress: (){
                                  setState(() {
                                    if(ageof > 16 && ageof <= 65){ageof =ageof-10;}
                                  });
                                },
                                child: Icon(Icons.remove_circle,size: 38,color: Colors.white60,),
                                height: 10,
                                minWidth: 10,
                              ),
                              SizedBox(width: 15,),
                              MaterialButton(
                                onPressed: (){
                                  setState(() {
                                    if(ageof >=16 && ageof <= 65){ageof =ageof+1;}
                                  });
                                },
                                onLongPress:(){
                                  setState(() {
                                    if(ageof >=16 && ageof <= 65){ageof =ageof+10;}
                                  });
                                },
                                height: 10,
                                minWidth: 10,
                                child: Icon(Icons.add_circle,size: 38,color: Colors.white60,),
                              ),
                            ],
                          )
                        ],
                      ),)
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xFFEB1555),
            margin: EdgeInsets.only(top:0),
            width: double.infinity,
            height: bottomcontainerheigth,//see top
            child: FlatButton(
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => bmicalc()));
              },
              splashColor: Colors.black,
              child: Text("CALCULATE",style: TextStyle(fontSize: 35,
                  fontWeight:FontWeight.bold,
                  color: Colors.white
              ),),
            ),
          )
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0XFF0A0E21),
          title: Text("MACRO BODY INDEX CALCULATOR",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),),
          centerTitle: true,
        ),
        body: body_mass_index()
    );
  }
}






class iconfont extends StatelessWidget {
  const iconfont({required this.s , required this.font_icon});
  final String s;
  final IconData font_icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          font_icon,
          size: 90,
          color: Colors.white,
        ),
        SizedBox(
          height: 6,
        ),
        Text(s,
          style: TextStyle(fontSize: 25,color: Colors.white70,
              fontWeight: FontWeight.w600),),
      ],
    );
  }
}

class customcontainer extends StatelessWidget {
  customcontainer({required this.colour,required this.containerchild});
  final Color colour ;
  final Widget containerchild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: containerchild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: colour,
      ),
    );
  }
}



