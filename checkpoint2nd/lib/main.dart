import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// group member
// 1. Niti Kostuao 63070197
// 2. Pongsathon Tangkanakol 63070201
// 3. Pascal
// 4. Snoopy

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Poppins',
          textTheme: TextTheme(
              bodyText2: TextStyle(
            color: Colors.white,
          )),
          iconTheme: const IconThemeData(color: Colors.white)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  List<String> style_list = ['Relax', 'Energize', 'Workout', 'Common', 'Focus'];
  List<String> playlist_header = [
    'Mixed for you',
    'From your library',
    'From community'
  ];
  // music card widget
  Widget card() {
    return Padding(
      padding: EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () {
          debugPrint('Card clik');
        },
        child: Container(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5), // Image border
                child: SizedBox.fromSize(
                  size: Size.fromRadius(48), // Image radius
                  child: Image.network('https://picsum.photos/seed/244/600',
                      fit: BoxFit.cover),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(5),
                  child: SizedBox(
                    width: 100,
                    height: 30,
                    child: Text(
                      'Music name',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  // music banner for top songs
  Widget small_music_banner(int counter) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () => debugPrint('Banner click'),
        child: Container(
          width: 300,
          height: 50,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                'https://picsum.photos/seed/386/600',
                width: 55,
                height: 55,
              ),
              VerticalDivider(
                width: 10,
                thickness: 0,
                indent: 0,
                endIndent: 0,
              ),
              Text('$counter'),
              VerticalDivider(),
              SizedBox(
                width: 180,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Music name',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Artist name',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => debugPrint('3 dot click'),
                child: Icon(Icons.more_vert),
              )
              
            ],
          ),
        ),
      ),
    );
  }

  // more button
  Widget more_button() {
    return Container(
      width: 72,
      height: 25,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            primary: Color.fromARGB(255, 255, 255, 255),
            side: BorderSide(
              color: Color.fromARGB(62, 99, 92, 92),
            ),
            backgroundColor: Color.fromARGB(20, 245, 245, 245),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(90)))),
        onPressed: () {
          debugPrint('more click');
        },
        child: Text('more'),
      ),
    );
  }

  // one line Track
  Widget one_line_playTrack() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          Row(
            // generate card
            children: [
              for (int x = 0; x < 10; x++)
                // card
                card()
            ],
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // top bar
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(
          Icons.music_note,
          size: 50,
        ),
        titleSpacing: 0,
        title: Text(
          'Music',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  child: Icon(
                    Icons.airplay_sharp,
                    size: 25,
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  child: Icon(
                    Icons.search,
                    size: 30,
                  ),
                ),
                Container(
                    width: 30,
                    height: 30,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Image.network(
                      'https://picsum.photos/seed/263/600',
                      fit: BoxFit.cover,
                    ))
              ],
            ),
          )
        ],
      ),
      // app body
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // style list
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    for (var style_name in style_list)
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              primary: Color.fromARGB(255, 255, 255, 255),
                              side: BorderSide(
                                color: Color.fromARGB(62, 99, 92, 92),
                              ),
                              backgroundColor:
                                  Color.fromARGB(20, 245, 245, 245),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)))),
                          onPressed: () {
                            debugPrint('$style_name');
                          },
                          child: Text('$style_name'),
                        ),
                      )
                  ],
                ),
              ),
              // Main content
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // name and two line playlist
                          Container(
                            child: Column(children: [
                              Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        children: [
                                          // picture
                                          Container(
                                            width: 40,
                                            height: 40,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              'https://picsum.photos/seed/199/600',
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    // name and topic
                                    Expanded(
                                        flex: 5,
                                        child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    'Einzberz',
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 24.0,
                                                      color: Color.fromARGB(
                                                          255, 162, 162, 162),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    'Listen again',
                                                    style: TextStyle(
                                                        fontSize: 30.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ],
                                            ))),
                                    // more button
                                    more_button()
                                  ],
                                ),
                              ),
                              // two line playlist
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Column(
                                  children: [
                                    // for create multiple line
                                    for (int i = 0; i < 2; i++)
                                      Row(
                                        // generate 10 card per row
                                        children: [one_line_playTrack()],
                                      ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                          // one line playlist
                          for (var playlist_header_name in playlist_header)
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // name and topic
                                        Text(
                                          "$playlist_header_name",
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // more button
                                        more_button()
                                      ],
                                    ),
                                  ),
                                  one_line_playTrack()
                                ],
                              ),
                            ),
                          // top song
                          Container(
                            child: Column(children: [
                              Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  // Topic and more button
                                  children: [
                                    // Topic
                                    Text(
                                      "Top songs",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    // more button
                                    more_button()
                                  ],
                                ),
                              ),
                              // top songs content
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    for (int x = 1, counter = 1; x <= 3; x++)
                                      Column(
                                        children: [
                                          // generate small music banner
                                          for (int y = 0; y < 4; y++, counter++)
                                            small_music_banner(counter)
                                        ],
                                      )
                                  ],
                                ),
                              )
                            ]),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // bot nav bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.library_music,
            ),
            label: 'LIbrary',
          ),
        ],
      ),
    );
  }
}
