import 'package:projectplaystore/library/source.dart';

class InstallPage extends StatefulWidget {
  const InstallPage({Key? key}) : super(key: key);

  @override
  State<InstallPage> createState() => _InstallPageState();
}

class _InstallPageState extends State<InstallPage> {
  @override
  Widget build(BuildContext context) {
    dynamic arg = ModalRoute.of(context)!.settings.arguments;
    Apps n = arg;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
        ),
        actions: const [
          Icon(
            Icons.search,
            color: blackColor,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.more_vert_rounded,
            color: blackColor,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: NetworkImage(arg.img), fit: BoxFit.cover),
                    ),
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.22,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          arg.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          arg.subName,
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: indicatorColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          "Contains ads * In-app purchases",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade400),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${arg.rating}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          ),
                          const Icon(Icons.star,size: 16,)
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "95K reviews",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                  Text(
                    "|",
                    style: TextStyle(fontSize: 25, color: Colors.grey.shade200),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.file_download,
                        color: Colors.black54,
                        size: 18,
                      ),
                      Text(
                        "66 MB",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                  Text(
                    "|",
                    style: TextStyle(fontSize: 25, color: Colors.grey.shade200),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        arg.download,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Downloads",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: InkWell(
                onTap: (){},
                child: Container(
                  height: 40,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                  color: indicatorColor,
                  ),
                  child: const Text(
                    "Install",
                    style: TextStyle(color: whiteColor),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: n.assetsImg.map((e) => Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.77,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(e),fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),).toList(),
                ),
              ),
            ),
            const SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const[
                  Text("About this game",style:  TextStyle(fontWeight: FontWeight.w800,fontSize: 17),),
                  Icon(Icons.arrow_forward,size: 20,),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(arg.description,style: TextStyle(color: Colors.grey.shade400,fontWeight: FontWeight.w600),),
            ),
            const SizedBox(height: 18,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    alignment: Alignment.center,
                    child: const Text("Action",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w600),),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width * 0.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    alignment: Alignment.center,
                    child: const Text("Editor's choice",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w600),),
                  ),

                ],
              ),
            ),
            const SizedBox(height: 35,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: const [
                  Text("Rating & reviews",style:  TextStyle(fontWeight: FontWeight.w800,fontSize: 17),),
                  SizedBox(width: 5,),
                  Icon(Icons.error_outline,color: Colors.grey,size: 18,),
                  Spacer(),
                  Icon(Icons.arrow_forward,size: 20,),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: Text("4.6",style: TextStyle(fontSize: 60,color: Color(0xff42474B)),),
                  ),
                  const SizedBox(width: 20,),
                  Column(
                    children: [
                      Row(
                        children: [
                          const Text("5"),
                          const SizedBox(width: 10,),
                          Stack(
                            children: [
                              Container(
                                height: 13,
                                width: 170,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                color: Colors.grey.shade50,
                                ),
                              ),
                              Container(
                                height: 13,
                                width: 140,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                color: indicatorColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        children: [
                          const Text("4"),
                          const SizedBox(width: 10,),
                          Stack(
                            children: [
                              Container(
                                height: 13,
                                width: 170,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                color: Colors.grey.shade50,
                                ),
                              ),
                              Container(
                                height: 13,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                color: indicatorColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        children: [
                          const Text("3"),
                          const SizedBox(width: 10,),
                          Stack(
                            children: [
                              Container(
                                height: 13,
                                width: 170,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                color: Colors.grey.shade50,
                                ),
                              ),
                              Container(
                                height: 13,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                color: indicatorColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        children: [
                          const Text("2"),
                          const SizedBox(width: 10,),
                          Stack(
                            children: [
                              Container(
                                height: 13,
                                width: 170,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                color: Colors.grey.shade50,
                                ),
                              ),
                              Container(
                                height: 13,
                                width: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                color: indicatorColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        children: [
                          const Text("1"),
                          const SizedBox(width: 10,),
                          Stack(
                            children: [
                              Container(
                                height: 13,
                                width: 170,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                color: Colors.grey.shade50,
                                ),
                              ),
                              Container(
                                height: 13,
                                width: 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                color: indicatorColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
           ],
        ),
      ),
    );
  }
}
