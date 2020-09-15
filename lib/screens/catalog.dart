import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rsxb/config/colors.dart';
import 'package:rsxb/config/styles.dart';
import 'package:rsxb/screens/food.dart';
import 'package:rsxb/widget/filter_categoria.dart';

class Catalog extends StatefulWidget {
  Catalog({Key key}) : super(key: key);

  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> with SingleTickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    Tab(text: "Продукты"),
    Tab(text: "Фермеры"),
    Tab(text: "Агротуры")
  ];
  TabController _tabController;
  ScrollController _scrollViewController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              'Католог',
              style: AppStyle.appBar,
            ),
            floating: true,
            flexibleSpace:
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () =>
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
            ),
            // forceElevated: innerBoxIsScrolled,
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(160),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      color: Colors.white,
                      child: Align(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                              color: AppColors.myGrey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            child: TabBar(
                                unselectedLabelColor: Colors.black,
                                // indicatorSize: TabBarIndicatorSize.label,
                                indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: AppColors.green),
                                tabs: [
                                  Tab(
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Align(
                                        child: Text(
                                          'Продукты',
                                          style: AppStyle.tabbarGreen,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Align(
                                        child: Text(
                                          "Фермеры",
                                          style: AppStyle.tabbarGreen,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Align(
                                        child: Text(
                                          "Агротуры",
                                          style: AppStyle.tabbarGreen,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 56,
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                FilterCategoria(
                                  url: 'assets/sort.png',
                                  text: 'Сортировать',
                                ),
                                FilterCategoria(
                                  url: 'assets/sort.png',
                                  text: 'Сортировать',
                                ),
                                FilterCategoria(
                                  url: 'assets/sort.png',
                                  text: 'Сортировать',
                                ),
                                FilterCategoria(
                                  url: 'assets/sort.png',
                                  text: 'Сортировать',
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ),
          SliverFillRemaining(
            child: TabBarView(children: [
              Center(
                child: Container(
                  color: Colors.white,
                  child: Food(),
                ),
              ),
              Center(
                child: Container(
                  color: Colors.white,
                  child: Text(
                    "Gallery",
                    style: TextStyle(fontSize: 22, color: Colors.blue),
                  ),
                ),
              ),
              Center(
                child: Container(
                  color: Colors.white,
                  child: Text(
                    "Gallery",
                    style: TextStyle(fontSize: 22, color: Colors.blue),
                  ),
                ),
              ),
            ]),
          ),
        ],
      )
          //     NestedScrollView(
          //   floatHeaderSlivers: true,
          //   controller: _scrollViewController,
          //   headerSliverBuilder: (context, innerBoxIsScrolled) {
          //     return <Widget>[
          // SliverAppBar(
          //   title: Text(
          //     'Католог',
          //     style: AppStyle.appBar,
          //   ),
          //   floating: true,
          //   // pinned: true,
          //   backgroundColor: Colors.white,
          //   leading: IconButton(
          //     icon: Icon(Icons.arrow_back, color: Colors.black),
          //     onPressed: () =>
          //         SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
          //   ),
          //   forceElevated: innerBoxIsScrolled,
          //   bottom: PreferredSize(
          //       preferredSize: Size.fromHeight(160),
          //       child: Column(
          //         children: [
          //           Container(
          //             padding: EdgeInsets.only(top: 20),
          //             color: Colors.white,
          //             child: Align(
          //               child: Container(
          //                 margin: EdgeInsets.symmetric(horizontal: 16),
          //                 decoration: BoxDecoration(
          //                     color: AppColors.myGrey,
          //                     borderRadius:
          //                         BorderRadius.all(Radius.circular(50))),
          //                 child: Container(
          //                   padding: EdgeInsets.symmetric(
          //                       horizontal: 5, vertical: 5),
          //                   child: TabBar(
          //                       unselectedLabelColor: Colors.black,
          //                       // indicatorSize: TabBarIndicatorSize.label,
          //                       indicator: BoxDecoration(
          //                           borderRadius: BorderRadius.circular(40),
          //                           color: AppColors.green),
          //                       tabs: [
          //                         Tab(
          //                           child: Container(
          //                             height: 40,
          //                             decoration: BoxDecoration(
          //                               borderRadius:
          //                                   BorderRadius.circular(50),
          //                             ),
          //                             child: Align(
          //                               child: Text(
          //                                 'Продукты',
          //                                 style: AppStyle.tabbarGreen,
          //                               ),
          //                             ),
          //                           ),
          //                         ),
          //                         Tab(
          //                           child: Container(
          //                             height: 40,
          //                             decoration: BoxDecoration(
          //                               borderRadius:
          //                                   BorderRadius.circular(50),
          //                             ),
          //                             child: Align(
          //                               child: Text(
          //                                 "Фермеры",
          //                                 style: AppStyle.tabbarGreen,
          //                               ),
          //                             ),
          //                           ),
          //                         ),
          //                         Tab(
          //                           child: Container(
          //                             height: 40,
          //                             decoration: BoxDecoration(
          //                               borderRadius:
          //                                   BorderRadius.circular(50),
          //                             ),
          //                             child: Align(
          //                               child: Text(
          //                                 "Агротуры",
          //                                 style: AppStyle.tabbarGreen,
          //                               ),
          //                             ),
          //                           ),
          //                         ),
          //                       ]),
          //                 ),
          //               ),
          //             ),
          //           ),
          //           Container(
          //             color: Colors.white,
          //             child: Column(
          //               children: [
          //                 SizedBox(
          //                   height: 30,
          //                 ),
          //                 SizedBox(
          //                   height: 56,
          //                   child: ListView(
          //                     shrinkWrap: true,
          //                     scrollDirection: Axis.horizontal,
          //                     children: [
          //                       FilterCategoria(
          //                         url: 'assets/sort.png',
          //                         text: 'Сортировать',
          //                       ),
          //                       FilterCategoria(
          //                         url: 'assets/sort.png',
          //                         text: 'Сортировать',
          //                       ),
          //                       FilterCategoria(
          //                         url: 'assets/sort.png',
          //                         text: 'Сортировать',
          //                       ),
          //                       FilterCategoria(
          //                         url: 'assets/sort.png',
          //                         text: 'Сортировать',
          //                       )
          //                     ],
          //                   ),
          //                 )
          //               ],
          //             ),
          //           )
          //         ],
          //       )),
          // ),
          //   ];
          // },
          //   body: TabBarView(children: [
          //     Center(
          //       child: Container(
          //         color: Colors.white,
          //         child: Food(),
          //       ),
          //     ),
          //     Center(
          //       child: Container(
          //         color: Colors.white,
          //         child: Text(
          //           "Gallery",
          //           style: TextStyle(fontSize: 22, color: Colors.blue),
          //         ),
          //       ),
          //     ),
          //     Center(
          //       child: Container(
          //         color: Colors.white,
          //         child: Text(
          //           "Gallery",
          //           style: TextStyle(fontSize: 22, color: Colors.blue),
          //         ),
          //       ),
          //     ),
          //   ]),
          // )
          ),
    );
  }
}
