import 'package:cash_book/utils/colorConstant.dart';
import 'package:cash_book/views/homeScreen/widgets/TransactionDetailCard.dart';
import 'package:cash_book/views/homeScreen/widgets/categoryContainer.dart';
import 'package:cash_book/views/homeScreen/widgets/drawerWidget.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = '';
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void selectCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.Themecolor,
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer(); // Open the drawer
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            )),
        title: const Text(
          'Cash Book',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: ColorConstants.Themecolor,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ))
        ],
      ),
      drawer: DrawerWidget(),
      body: Column(
        children: [
          Expanded(
              child: Stack(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                width: double.infinity,
                color: Colors.grey[100],
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () => selectCategory('All'),
                            child: CategoryContainer(
                              title: 'All',
                              isSelected: selectedCategory == 'All',
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () => selectCategory('Daily'),
                            child: CategoryContainer(
                              title: 'Daily',
                              isSelected: selectedCategory == 'Daily',
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () => selectCategory('Weekly'),
                            child: CategoryContainer(
                              title: 'Weekly',
                              isSelected: selectedCategory == 'Weekly',
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () => selectCategory('Yearly'),
                            child: CategoryContainer(
                              title: 'Yearly',
                              isSelected: selectedCategory == 'Yearly',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 30,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Text(
                                  'Date',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                )),
                            Expanded(
                                child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Cash In',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            )),
                            Expanded(
                                child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Cash Out",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) => const DetailCard(
                                  day: "Monday",
                                  date: "12-08-2024",
                                  time: "05:00 PM",
                                  cashIn: "0000",
                                  cashOut: "0000"),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 10,
                                  ),
                              itemCount: 2))
                    ]),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                          height: 50,
                          child: const Center(
                            child: Text(
                              "Cash In",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                          height: 50,
                          child: const Center(
                            child: Text(
                              "Cash Out",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Total Cash In",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "     :",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '0000',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Total Cash Out",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "     :",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '0000',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Balance",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "     :",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '0000',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
