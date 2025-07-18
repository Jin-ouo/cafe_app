import 'package:flutter/material.dart';
import 'dumi_data.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('메뉴', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          // 스크롤 가능한 컨텐츠 (menuNav 높이만큼 위쪽 여백 추가)
          Positioned(
            top: 50, // menuNav 높이만큼 아래로 내림
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 1.0,
                ),
                clipBehavior: Clip.none,
                itemCount: index == 0 ? 20 : 10,
                itemBuilder: (context, i) {
                  final list = index == 0 ? dummyCoffee : dummyCake;
                  return _menuItem(
                    list[i]['image'],
                    list[i]['name'],
                    list[i]['price'],
                  );
                },
              ),
            ),
          ),
          // menuNav를 최상위에 고정
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: menuNav(),
          ),
        ],
      ),
    );
  }

  Widget _menuItem(String img, String name, int price) {
    return Container(
      height: 250,
      width: 200,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
            color: Colors.purple.withOpacity(0.3),
            blurRadius: 3,
          spreadRadius: 2,
          offset: Offset(0, 0),
        ),
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(height: 10,),
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(img),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 10,),
          Text(name),
          SizedBox(height: 5,),
          Text('$price원', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
        ],
      ),
    );
  }
  Widget menuNav(){
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(0, 2),
            blurRadius: 3,
          )
        ]
      ),
      child: Container(
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: index == 0 ? Colors.purple : Colors.white, width: 4),
                ),
              ),
              child: TextButton(
                // 클릭 시 회색 효과 제거
                  style: TextButton.styleFrom(
                    overlayColor: Colors.transparent,
                  ),
                  onPressed: (){
                    setState(() {
                      index = 0;
                    });
                  },
                  child: Text('커피/음료', style: TextStyle(color: index == 0 ? Colors.purple : Colors.black,),)
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: index == 1 ? Colors.purple : Colors.white, width: 4))
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  overlayColor: Colors.transparent,
                ),
                  onPressed: (){
                    setState(() {
                      index = 1;
                    });
                  },
                  child: Text('케이크', style: TextStyle(color: index == 1 ? Colors.purple : Colors.black),)
              ),
            )

          ],
        ),
      ),
    );
  }
}
