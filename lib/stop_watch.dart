import 'package:flutter/material.dart';
import 'dart:async';

class StopwatchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stopwatch App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StopwatchHomePage(),
    );
  }
}

class StopwatchHomePage extends StatefulWidget {
  @override
  _StopwatchHomePageState createState() => _StopwatchHomePageState();
}

class _StopwatchHomePageState extends State<StopwatchHomePage> {
  bool _isRunning = false;
  Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;
  List<String> _lapTimes = [];

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 10), (Timer timer) {
      setState(() {});
    });
  }

  void _stopTimer() {
    _timer.cancel();
  }

  void _resetTimer() {
    _stopwatch.reset();
    _lapTimes.clear();
    setState(() {});
  }

  void _addLapTime() {
    _lapTimes.insert(0, _formattedTime());
  }

  String _formattedTime() {
    int milliseconds = _stopwatch.elapsedMilliseconds;
    int seconds = (milliseconds / 1000).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();
    milliseconds %= 1000;
    seconds %= 60;
    minutes %= 60;

    return "${_formatNumber(hours)}:${_formatNumber(minutes)}:${_formatNumber(seconds)}:${_formatNumber(milliseconds, padding: 3)}";
  }

  String _formatNumber(int number, {int padding = 2}) {
    String formatted = number.toString();
    while (formatted.length < padding) {
      formatted = '0$formatted';
    }
    return formatted;
  }

  @override
  void dispose() {
    _stopwatch.stop();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                _formattedTime(),
                style: TextStyle(fontSize: 72.0),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      child: Text(_isRunning ? 'Lap' : 'Reset'),
                      onPressed: !_isRunning
                          ? _resetTimer
                          : () {
                              _addLapTime();
                            },
                    ),
                    SizedBox(width: 16.0),
                    ElevatedButton(
                      child: Text(_isRunning ? 'Stop' : 'Start'),
                      onPressed: () {
                        if (_isRunning) {
                          _stopwatch.stop();
                          _stopTimer();
                        } else {
                          _stopwatch.start();
                          _startTimer();
                        }
                        setState(() {
                          _isRunning = !_isRunning;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                _lapTimes.isNotEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: ListView.builder(
                              physics:
                                  NeverScrollableScrollPhysics(), // Add physics property
                              itemCount: _lapTimes.length,
                              itemBuilder: (context, index) {
                                return Text(
                                  'Lap ${index + 1}: ${_lapTimes[index]}',
                                  style: TextStyle(fontSize: 16.0),
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
