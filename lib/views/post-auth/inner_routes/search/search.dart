import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sharethechurch/utils/utils.dart';

import 'church_search_item.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      hasAppBar: true,
      text: 'search',
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 12, right: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: primaryColor,
                )),
            width: double.infinity,
            height: 48,
            child: Center(
              child: TextField(
                autofocus: true,
                controller: _controller,
                onChanged: (value) {
                  setState(() {});
                },
                cursorColor: primaryColor,
                decoration: null,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          StreamBuilder(
              stream: repository.searchChurch(_controller.text),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (_controller.text == '') {
                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //  const Expanded(child: SizedBox()),
                        SvgPicture.asset(
                          'assets/svgs/no_results.svg',
                          color: primaryColor,
                        ),
                      ],
                    ),
                  );
                }
                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) => SearchResults(
                      userModel: snapshot.data.docs[index],
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 12,
                    ),
                    itemCount: snapshot.data!.docs.length,
                  ),
                );
              }),
        ],
      ),
    );
  }
}

class SearchResults extends StatelessWidget {
  const SearchResults({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  final userModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigate(ChurchSearchItem(
          userModel: userModel,
        ));
      },
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          Container(
            width: double.infinity,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: primaryColor),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Image.asset(
                    'assets/images/dp.jpeg',
                    width: 44,
                    height: 44,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(child: SizedBox()),
                    LargeBodyText(
                      text: userModel['name'],
                      fontSize: 16,
                    ),
                    MediumBodyText(
                        text: '${userModel['city']}, ${userModel['state']}'),
                    const Expanded(child: SizedBox()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
