import 'package:flutter/material.dart';
import 'dumi_data.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  final Function(int) onTabChange;

  const HomeScreen({super.key, required this.onTabChange});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  int coffeeIndex = 0;

  @override
  void initState() {
    super.initState();
    coffeeIndex = Random().nextInt(20);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '냥카페',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
      ),


      body: Column(
        children: [
          // 가게 위 천막
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/home_img0.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // 가게 앞면
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            // 구분 선
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
            ),
            // 오늘의 추천 메뉴
            child: Row(
              children: [
                // 칠판
                Container(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    height: 100,
                    width: 150,
                    color: Color(0xFF003500),
                    // 추천메뉴 글자
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Text(
                          '오늘의 추천 메뉴',
                          style: TextStyle(
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(dummyCoffee[coffeeIndex]['name'], style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                // 고양이 그림
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      // 고양이
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            left: BorderSide(
                              color: Color(0xFF5C0000),
                              width: 5,
                            ),
                            top: BorderSide(color: Color(0xFF5C0000), width: 5),
                            right: BorderSide(
                              color: Color(0xFF5C0000),
                              width: 5,
                            ),
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/nyang.png'),
                            fit: BoxFit.contain,
                            alignment: Alignment.bottomCenter,
                          ),
                        ),
                        height: 120,
                        width: 170,
                      ),
                      Container(
                        height: 20,
                        width: 200,
                        color: Color(0xFF5C0000),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //   가게 안
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //   왼쪽 테이블
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.white,
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 10,),
                            // 메뉴 보러가기
                            TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                      side: BorderSide(color: Colors.red, width: 2),
                                    )
                                ),
                                onPressed: () => widget.onTabChange(1),
                                child: Text('메뉴 보러가기 >>',style: TextStyle(fontWeight: FontWeight.bold),)
                            ),
                            // 테이블 3개
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/home_img1.png'),
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/home_img1.png'),
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/home_img1.png'),
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //   오른쪽 길
                  Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 20,
                          right: 50,
                          child: Container(
                            height:MediaQuery.of(context).size.height,
                            color: Colors.red, // 여기로 옮김
                          ),
                        ),

                        Positioned(
                          top: 0,
                          left: 23,
                          right: 53,
                          child: Container(
                            height:MediaQuery.of(context).size.height,
                            color: Colors.yellow, // 여기로 옮김
                          ),
                        ),

                        Positioned(
                          top: 0,
                          left: 26,
                          right: 56,
                          child: Container(
                            height:MediaQuery.of(context).size.height,
                            color: Colors.red, // 여기로 옮김
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
