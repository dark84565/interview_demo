import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/foundation.dart';
import 'package:interview_demo/CartPage.dart';
import 'package:interview_demo/Database/Database.dart';
import 'package:interview_demo/Models/Stores.dart';
import 'package:interview_demo/StorePage.dart';
import 'package:interview_demo/main.dart';
import 'package:location/location.dart';
import 'package:sqflite/sqflite.dart';
import 'package:interview_demo/Models/Meals.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseHelper storesDatabase = DatabaseHelper('tableName', 0);
  List<Stores> storesList;
  int count = 0;

  PageController pageController;
  GoogleMapController mapController;
  int _currentPageIndex = 0;
  LatLng _center = LatLng(25.021323, 121.530215);
  Location _location = Location();
  LocationData _locationData;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void getLocationData() async {
    _location.getLocation().then((value) {
      _locationData = value;
    });
  }

  @override
  void initState() {
    pageController = new PageController(
      initialPage: 0,
      keepPage: true,
    );
    getLocationData();
    // _location.onLocationChanged.listen((event) {
    //   getLocationData();
    // });

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void updateListView() {
    final Future<Database> dbFuture = storesDatabase.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Stores>> storesFuture = storesDatabase.getStoresList();
      storesFuture.then((storesList) {
        setState(() {
          this.storesList = storesList;
          this.count = storesList.length;
        });
      });
    });
  }

  List<String> menuTitle = [
    '??????',
    '????????????',
    '????????????',
    '????????????',
    '??????',
    '????????????',
    '????????????',
    '????????????',
  ];
  List<String> menuPicture = [
    'assets/menu_picture/discount.png',
    'assets/menu_picture/grocery.png',
    'assets/menu_picture/makeup.png',
    'assets/menu_picture/market.png',
    'assets/menu_picture/award.png',
    'assets/menu_picture/taiwanese_food.png',
    'assets/menu_picture/bubbletea.png',
    'assets/menu_picture/american_food.png',
  ];

  List<String> favoriteStore = [
    '???????????????',
    '???????????? ??????????????????',
    '???????????????',
  ];

  List<String> favoriteStorePicture = [
    'assets/favoritestore_picture/???????????????.jpg',
    'assets/favoritestore_picture/????????????.jpg',
    'assets/favoritestore_picture/???????????????.jpg',
  ];

  List<double> favoriteStoreScore = [
    4.8,
    4.6,
    4.7,
  ];

  List<String> favoriteStorePriceAndTime = [
    '??40TWD ????????15-25??????',
    '??25TWD ????????15-25??????',
    '??40TWD ????????25-35??????',
  ];

  List<String> carousel = [
    'assets/carousel/carousel1.png',
    'assets/carousel/carousel2.png',
    'assets/carousel/carousel3.png',
    'assets/carousel/carousel4.png',
    'assets/carousel/carousel5.png',
  ];

  List<String> recommended = [
    '????????? ?????????',
    'STARBUCKS????????? ????????????',
    '????????????',
    '???????????? ?????????',
    '??????????????? ?????????',
  ];

  List<String> recommendedPicture = [
    'assets/recommended/?????????.jpg',
    'assets/recommended/?????????.jpg',
    'assets/recommended/????????????.jpg',
    'assets/recommended/????????????.jpg',
    'assets/recommended/???????????????.jpg',
  ];

  List<double> recommendedScore = [4.9, 4.9, 4.9, 4.9, 4.8];

  List<String> recommendedPriceAndTim = [
    '??25TWD ????????10-20??????',
    '??40TWD ????????15-25??????',
    '??25TWD ????????15-25??????',
    '??25TWD ????????15-25??????',
    '??25TWD ????????30-40??????',
  ];

  void setData() {
    DatabaseHelper mealsDatabase1 = DatabaseHelper('???????????????', 1);

    Meals meals1 = new Meals('', 0, '', '', '');

    meals1.title = '????????????';
    meals1.price = 70;
    meals1.description = '????????????????????????';
    meals1.imageAsset = 'assets/??????/???????????????/????????????.jpg';
    meals1.addingMealsTable = '';
    mealsDatabase1.insertData(null, meals1, null, null);

    Meals meals2 = new Meals('', 0, '', '', '');

    meals2.title = '?????????';
    meals2.price = 30;
    meals2.description = '????????????????????????';
    meals2.imageAsset = 'assets/??????/???????????????/?????????.jpg';
    meals2.addingMealsTable = '';
    mealsDatabase1.insertData(null, meals2, null, null);

    DatabaseHelper mealsDatabase2 = DatabaseHelper('?????????', 1);

    Meals meals3 = new Meals('', 0, '', '', '');

    meals3.title = '????????????';
    meals3.price = 40;
    meals3.description = '???????????????';
    meals3.imageAsset = 'assets/??????/?????????/????????????.png';
    meals3.addingMealsTable = '';
    mealsDatabase2.insertData(null, meals3, null, null);

    Meals meals4 = new Meals('', 0, '', '', '');

    meals4.title = '????????????';
    meals4.price = 60;
    meals4.description = '?????????????????????????????????????????????';
    meals4.imageAsset = 'assets/??????/?????????/????????????.png';
    meals4.addingMealsTable = '';
    mealsDatabase2.insertData(null, meals4, null, null);

    Meals meals5 = new Meals('', 0, '', '', '');

    meals5.title = '????????????';
    meals5.price = 45;
    meals5.description = '??????????????????????????????';
    meals5.imageAsset = 'assets/??????/?????????/????????????.png';
    meals5.addingMealsTable = '';
    mealsDatabase2.insertData(null, meals5, null, null);

    Meals meals6 = new Meals('', 0, '', '', '');

    meals6.title = '????????????';
    meals6.price = 40;
    meals6.description = '????????????????????? x ????????????????????????????????????????????????';
    meals6.imageAsset = 'assets/??????/?????????/????????????.png';
    meals6.addingMealsTable = '';
    mealsDatabase2.insertData(null, meals6, null, null);

    Meals meals7 = new Meals('', 0, '', '', '');

    meals7.title = '?????????';
    meals7.price = 25;
    meals7.description = '????????????????????????????????????????????????';
    meals7.imageAsset = 'assets/??????/?????????/?????????.png';
    meals7.addingMealsTable = '';
    mealsDatabase2.insertData(null, meals7, null, null);

    DatabaseHelper storesDatabase = DatabaseHelper('tableName', 0);

    Stores stores1 = new Stores('', '', 0, 0, '', '');

    stores1.title = '???????????????';
    stores1.description = '?????????????????????';
    stores1.score = 4.8;
    stores1.shippingFee = 40;
    stores1.imageAsset = 'assets/??????/???????????????/???????????????.png';
    stores1.mealsTable = '???????????????';
    storesDatabase.insertData(stores1, null, null, null);

    Stores stores2 = new Stores('', '', 0, 0, '', '');

    stores2.title = '?????????';
    stores2.description = '?????????????????????';
    stores2.score = 4.9;
    stores2.shippingFee = 25;
    stores2.imageAsset = 'assets/??????/?????????/?????????.png';
    stores2.mealsTable = '?????????';
    storesDatabase.insertData(stores2, null, null, null);
  }

  @override
  Widget build(BuildContext context) {
    if (storesList == null) {
      storesList = List<Stores>();
      updateListView();
    }
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                toolbarHeight: 0,
                backgroundColor: Colors.white,
                collapsedHeight: 50.0,
                expandedHeight: 130.0,
                floating: true,
                pinned: true,
                snap: true,
                stretch: true,
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: [StretchMode.zoomBackground],
                  collapseMode: CollapseMode.pin,
                  background: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(flex: 1, child: SizedBox()),
                        Flexible(
                          flex: 2,
                          child: TabBar(
                              unselectedLabelColor: Colors.black,
                              indicatorSize: TabBarIndicatorSize.label,
                              labelColor: Colors.white,
                              indicatorWeight: 0,
                              indicatorPadding: EdgeInsets.all(0),
                              labelStyle: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w600),
                              indicator: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(50)),
                              tabs: [
                                Tab(
                                  child: Container(
                                    width: 75.0,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text('??????'),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Container(
                                    width: 75.0,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text('??????'),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                        Flexible(flex: 1, child: SizedBox()),
                      ],
                    ),
                  ),
                  title: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 30.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                Text(
                                  '???????????? ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  size: 12.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: IconButton(
                              icon: Icon(
                                Icons.filter_alt_outlined,
                                size: 25,
                              ),
                              onPressed: () {
                                setState(() {
                                  setData();
                                  updateListView();
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(), //??????????????????
            children: [
              delivery(),
              takeOut(),
            ],
          ),
        ),
        floatingActionButton: FlatButton(
          color: Colors.black,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.8,
            height: 50.0,
            child: Text(
              '??? ??? ???',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartPage()));
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Widget delivery() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            height: 75.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: menuTitle.length,
                itemBuilder: (context, index) {
                  return FlatButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Image.asset(menuPicture[index],
                            width: 40.0, height: 40.0, fit: BoxFit.cover),
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                            menuTitle[index],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10.0),
            child: Text(
              '??????????????????',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            height: 230.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: favoriteStore.length,
                itemBuilder: (context, index) {
                  return FlatButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                      width: 320.0,
                      height: 220.0,
                      child: Column(
                        children: [
                          Image.asset(favoriteStorePicture[index],
                              width: 300.0,
                              height: 160.0,
                              fit: BoxFit.fitWidth),
                          Container(
                            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                            width: 300.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 270,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        favoriteStore[index],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      Text(
                                        favoriteStorePriceAndTime[index],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  child: Text(
                                    favoriteStoreScore[index].toString(),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 180,
            child: Stack(
              children: [
                PageView.builder(
                  physics: BouncingScrollPhysics(),
                  onPageChanged: (int index) {
                    setState(() {
                      _currentPageIndex = index;
                    });
                  },
                  controller: pageController,
                  itemCount: carousel.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        carousel[index],
                        fit: BoxFit.fitHeight,
                      ),
                    );
                  },
                ),
                Positioned(
                  bottom: 10.0,
                  left: 0,
                  right: 0,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(carousel.length, (index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          width: 5.0,
                          height: 5.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentPageIndex == index
                                  ? Colors.white
                                  : Colors.grey),
                        );
                      }).toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return FlatButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StorePage(storesList[index])));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: Column(
                  children: [
                    Image.asset(storesList[index].imageAsset,
                        width: MediaQuery.of(context).size.width - 20.0,
                        height: 180.0,
                        fit: BoxFit.fitWidth),
                    Container(
                      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                      width: MediaQuery.of(context).size.width - 20.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width - 20.0 - 30.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  storesList[index].title,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  storesList[index].description,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 30.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Text(
                              storesList[index].score.toString(),
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }, childCount: storesList.length),
        )
      ],
    );
  }

  Widget takeOut() {
    return Stack(
      alignment: Alignment.center,
      children: [
        GoogleMap(
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          onMapCreated: _onMapCreated,
          markers: {wooTea, saltedChicken},
          mapType: MapType.normal,
          compassEnabled: false,
          //?????????
          initialCameraPosition: CameraPosition(
              target: _center, zoom: 16.0, bearing: 30.0, tilt: 0),
          // ???????????? ???????????? ???????????? ????????????
          gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
            new Factory<OneSequenceGestureRecognizer>(
              () => new EagerGestureRecognizer(),
            ),
          ].toSet(), //???googleMap?????????????????????????????????
        ),
        Positioned(
          top: 10.0,
          child: MaterialButton(
            elevation: 10.0,
            color: Colors.white,
            height: 45.0,
            shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: () {},
            child: Text(
              '????????????',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Positioned(
          top: 10.0,
          right: 0.0,
          child: MaterialButton(
            elevation: 10.0,
            color: Colors.white,
            height: 45.0,
            shape: CircleBorder(
              side: BorderSide.none,
            ),
            onPressed: () {
              setState(() {
                debugPrint(_locationData.latitude.toString());
                debugPrint(_locationData.longitude.toString());

                _center =
                    LatLng(_locationData.latitude, _locationData.longitude);
              });
            },
            child: Icon(
              Icons.location_on_rounded,
              color: Colors.black,
              size: 28.0,
            ),
          ),
        )
      ],
    );
  }

  Marker wooTea = Marker(
    markerId: MarkerId('wooTea'),
    position: LatLng(25.021744, 121.528002),
    infoWindow: InfoWindow(title: '?????????WooTEA(?????????)'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
  );

  Marker saltedChicken = Marker(
    markerId: MarkerId('saltedChicken'),
    position: LatLng(25.024750, 121.529032),
    infoWindow: InfoWindow(title: '???????????????'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
  );
}
