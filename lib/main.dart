import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//////페이지 이동을 위한 상수 및 함수//////////////////////////////////////////////
const String HOMESUB = "homesub";
const String CHATSUB = "chatsub";
const String FLOATSUB = "floatsub";
const String CATEGORYSUB = "categorysub";
const String ALERTSUB = "alertsub";
const String SEARCHSUB = "searchsub";


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulPage(),
    );
  }
}

class MyStatefulPage extends StatefulWidget {
  const MyStatefulPage({super.key});

  @override
  _MyStatefulPageState createState() => _MyStatefulPageState();
}

class _MyStatefulPageState extends State<MyStatefulPage> {
  int _currentIndex = 0;
  String? selectedLocation = '양호동';

  final List<String> availableLocations = [
    '양호동',
    '서울',
    '부산',
    '대구',
    '인천',
    // 다른 지역을 추가할 수 있습니다.
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _tabs = [
    const HomeTabContent(),
    const ChatTabContent(),
    const ProfileTabContent(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: GestureDetector(
          onTap: () {
            _showLocationMenu(context);
          },
          child: Row(
            children: [
              Text(
                selectedLocation!,
                style: const TextStyle(color: Colors.black),
              ),
              const Icon(
                Icons.keyboard_arrow_up,
                color: Colors.black,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              // 목록 버튼을 눌렀을 때 수행할 동작을 추가
            },
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              gotoSub(context,SEARCHSUB,selectedLocation);
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              gotoSub(context,ALERTSUB);
            },
          ),
        ],
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '채팅',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '내 정보',
          ),
        ],
      ),
    );
  }

  void _showLocationMenu(BuildContext context) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy + kToolbarHeight + 5.0, // 아래에 여백 추가
        offset.dx + renderBox.size.width,
        offset.dy + kToolbarHeight + 5.0 + renderBox.size.height, // 아래에 여백 추가
      ),
      items: availableLocations.map((location) {
        return PopupMenuItem<String>(
          value: location,
          child: Text(location),
        );
      }).toList(),
    ).then((location) {
      if (location != null) {
        setState(() {
          selectedLocation = location;
        });
      }
    });
  }
}

Function gotoSub = (BuildContext context, String cls, [String? selectedLocation]) {
  switch (cls) {
    // case HOMESUB:
    //   Navigator.push(context,
    //       MaterialPageRoute(builder: (context) => const HomePageSub()));
    //   break;
    // case CHATSUB:
    //   Navigator.push(context,
    //       MaterialPageRoute(builder: (context) => const ChatPageSub()));
    //   break;
    // case FLOATSUB:
    //   Navigator.push(context,
    //       MaterialPageRoute(builder: (context) => const FloatingSub()));
    //   break;
    // case CATEGORYSUB:
    //   Navigator.push(context,
    //       MaterialPageRoute(builder: (context) => const CategorySub()));
    //   break;
    case ALERTSUB:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AlertSub()));
      break;
    case SEARCHSUB:
       Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchSub(selectedLocation: selectedLocation)),
              );
      break;
    default:
      break;
  }
};


class HomeTabContent extends StatelessWidget {
  const HomeTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('홈 탭 내용'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // FAB를 눌렀을 때 수행할 동작을 여기에 추가하세요.
          // 예를 들면, 새로운 작업을 추가하거나 화면을 열 수 있습니다.
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.endFloat, // FAB 위치 설정
    );
  }
}

class ChatTabContent extends StatelessWidget {
  const ChatTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('챗 탭 내용'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // FAB를 눌렀을 때 수행할 동작을 여기에 추가하세요.
          // 예를 들면, 새로운 작업을 추가하거나 화면을 열 수 있습니다.
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.endFloat, // FAB 위치 설정
    );
  }
}

class ProfileTabContent extends StatelessWidget {
  const ProfileTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('프로필 탭 내용'),
    );
  }
}

class SearchSub extends StatelessWidget {
  final String? selectedLocation;
   const SearchSub({Key? key, required this.selectedLocation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    TextEditingController _controller = TextEditingController(text: '$selectedLocation 근처에서 검색');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
        title: TextField(
          controller: _controller,
          onChanged: (value) {
            // 검색 로직을 여기에 구현합니다.
          },
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ),
      ),

    );
  }
}


class AlertSub extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0.0,
          title: const Text(
            '알림',
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // 편집 버튼을 눌렀을 때 수행할 동작을 추가
              },
              child: const Text(
                '편집',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
          bottom: const TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(text: '활동 알림'),
              Tab(text: '키워드 알림'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('활동 알림 내용')),
            Center(child: Text('키워드 알림 내용')),
          ],
        ),
      ),
    );
  }
}
