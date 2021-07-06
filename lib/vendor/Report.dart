

import 'dart:async';

import 'package:flutter/material.dart';


enum PickerDemoType {
  date,
  time,
  range,
}

class PickerDemo extends StatefulWidget {
  const PickerDemo({Key key, this.type}) : super(key: key);

  final PickerDemoType type;

  @override
  _PickerDemoState createState() => _PickerDemoState();
}

class _PickerDemoState extends State<PickerDemo> {
  DateTimeRange _fromRange =
  DateTimeRange(start: DateTime.now(), end: DateTime.now());

  /*String get _labelText {
    switch (widget.type) {
      case PickerDemoType.date:
        return DateFormat.yMMMd().format(_fromDate);
      case PickerDemoType.time:
        return _fromTime.format(context);
      case PickerDemoType.range:
        return DateFormat.yMMMd().format(_fromRange.start) +
            ' - ' +
            DateFormat.yMMMd().format(_fromRange.end);
        break;
    }
    return '';
  }*/

  /*Future<void> _showDatePicker(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _fromDate,
      firstDate: DateTime(2015, 1),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _fromDate) {
      setState(() {
        _fromDate = picked;
      });
    }
  }*/

  /*Future<void> _showTimePicker(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _fromTime,
    );
    if (picked != null && picked != _fromTime) {
      setState(() {
        _fromTime = picked;
      });
    }
  }*/

  Future<void> _showDateRangePicker(BuildContext context) async {
    final picked = await showDateRangePicker(
      useRootNavigator: false,
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (picked != null) {
      setState(() {
        _fromRange = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute<void>(
          builder: (context) => Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text('RangePicker'),
            ),
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('RangePicker'),
                  const SizedBox(height: 16),
                  RaisedButton(
                    child: Text(
                      'show Picker'
                    ),
                    onPressed: () {
                          _showDateRangePicker(context);
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

