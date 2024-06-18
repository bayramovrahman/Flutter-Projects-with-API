import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:basic_api_from_local/model/users_model.dart';
import 'package:basic_api_from_local/user_detail.dart';

class UsersWidget extends StatefulWidget {
  const UsersWidget({super.key});

  @override
  State<UsersWidget> createState() => _UsersWidgetState();
}

class _UsersWidgetState extends State<UsersWidget> {
  final ScrollController _scrollController = ScrollController();
  late final Future<List<UsersModel>> myUserList;
  List<UsersModel> usersList = [];

  @override
  void initState() {
    super.initState();
    myUserList = getUserModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'Users api',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: myUserList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<UsersModel> myUserData = snapshot.data!;
            return ListView.builder(
              controller: _scrollController,
              itemBuilder: (context, index) {
                UsersModel myUserIndex = myUserData[index];
                return Card(
                  elevation: 4, // Kartın gölge efekti
                  margin: const EdgeInsets.symmetric(
                      vertical: 6, horizontal: 12), // Kartın kenar boşlukları
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/person.jpg'),
                    ),
                    title: Text(
                      myUserIndex.name as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      "Address: ${myUserIndex.address!.suite}, ${myUserIndex.address!.street}, ${myUserIndex.address!.city}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) =>
                              UserDetail(userItem: myUserIndex),
                        ),
                      );
                    },
                  ),
                );
              },
              itemCount: myUserData.length,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error as String),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.indigo,
              ),
            );
          }
        },
      ),
      floatingActionButton: GestureDetector(
        onLongPress: () {
          _scrollController.animateTo(
            0.0,
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
          );
        },
        child: FloatingActionButton(
          onPressed: () {
            _scrollController.animateTo(
              _scrollController.offset - 1000.0,
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeInOut,
            );
          },
          backgroundColor: Colors.indigo,
          child: const Icon(Icons.arrow_upward, color: Colors.white),
        ),
      ),
    );
  }

  Future<List<UsersModel>> getUserModel() async {
    try {
      // 1. JSON verisini içeren dosyadan içeriği bir String'e yükler.
      String myJson = await DefaultAssetBundle.of(context)
          .loadString('assets/data/users.json');

      // 2. Yüklenen String'i JSON formatına dönüştürür.
      List<dynamic> jsonList = json.decode(myJson);

      // 3. JSON listesini UsersModel listesine dönüştürme
      usersList = jsonList.map((json) => UsersModel.fromJson(json)).toList();

      // 4. Sonuç olarak UsersModel listesini döndürme
      return usersList;
    } catch (e) {
      // Hata durumunda hata mesajını yazdırma ve Future.error ile hatayı ileterek işlemi sonlandırma
      debugPrint(e.toString());
      return Future.error(e.toString());
    }
  }
}
