import 'dart:async';

import 'package:blogdefi/icon_defi_blog/icon_blog_defi_icons.dart';
import 'package:blogdefi/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CharacterSearchInputSliver extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final Duration? debounceTime;
  final String? hintText;

  @override
  _CharacterSearchInputSliverState createState() =>
      _CharacterSearchInputSliverState();

  CharacterSearchInputSliver(
      {this.onChanged, this.debounceTime, this.hintText});
}

class _CharacterSearchInputSliverState
    extends State<CharacterSearchInputSliver> {
  final StreamController<String> _textChangeStreamController =
      StreamController();
  StreamSubscription? _textChangesSubscription;

  @override
  void initState() {
    _textChangesSubscription = _textChangeStreamController.stream
        .debounceTime(
          widget.debounceTime ?? const Duration(seconds: 1),
        )
        .distinct()
        .listen((text) {
      final onChanged = widget.onChanged;
      if (onChanged != null) {
        onChanged(text);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: colorHexa("ededed"),
            ),
            child: TextField(
              cursorColor: colorIconAppBar,
              decoration: InputDecoration(
                // border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorIconAppBar),
                  borderRadius: BorderRadius.circular(17),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
                suffixIcon: const Icon(
                  IconBlogDefi.search,
                  // color: Colors.black54,
                ),
                hintText: widget.hintText ?? "Search",
              ),
              onChanged: _textChangeStreamController.add,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textChangeStreamController.close();
    _textChangesSubscription?.cancel();
    super.dispose();
  }
}
