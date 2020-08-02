import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:showcaseview_flutter/categories.dart';
import 'package:showcaseview_flutter/category_list_item_widget.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Definir globalKey
  GlobalKey _one = GlobalKey();
  GlobalKey _two = GlobalKey();
  GlobalKey _three = GlobalKey();
  GlobalKey _four = GlobalKey();
  GlobalKey _five = GlobalKey();

  /*@override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        ShowCaseWidget.of(context)
            .startShowCase([_one, _two, _three, _four, _five]));
  }*/

  @override
  Widget build(BuildContext context) {
    SharedPreferences preferences;

    displayShowcase() async {
      preferences = await SharedPreferences.getInstance();
      bool showcaseVisibilityStatus = preferences.getBool("showShowcase");
      if (showcaseVisibilityStatus == null) {
        preferences.setBool("showShowcase", false).then((bool success) {
          if (success)
            print("Se escribió en showShowcase");
          else
            print("Ocurrio un problema");
        });
        return true;
      }
      return false;
    }

    displayShowcase().then((status) {
      if (status) {
        ShowCaseWidget.of(context)
            .startShowCase([_one, _two, _three, _four, _five]);
      }
    });

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Showcase(
                        key: _one,
                        child: Container(
                          child: Icon(Icons.menu),
                        ),
                        description: "Aqui se muestra el menú",
                      ),
                      Showcase(
                          key: _two,
                          child: Container(
                            child: Text("0"),
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.yellow[800],
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          title: "Contador",
                          description: "Revisa tu contador aquí",
                          showcaseBackgroundColor: Colors.yellow[100])
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Showcase.withWidget(
                      key: _three,
                      child: title(),
                      shapeBorder: CircleBorder(),
                      container: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.yellow[800]),
                            child: Center(
                              child: Icon(Icons.text_fields),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Aquí está el nombre de la app",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      height: 50,
                      width: 140),
                  SizedBox(
                    height: 30,
                  ),
                  Showcase(
                    key: _four,
                    description: "Aquí puedes buscar",
                    descTextStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.yellow[900]),
                    child: searchBox(),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Showcase(
                    key: _five,
                    child: categories(),
                    description: "Escoje una de las categorías",
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget title() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Mixture",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
          ),
          Text(
            "Todo lo que deseas en un solo lugar",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
          )
        ],
      ),
    );
  }

  Widget searchBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          Icons.search,
          color: Colors.black45,
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
                hintText: "Buscar ...",
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                hintStyle: TextStyle(color: Colors.black87),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red))),
          ),
        )
      ],
    );
  }

  Widget categories() {
    return Container(
      height: 185,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          for (var categoryItem in categoryList.categoryItems)
            Builder(
              builder: (context) {
                return CategoryListItem(
                  category: categoryItem,
                );
              },
            )
        ],
      ),
    );
  }
}
