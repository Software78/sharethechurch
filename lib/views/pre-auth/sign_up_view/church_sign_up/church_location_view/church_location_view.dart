// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:sharethechurch/views/pre-auth/login_view/login_view.dart';

import '../../../../../models/city_model.dart';
import '../../../../../utils/utils.dart';

class ChurchLocation extends StatelessWidget {
  const ChurchLocation({Key? key, required this.states}) : super(key: key);

  final List? states;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      hasAppBar: false,
      child: Column(
        children: [
          const SizedBox(height: 22),
          Image.asset(
            'assets/images/dp.jpeg',
            width: 100,
            height: 100,
          ),
          const SizedBox(height: 22),
          LargeBodyText(text: 'Where are you\nlocated?'),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    padding: const EdgeInsets.all(10),
                    child: FutureBuilder<List<City>>(
                      future: repository.getCities(states![index].iso2),
                      builder: (context, AsyncSnapshot<List<City>> snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          List<City> cities = snapshot.data as List<City>;
                          return ListView.builder(
                            itemCount: cities.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {},
                              child: InkWell(
                                onTap: () async {
                                  await repository.setCityAndState(
                                      cities[index].name, states![index].name);
                                  await showMessageDialog("Login to proceed");
                                  navigateAndRemoveAll(const LoginView());
                                },
                                child: ListTile(
                                  title: Text(cities[index].name),
                                ),
                              ),
                            ),
                          );
                        }

                        return const CircularProgressIndicator.adaptive();
                      },
                    ),
                  ),
                );
              },
              child: ListTile(
                title: Text(states![index].name),
              ),
            ),
            itemCount: states!.length,
          )),
        ],
      ),
    );
  }
}
