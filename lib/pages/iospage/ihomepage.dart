import 'package:flutter/cupertino.dart';
import 'package:projectplaystore/library/source.dart';
import '../all_class/iappclass.dart';

class IHomePage extends StatefulWidget {
  const IHomePage({Key? key}) : super(key: key);

  @override
  State<IHomePage> createState() => _IHomePageState();
}

class _IHomePageState extends State<IHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(18),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50,),
                    const Text("WEDNESDAY, SEPTEMBER 12",style:  TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w400),),
                    const SizedBox(height: 10,),
                    Row(
                      children: const [
                        Text("Today",style:  TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                        Spacer(),
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTH5nQJWZQRIOVTwYPonRr-Rubtsan7gt7XgHvzwkmtEb86VTThf8sdNlc2N6kpul3t8A&usqp=CAU"),
                        ),
                      ],
                    ),
                    Column(
                      children: todayList.map((e) =>  Container(
                        margin: const EdgeInsets.only(top: 30),
                        height: 450,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 2.0, // soften the shadow
                              spreadRadius: 0.0, //extend the shadow
                              offset: Offset(
                                0.1,
                                3,
                              ),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(image: NetworkImage(e.img),fit: BoxFit.cover,),
                        ),
                      ),).toList(),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                const Spacer(),
                CupertinoTabBar(
                  height: 60,
                  currentIndex: iBottomIndex,
                  onTap: (val){
                    setState(() {
                      iBottomIndex = val;
                      if(iBottomIndex == 1)
                      {
                        Navigator.of(context).pushNamed("game_page");
                      }if(iBottomIndex == 2)
                      {
                        Navigator.of(context).pushNamed("app_page");
                      }
                    });
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.today),
                      label: "Today",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.rocket_fill),
                      label: "Games",
                    ), BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.plus_app_fill),
                      label: "Apps",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.cloud_download_fill),
                      label: "Updates",
                    ), BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.search),
                      label: "search",
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
    );
  }
}

class GamesPage extends StatefulWidget {
  const GamesPage({Key? key}) : super(key: key);

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child:  Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(18),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60,),
                Row(
                  children: const [
                    Text("Games",style:  TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                    Spacer(),
                    CircleAvatar(
                      radius: 18,
                      backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTH5nQJWZQRIOVTwYPonRr-Rubtsan7gt7XgHvzwkmtEb86VTThf8sdNlc2N6kpul3t8A&usqp=CAU"),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: todayList.map((e) => Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            const SizedBox(height: 30,),
                            const Text("NEW GAME",style: TextStyle(color: Colors.blue,fontSize: 12),),
                            Text(e.name,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                            Text(e.description,style: const TextStyle(color: Colors.grey),),
                            Container(
                              margin: const EdgeInsets.only(top: 10,right: 10),
                              height: 180,
                              width: MediaQuery.of(context).size.width * 0.85,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                               image: DecorationImage(
                                 image: NetworkImage(e.img),fit: BoxFit.cover,
                               )
                             ),
                            ),
                          ],
                        ),).toList()
                      ),
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: const [
                        Text("Discover AR Gaming",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                        Spacer(),
                        Text("See All",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600),)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Column(
                      children: todayList.map((e) =>  Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: Row(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(18),
                                image: DecorationImage(image: NetworkImage(e.img),fit: BoxFit.cover),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(e.name),
                                 Text(e.subName,style: const TextStyle(color: Colors.grey,fontSize: 12),),
                                const SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Container(
                                      height: 25,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Color(0xffF0F0F8),
                                      ),
                                      alignment: Alignment.center,
                                      child: const Text("GET",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600),),
                                    ),
                                    const SizedBox(width: 10,),
                                    const Text("In -APP \n Purchase ",style: TextStyle(fontSize: 8,color: Colors.grey),),
                                  ],
                                ),
                              ],
                            ),

                          ],
                        ),
                      )).toList(),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            const Spacer(),
            CupertinoTabBar(
              height: 60,
              currentIndex: iBottomIndex,
              onTap: (val){
                setState(() {
                  iBottomIndex = val;
                  if(iBottomIndex == 0)
                    {
                      Navigator.of(context).pushNamed("/");
                    } if(iBottomIndex == 2)
                    {
                      Navigator.of(context).pushNamed("app_page");
                    }
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.today),
                  label: "Today",
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.rocket_fill),
                  label: "Games",
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.plus_app_fill),
                  label: "Apps",
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.cloud_download_fill),
                  label: "Updates",
                ), BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.search),
                  label: "search",
                ),
              ],
            ),
          ],
        ),
      ],
    ),);
  }
}




class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child:  Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60,),
                  Row(
                    children: const [
                      Text("Apps",style:  TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                      Spacer(),
                      CircleAvatar(
                        radius: 18,
                        backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTH5nQJWZQRIOVTwYPonRr-Rubtsan7gt7XgHvzwkmtEb86VTThf8sdNlc2N6kpul3t8A&usqp=CAU"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                            children: todayList.map((e) => Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                const SizedBox(height: 30,),
                                const Text("NOW WITH SIRI",style: TextStyle(color: Colors.blue,fontSize: 12),),
                                Text(e.name,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                                Text(e.description,style: const TextStyle(color: Colors.grey),),
                                Container(
                                  margin: const EdgeInsets.only(top: 10,right: 10),
                                  height: 180,
                                  width: MediaQuery.of(context).size.width * 0.85,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage(e.img),fit: BoxFit.cover,
                                      )
                                  ),
                                ),
                              ],
                            ),).toList()
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Row(
                        children: const [
                          Text("12 Great Apps for iOS 12",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                          Spacer(),
                          Text("See All",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Column(
                        children: todayList.map((e) =>  Padding(
                          padding: const EdgeInsets.only(bottom: 25),
                          child: Row(
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(18),
                                  image: DecorationImage(image: NetworkImage(e.img),fit: BoxFit.cover),
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(e.name),
                                  Text(e.subName,style: const TextStyle(color: Colors.grey,fontSize: 12),),
                                  const SizedBox(height: 10,),
                                ],
                              ),
                                Spacer(),
                              Container(
                                height: 25,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color(0xffF0F0F8),
                                ),
                                alignment: Alignment.center,
                                child: const Text("GET",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600),),
                              ),

                            ],
                          ),
                        )).toList(),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              const Spacer(),
              CupertinoTabBar(
                height: 60,
                currentIndex: iBottomIndex,
                onTap: (val){
                  setState(() {
                    iBottomIndex = val;
                    if(iBottomIndex == 0)
                    {
                      Navigator.of(context).pushNamed("/");
                    } if(iBottomIndex == 1)
                    {
                      Navigator.of(context).pushNamed("game_page");
                    }
                  });
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.today),
                    label: "Today",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.rocket_fill),
                    label: "Games",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.plus_app_fill),
                    label: "Apps",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.cloud_download_fill),
                    label: "Updates",
                  ), BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.search),
                    label: "search",
                  ),
                ],
              ),
            ],
          ),
        ],
      ),);
  }
}
