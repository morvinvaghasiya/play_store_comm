import 'package:projectplaystore/library/source.dart';
import 'package:projectplaystore/pages/all_class/appsclass.dart';
import 'package:projectplaystore/pages/all_class/local_notification.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        key: _key,
        drawer: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 70,
              ),
              const CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTH5nQJWZQRIOVTwYPonRr-Rubtsan7gt7XgHvzwkmtEb86VTThf8sdNlc2N6kpul3t8A&usqp=CAU"),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Morvin Vaghasiya"),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                height: 1,
              ),
              Row(
                children: [
                  const Text("Change OS"),
                  const Spacer(),
                  Switch(
                      value: isIos,
                      onChanged: (val) {
                        isIos = val;
                        setState(() {});
                      }),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                height: 1,
              ),
              70.0.heightSizeBox,
              ElevatedButton(onPressed: () {}, child: const Text("Log Out"))
            ],
          ),
        ),
        appBar: AppBar(
          elevation: 1,
          automaticallyImplyLeading: false,
          backgroundColor: whiteColor,
          title: Container(
            padding: const EdgeInsets.all(8),
            height: size.height * 0.05,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: whiteColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 1.0, // soften the shadow
                  spreadRadius: 0.0, //extend the shadow
                  offset: Offset(
                    0.1,
                    0.1,
                  ),
                ),
              ],
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    _key.currentState!.openDrawer();
                  },
                  child: const Icon(
                    Icons.menu_outlined,
                    color: blackColor,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  searchForApps,
                  style: TextStyle(color: greyShade400, fontSize: 15),
                ),
                const Spacer(),
                const Icon(
                  Icons.mic_none,
                  color: blackColor,
                ),
                IconButton(
                  alignment: Alignment.bottomCenter,
                  icon: const Icon(Icons.notifications_active_outlined),
                  color: blackColor,
                  onPressed: () {
                    Notify();
                  },
                ),
              ],
            ),
          ),
          bottom: TabBar(
            onTap: (val) {},
            indicatorWeight: 3,
            labelPadding: const EdgeInsets.all(15),
            labelColor: indicatorColor,
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: tabBarColor,
            tabs: const [
              Text(forYou),
              Text(topCharts),
              Text(categories),
              Text(editorCheck),
              Text(newText),
            ],
            isScrollable: true,
            indicatorColor: indicatorColor,
          ),
          toolbarHeight: 60,
        ),
        body: const TabBarView(
          children: [
            //1 Screen
            FirstTabScreen(),
            //2 screen
            SecondTabScreen(),
            //3 screen
            Center(
              child: Text("Coming Soon...."),
            ),
            //4 screen
            Center(
              child: Text("Coming Soon...."),
            ),
            //5 screen
            Center(
              child: Text("Coming Soon...."),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (val) {
            setState(() {
              bottomIndex = val;
            });
          },
          fixedColor: indicatorColor,
          currentIndex: bottomIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.videogame_asset_outlined),
              label: "Games",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Apps"),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_movies_outlined), label: "Movies & TV"),
            BottomNavigationBarItem(
                icon: Icon(Icons.book_outlined), label: "Books"),
          ],
        ),
      ),
    );
  }
}

///
///1 tab screen
///

class FirstTabScreen extends StatelessWidget {
  const FirstTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return (index == 3)
              ? Container()
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        appsList[index].sname,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18),
                      ),
                      const Icon(Icons.arrow_forward_outlined),
                    ],
                  ),
                );
        },
        separatorBuilder: (context, index) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: appsList[index]
                  .listname
                  .map((e) => Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed("install_page", arguments: e);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.width * 0.3,
                                width: MediaQuery.of(context).size.width * 0.3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.red,
                                    image: DecorationImage(
                                        image: NetworkImage(e.img),
                                        fit: BoxFit.cover)),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                e.name,
                                style: const TextStyle(fontSize: 10),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "${e.rating}⭐",
                                style: const TextStyle(fontSize: 10),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
          );
        },
        itemCount: appsList.length);
  }
}

///
///2 tab screen
///

class SecondTabScreen extends StatefulWidget {
  const SecondTabScreen({Key? key}) : super(key: key);

  @override
  State<SecondTabScreen> createState() => _SecondTabScreenState();
}

class _SecondTabScreenState extends State<SecondTabScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Show installed apps",
                  style: TextStyle(color: Colors.grey),
                ),
                Switch(
                    activeColor: indicatorColor,
                    value: installSwitchVal,
                    onChanged: (val) {
                      installSwitchVal = val;
                      setState(() {});
                    }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: recommended
                  .map(
                    (e) => Row(
                      children: [
                        Text(
                          ("${recommended.indexOf(e) + 1}"),
                          style: const TextStyle(color: Colors.grey),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 15),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            image: DecorationImage(
                              image: NetworkImage(e.img),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.name),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              e.subName,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Text(
                                  "${e.rating}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Colors.grey),
                                ),
                                const Icon(
                                  Icons.star,
                                  size: 12,
                                  color: Colors.black54,
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

extension Extendeddouble on double {
  Widget get widthSizeBox => SizedBox(
        width: this,
      );
  Widget get heightSizeBox => SizedBox(
        height: this,
      );
}
