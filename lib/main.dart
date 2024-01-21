import 'package:flutter/material.dart';
import 'package:them/utils/service/api_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ApiService apiService = ApiService();
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: apiService.getcomment(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Text(snapshot.data![index].body.toString());
                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
