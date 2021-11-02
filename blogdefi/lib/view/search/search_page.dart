import 'dart:convert';
import 'package:blogdefi/helpers/components.dart';
import 'package:blogdefi/helpers/container.dart';
import 'package:blogdefi/presenter/infinite_scroll_pagination/common/character_search_input_sliver.dart';
import 'package:blogdefi/model/get/get_blog_categories.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _pageSize = 1;
  final PagingController _pagingController = PagingController(firstPageKey: 5);
  late List<dynamic> data;
  String? _searchTerm = "";

  Future<void> _fetchPage(pageKey) async {
    try {
      GetCategoriesBlogSearch getCategoriesBlogSearch =
          GetCategoriesBlogSearch();
      data = await getCategoriesBlogSearch.getData(
          search: _searchTerm, page: _pageSize, perPage: pageKey);
      setState(() {});
      final isLastPage = data.length < pageKey;
      if (isLastPage) {
        _pagingController.appendLastPage(data);
      } else {
        setState(() {
          _pageSize += 1;
        });
        final nextPageKey = pageKey;
        print('nextPageKey: $nextPageKey');
        _pagingController.appendPage(data, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 0, left: 5, right: 5, bottom: 25),
        height: size.height,
        width: size.width,
        child: CustomScrollView(
          slivers: <Widget>[
            CharacterSearchInputSliver(
              hintText: "Search",
              onChanged: (searchTerm) {
                _updateSearchTerm(searchTerm);
                setState(() {
                  _pageSize = 1;
                });
              },
            ),
            PagedSliverList(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate(
                noMoreItemsIndicatorBuilder: (context) =>
                    firstPageErrorIndicatorBuilder(context, tittle: ""),
                noItemsFoundIndicatorBuilder: (context) =>
                    firstPageErrorIndicatorBuilder(context,
                        tittle: "No Post Found"),
                newPageErrorIndicatorBuilder: (context) =>
                    firstPageErrorIndicatorBuilder(context, tittle: ""),
                firstPageProgressIndicatorBuilder: (context) =>
                    firstPageProgressIndicatorBuilder(),
                newPageProgressIndicatorBuilder: (context) =>
                    newPageProgressIndicatorBuilder(),
                itemBuilder: (context, item, index) {
                  String itemEncode = jsonEncode(item);
                  Map<String, dynamic> itemDecode = jsonDecode(itemEncode);
                  if(itemDecode['yoast_head_json']["og_image"] != null){
                    return containerDetailBlog(
                      context,
                      imgUrl:
                      itemDecode['yoast_head_json']["og_image"].first['url'],
                      size: size,
                      title: itemDecode['yoast_head_json']["title"],
                      id: itemDecode['id'],
                      content: itemDecode['content'],
                      redirectUrl: itemDecode['guid']['rendered'],
                    );
                  }else {
                    return SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget searchField() {
  //   return Container(
  //     margin: const EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 0),
  //     height: 60,
  //     child: TextField(
  //       cursorColor: colorIconAppBar,
  //       maxLines: 1,
  //       // textAlignVertical: TextAlignVertical.bottom,
  //       decoration: InputDecoration(
  //         hintText: "Search",
  //         suffixIcon: Padding(
  //           padding: const EdgeInsets.only(right: 18.0),
  //           child: Icon(
  //             IconBlogDefi.search,
  //             color: colorIconAppBar,
  //           ),
  //         ),
  //         focusedBorder: OutlineInputBorder(
  //             borderSide: BorderSide(
  //               color: colorIconAppBar,
  //             ),
  //             borderRadius: BorderRadius.circular(17)),
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(17),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  void _updateSearchTerm(String searchTerm) {
    _searchTerm = searchTerm;
    _pagingController.refresh();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
