import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

//////페이지 이동을 위한 상수 및 함수//////////////////////////////////////////////
const String HOMESUB = "homesub";
const String CHATSUB = "chatsub";
const String FLOATSUB = "floatsub";
const String CATEGORYSUB = "categorysub";
const String ALERTSUB = "alertsub";
const String SEARCHSUB = "searchsub";

Function gotoSub =
    (BuildContext context, String cls, [String? selectedLocation]) {
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
        MaterialPageRoute(
            builder: (context) =>
                SearchSub(selectedLocation: selectedLocation)),
      );
      break;
    default:
      break;
  }
};
////////////////////////////////////////////////////////////////////////////////

var blackText = const TextStyle(color: Colors.black);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentBottomIndex = 0;
  String? _selectedLocation = '양호동';

  final List<String> _availableLocations = [
    '양호동',
    '서울',
    '부산',
    '대구',
    '인천',
    // 다른 지역을 추가할 수 있습니다.
  ];

  void _tapBottomTab(int index) {
    setState(() {
      _currentBottomIndex = index;
    });
  }

  final List<Widget> _tabs = [
    HomeTabContent(),
    ChatTabContent(),
    ProfileTabContent(),
  ];

  @override
  Widget build(BuildContext context) {
    //위젯 생성 함수
    List<PopupMenuEntry<dynamic>> buildPopupMenu(BuildContext context) {
      List<PopupMenuEntry<dynamic>> popUpList = [];
      for (var temp in _availableLocations) {
        popUpList.add(PopupMenuItem(value: temp, child: Text(temp)));
      }
      return popUpList;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: PopupMenuButton(
          itemBuilder: buildPopupMenu,
          initialValue: _selectedLocation,
          onSelected: (value) {
            setState(() => _selectedLocation = value);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(_selectedLocation!, style: blackText),
              const Icon(Icons.keyboard_arrow_down, color: Colors.black),
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
              gotoSub(context, SEARCHSUB, _selectedLocation);
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              gotoSub(context, ALERTSUB);
            },
          ),
        ],
      ),
      body: _tabs[_currentBottomIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentBottomIndex,
        onTap: _tapBottomTab,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: '채팅'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '내 정보'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class HomeTabContent extends StatefulWidget {
  const HomeTabContent({super.key});

  @override
  State<HomeTabContent> createState() => _HomeTabContentState();
}

class _HomeTabContentState extends State<HomeTabContent> {
  //더미데이터
  List items = ["a", "b"];

  @override
  Widget build(BuildContext context) {
    //위젯 빌드 함수
    Widget? buildListView(context, index) {
      return ListTile(title: Text(items[index]));
    }

    return ListView.separated(
      itemCount: items.length,
      itemBuilder: buildListView,
      separatorBuilder: (context, index) {
        return const Divider(color: Colors.black);
      },
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
    TextEditingController _controller =
        TextEditingController(text: '$selectedLocation 근처에서 검색');

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
