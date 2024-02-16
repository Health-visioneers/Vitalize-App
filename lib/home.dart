import 'package:flutter/material.dart';
import 'package:vitaliz/widgets/home_page_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

  List<String> icons = [
    "assets/icons/doctor.png",
    "assets/icons/prescription.png",
    "assets/icons/documents.png",
    "assets/icons/notification.png",
  ];

  List<String> titles = [
    "Instant Consultation",
    "Your Prescriptions",
    "Your Records",
    "Manage Notifications",
  ];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(      
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Stack(
            children: [
              Container(
                width: w,
                height: h * 0.7,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25)),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 135, 133, 255),
                      Color.fromARGB(255, 200, 199, 255),
                      Color.fromARGB(255, 220, 220, 255),
                      Color.fromRGBO(238, 238, 255, 1)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: h * 0.05),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                          child: Row(
                            children: [
                                Container(
                                width: w * 0.8,
                                height: h * 0.05,
                                padding:const EdgeInsets.only(top: 6,left: 12),
                                decoration: BoxDecoration(
                                  color:const Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child:Row(
                                  children: [
                                    const Icon(Icons.search,color: Color.fromARGB(255, 33, 33, 33),),
                                    const SizedBox(width: 10,),
                                    const Text("Search our wide range of services",style: TextStyle(fontFamily: 'metro',fontSize: 12,color: Color.fromARGB(255, 128, 128, 128)),),
                                    SizedBox(width: w * 0.07,),
                                    const Icon(Icons.mic,color: Color.fromARGB(255, 119, 117, 255)),
                                  ],
                                ),
                              ),
                              SizedBox(width: 5,),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/icons/profile.png")
                                    )
                                  ),
                                )
                              ],
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(left:15.0,top: 15),
                          child: Text("What are you looking for ?",style: TextStyle(fontFamily: 'metro-m',fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
                        ),
                        Container(
                          width: w,
                          height: h * 0.5,
                          padding: EdgeInsets.only(left: 20,top: 0),
                          child: GridView.builder(
                            itemCount: 4,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10
                            ),
                            itemBuilder: (context, index){
                              return HomePageCard(w: w, h: h,icon: icons[index],title : titles[index],index:index);
                            }
                          ),
                        ),
                      ],
                    ),
                ),
              ),
            ],
          ),
        ),
        
    );
  }
}

