import 'package:flutter/material.dart';
import 'package:its_quran/Provider/home_provider.dart';
import 'package:its_quran/services/articles_api.dart';
import 'package:its_quran/services/audios_api.dart';
import 'package:its_quran/services/book_api.dart';
import 'package:its_quran/services/videos_api.dart';
import 'package:its_quran/widgets/CategoryHeaderRow.dart';
import 'package:its_quran/widgets/HomeScreenSection.dart';
import 'package:its_quran/widgets/appDrawer.dart';
import 'package:its_quran/widgets/searchButton.dart';
import 'package:provider/provider.dart';



class HomeScreen extends StatelessWidget {
final  Articles articles = Articles();
 final GetBooks books = GetBooks();
 final GetVideos videos = GetVideos();
 final GetAudios audios = GetAudios();

  final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [SearchButon()],
        leading: Builder(
          builder: (context) => Tooltip(
            message: 'قائمة التنقل',
            child: InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
                print('drawer clicked');
              },
              child: Image.asset("assets/menu.png"),
            ),
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .06,
              decoration: BoxDecoration(
                image: DecorationImage(
                  scale: 2,
                  image: AssetImage("assets/logo.png"),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5.0),
        child: Container(
          child: Column(
            children: [
//               FutureBuilder(
//                future:articles.getData( pageNumber:"2", perPage: "30", author: "1") ,
//                 builder: (c,snapshot){
//                  if(!snapshot.hasData){return Center(child: CircularProgressIndicator(color: Colors.yellow,));}
//                  else
//                  return HomeScreenSection(
// list: snapshot.data,
//                    itemType: ItemType.article,
//                    categoryHeaderRow: CategoryHeaderRow(
//
//                      title: 'مناشط الشيخ',
//                      caption: 'جميع مناشط الشيخ المضافة',
//                    ),
//                  );
//                 },
//               ),
              FutureBuilder(
                future:
                    videos.getData(pageNumber: "2", perPage: Provider.of<HomeProvider>(context).videosPerPage, author: "1"),
                builder: (c, snapShot) {
                  if (!snapShot.hasData) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: Colors.yellow,
                    ));
                  } else {
                    return HomeScreenSection(
                      list: snapShot.data,
                      itemType: ItemType.video,
                      categoryHeaderRow: CategoryHeaderRow(
                        type: "videos",
                        title: 'فيديوهات',
                        caption: 'جميع المحاضرات المرتبة',
                      ),
                    );
                  }
                },
              ),

              FutureBuilder(
                future:
                    audios.getData(pageNumber: "8", perPage: Provider.of<HomeProvider>(context).audiosPrePage, author: "1"),
                builder: (c, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: Colors.yellow,
                    ));
                  } else {
                    print(snapshot.data[0]);

                    return HomeScreenSection(
                      list: snapshot.data,
                      itemType: ItemType.audio,
                      categoryHeaderRow: CategoryHeaderRow(
                        type: "audios",
                        title: 'الصوتيات',
                        caption: 'جميع المقاطع الصوتية',
                      ),
                    );
                  }
                },
              ),

              FutureBuilder(
                future:
                    books.getData(pageNumber: "2", perPage: Provider.of<HomeProvider>(context).booksPrePage, author: "1"),
                builder: (c, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: Colors.yellow,
                    ));
                  } else {
                    return HomeScreenSection(
                      list: snapshot.data,
                      itemType: ItemType.book,
                      categoryHeaderRow: CategoryHeaderRow(
                        type: "books",
                        title: 'الكتب',
                        caption: 'الكتب المضافة مؤخراً',
                      ),
                    );
                  }
                },
              ),

              FutureBuilder(
                future: articles.getData(
                    pageNumber: "2", perPage: Provider.of<HomeProvider>(context).articlesPerPage, author: "1"),
                builder: (c, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.yellow,
                      ),
                    );
                  } else {
                    return HomeScreenSection(
                      list: snapshot.data,
                      categoryHeaderRow: CategoryHeaderRow(
                        type: "articles",
                        title: 'المقالات',
                        caption: 'جميع المقالات المضافة',
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
