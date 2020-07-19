import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        ShowCaseWidget.of(context)
            .startShowCase([_one, _two, _three, _four, _five]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Showcase(
                          key: _one, 
                          child: Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Icon(Icons.menu)
                            ), 
                          description: "Aqui se muestra el menú"
                        ),
                        Showcase(
                          key: _two, 
                          child: Container(
                            margin: EdgeInsets.only(right: 30),
                            child: Text("0"),
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.yellow[800],
                              borderRadius: BorderRadius.circular(50)
                            ),
                          ), 
                          title: "Contador",
                          description: "Revisa tu contador de vistas",
                          showcaseBackgroundColor: Colors.yellow[100],
                          descTextStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.yellowAccent[900]
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Showcase(
                    key: _three,
                    description: "Aqui está el nombre de la app",
                    child: title(),
                  ),
                  SizedBox(height: 30,),
                  Showcase(
                    key: _four,
                    description: "Aqui haces búsquedas",
                    child: searchBox(),
                  ),
                  SizedBox(height: 30,),
                  Showcase(
                    key: _five, 
                    child: categories(), 
                    description: "Escoge de las categorias"
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Películas", 
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30
              ),
            ),
            Text(
              "Mis favoritas",
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 25
              ),
            )
          ],
        )
      ],
    );
  }

  Widget searchBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(Icons.search, color: Colors.black45,),
        SizedBox(width: 20,),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Buscar ... ",
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              hintStyle: TextStyle(color: Colors.black87),
              border: UnderlineInputBorder(borderSide: BorderSide(
                color: Colors.red
              ))
            ),
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
        for (var foodItem in fooditemList.foodItems)
                Builder(
                  builder: (context) {
                    return CategoryListItem(category: foodItem);
                  },
                ),
      ],
    ),
  );
}
}
