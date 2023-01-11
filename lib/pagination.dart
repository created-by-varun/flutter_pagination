library pagination;

import 'package:flutter/material.dart';

class Pagination extends StatefulWidget {
  const Pagination(
      {super.key,

      /// Total number of pages
      required this.numOfPages,

      /// Current selected page
      required this.selectedPage,

      /// Number of pages visible in the widget between the previous and next buttons
      required this.pagesVisible,

      /// Callback function when a page is selected
      required this.onPageChanged,

      /// Style for the active page text
      required this.activeTextStyle,

      /// Style for the active page button
      required this.activeBtnStyle,

      /// Style for the inactive page text
      required this.inactiveTextStyle,

      /// Style for the inactive page button
      required this.inactiveBtnStyle,

      /// Icon for the previous button
      this.previousIcon,

      /// Icon for the next button
      this.nextIcon,

      /// Spacing between the individual page buttons
      this.spacing});

  final int numOfPages;
  final int selectedPage;
  final int pagesVisible;
  final Function onPageChanged;
  final TextStyle activeTextStyle;
  final ButtonStyle activeBtnStyle;
  final TextStyle inactiveTextStyle;
  final ButtonStyle inactiveBtnStyle;
  final Icon? previousIcon;
  final Icon? nextIcon;
  final double? spacing;

  @override
  State<Pagination> createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  late int _startPage;
  late int _endPage;

  @override
  void initState() {
    super.initState();
    _calculateVisiblePages();
  }

  @override
  void didUpdateWidget(Pagination oldWidget) {
    super.didUpdateWidget(oldWidget);
    _calculateVisiblePages();
  }

  void _calculateVisiblePages() {
    /// If the number of pages is less than or equal to the number of pages visible, then show all the pages
    if (widget.numOfPages <= widget.pagesVisible) {
      _startPage = 1;
      _endPage = widget.numOfPages;
    } else {
      /// If the number of pages is greater than the number of pages visible, then show the pages visible
      int middle = (widget.pagesVisible - 1) ~/ 2;
      if (widget.selectedPage <= middle + 1) {
        _startPage = 1;
        _endPage = widget.pagesVisible;
      } else if (widget.selectedPage >= widget.numOfPages - middle) {
        _startPage = widget.numOfPages - (widget.pagesVisible - 1);
        _endPage = widget.numOfPages;
      } else {
        _startPage = widget.selectedPage - middle;
        _endPage = widget.selectedPage + middle;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Previous button
        IconButton(
          icon: widget.previousIcon ?? const Icon(Icons.arrow_back_ios),
          onPressed: widget.selectedPage > 1
              ? () => widget.onPageChanged(widget.selectedPage - 1)
              : null,
        ),

        /// loop through the pages and show the page buttons
        for (int i = _startPage; i <= _endPage; i++)
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            child: TextButton(
              style: i == widget.selectedPage
                  ? widget.activeBtnStyle
                  : widget.inactiveBtnStyle,
              onPressed: () => widget.onPageChanged(i),
              child: Text(
                '$i',
                style: i == widget.selectedPage
                    ? widget.activeTextStyle
                    : widget.inactiveTextStyle,
              ),
            ),
          ),

        /// Spacing between the individual page buttons
        SizedBox(
          width: widget.spacing ?? 0,
        ),

        /// Next button
        IconButton(
          icon: widget.nextIcon ?? const Icon(Icons.arrow_forward_ios),
          onPressed: widget.selectedPage < widget.numOfPages
              ? () => widget.onPageChanged(widget.selectedPage + 1)
              : null,
        ),
      ],
    );
  }
}
