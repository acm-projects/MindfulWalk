import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class Graph extends StatelessWidget {
  final String graphType;

  const Graph({Key? key, required this.graphType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: 300,
        child: GraphArea(graphType: graphType), // Pass graphType to GraphArea
      ),
    );
  }
}

class GraphArea extends StatefulWidget {
  final String graphType;
  const GraphArea({Key? key, required this.graphType}) : super(key: key);

  @override
  _GraphAreaState createState() => _GraphAreaState();
}

class _GraphAreaState extends State<GraphArea>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late List<DataPoint> data;

  /*List<DataPoint> data = [
    DataPoint(day: 1, steps: Random().nextInt(100)),
    DataPoint(day: 2, steps: Random().nextInt(100)),
    DataPoint(day: 3, steps: Random().nextInt(100)),
    DataPoint(day: 4, steps: Random().nextInt(100)),
    DataPoint(day: 5, steps: Random().nextInt(100)),
    DataPoint(day: 6, steps: Random().nextInt(100)),
    DataPoint(day: 7, steps: Random().nextInt(100)),
    DataPoint(day: 8, steps: Random().nextInt(100)),
  ];*/

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2500));
    _animationController.forward();

    generateData(widget.graphType); // Initial data generation, can be changed according to your needs
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void generateData(String type) {
    setState(() {
      switch (type) {
        case 'Weekly':
          data = [
            DataPoint(day: 'Mon', steps: Random().nextInt(10000)),
            DataPoint(day: 'Tue', steps: Random().nextInt(10000)),
            DataPoint(day: 'Wed', steps: Random().nextInt(10000)),
            DataPoint(day: 'Thu', steps: Random().nextInt(10000)),
            DataPoint(day: 'Fri', steps: Random().nextInt(10000)),
            DataPoint(day: 'Sat', steps: Random().nextInt(10000)),
            DataPoint(day: 'Sun', steps: Random().nextInt(10000)),
          ];
          break;
        case 'Monthly':
          data = List.generate(
            31,
                (index) =>
                DataPoint(
                    day: (index + 1).toString(), steps: Random().nextInt(10000)),
          );
          break;
        case 'Yearly':
          data = List.generate(
            12,
                (index) =>
                DataPoint(
                    day: (index + 1).toString(), steps: Random().nextInt(10000)),
          );
          break;
        default:
        // Default to weekly
          data = [
            DataPoint(day: 'Mon', steps: Random().nextInt(10000)),
            DataPoint(day: 'Tue', steps: Random().nextInt(10000)),
            DataPoint(day: 'Wed', steps: Random().nextInt(10000)),
            DataPoint(day: 'Thu', steps: Random().nextInt(10000)),
            DataPoint(day: 'Fri', steps: Random().nextInt(10000)),
            DataPoint(day: 'Sat', steps: Random().nextInt(10000)),
            DataPoint(day: 'Sun', steps: Random().nextInt(10000)),
          ];
          break;
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _animationController.forward(from: 0.0);
      },
      child: CustomPaint(
        painter: GraphPainter(_animationController.view, data: data),
      ),
    );
  }
}

class GraphPainter extends CustomPainter {
  final List<DataPoint> data;
  final Animation<double> _size;
  final Animation<double> _dotSize;

  GraphPainter(Animation<double> animation, {required this.data})
      : _size = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0.0, 0.75,
                curve: Curves.easeInOutCubicEmphasized),
          ),
        ),
        _dotSize = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: animation,
            curve:
                const Interval(0.75, 1, curve: Curves.easeInOutCubicEmphasized),
          ),
        ),
        super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    var xSpacing = size.width / (data.length - 1);
    //var ySpacing = (size.height/10000)*10000;


    var maxSteps = data
        .fold<DataPoint>(data[0], (p, c) => p.steps > c.steps ? p : c)
        .steps;

    var yRatio = size.height / maxSteps;
    var curveOffset = xSpacing * 0.3;
    var ySpacing = maxSteps/700;

    List<Offset> offsets = [];

    var cx = 0.0;
    for (int i = 0; i < data.length; i++) {
      var y = size.height - (data[i].steps * yRatio * _size.value);

      offsets.add(Offset(cx, y));
      cx += xSpacing;
    }

    Paint linePaint = Paint()
      ..color = const Color(0xffFFA9A8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    Paint shadowPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..maskFilter = const ui.MaskFilter.blur(ui.BlurStyle.solid, 3)
      ..strokeWidth = 3.0;

    Paint fillPaint = Paint()
      ..shader = ui.Gradient.linear(
        Offset(size.width / 2, 0),
        Offset(size.width / 2, size.height),
        [
          const Color(0xffFFA9A8),
          Colors.white,
        ],
      )
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    Paint dotOutlinePaint = Paint()
      ..color = Colors.white.withAlpha(200)
      ..strokeWidth = 8;

    Paint dotCenter = Paint()
      ..color = const Color(0xffFFA9A8)
      ..strokeWidth = 8;

    Path linePath = Path();

    Offset cOffset = offsets[0];

    linePath.moveTo(cOffset.dx, cOffset.dy);

    for (int i = 1; i < offsets.length; i++) {
      var x = offsets[i].dx;
      var y = offsets[i].dy;
      var c1x = cOffset.dx + curveOffset;
      var c1y = cOffset.dy;
      var c2x = x - curveOffset;
      var c2y = y;

      linePath.cubicTo(c1x, c1y, c2x, c2y, x, y);
      cOffset = offsets[i];
    }

    Path fillPath = Path.from(linePath);
    fillPath.lineTo(size.width, size.height);
    fillPath.lineTo(0, size.height);

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(linePath, shadowPaint);
    canvas.drawPath(linePath, linePaint);

    // Draw x-axis (days)

    if (data.length>25) {
      List<String> showOnlyDays = ['1','5','10', '15','20','25', '30']; // Define the days to be displayed
      for (int i = 0; i < data.length; i++) {
        if (!showOnlyDays.contains(data[i].day)) continue; // Skip days not in the list
        var x = i * xSpacing;
        canvas.drawLine(
          Offset(x, size.height),
          Offset(x, size.height + 8),
          linePaint,
        );
        TextSpan span = TextSpan(
          style: TextStyle(color: Colors.black),
          text: data[i].day.toString(),
        );
        TextPainter tp = TextPainter(
          text: span,
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        );
        tp.layout();
        tp.paint(canvas, Offset(x - tp.width / 2, size.height + 12));
      }
    }

    else {
      for (int i = 0; i < data.length; i++) {
        var x = i * xSpacing;
        canvas.drawLine(
            Offset(x, size.height), Offset(x, size.height + 8), linePaint);
        TextSpan span = TextSpan(
            style: TextStyle(color: Colors.black),
            text: data[i].day.toString());
        TextPainter tp = TextPainter(
            text: span,
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr);
        tp.layout();
        tp.paint(
            canvas, Offset(x - tp.width / 2, size.height + 12));
      }
    }

    // Draw y-axis (steps)
    var stepsPerUnit = 1000; // Define the steps per unit (e.g., 1000)
    for (int i = 0; i <= 10; i++) {
      var y = size.height - i * ySpacing;
      var labelText = (i * (maxSteps / 10) / stepsPerUnit).toStringAsFixed(0);
      canvas.drawLine(Offset(0, y), Offset(-8, y), linePaint);
      TextSpan span = TextSpan(
          style: TextStyle(color: Colors.black),
          //text: (i * (maxSteps / 10)).toInt().toString());
          text: labelText+'000');
      TextPainter tp = TextPainter(
          text: span,
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr);
      tp.layout();
      tp.paint(canvas, Offset(-tp.width - 12, y - tp.height / 2));
    }

    canvas.drawCircle(offsets[4], 15 * _dotSize.value, dotOutlinePaint);
    canvas.drawCircle(offsets[4], 6 * _dotSize.value, dotCenter);
  }

  @override
  bool shouldRepaint(covariant GraphPainter oldDelegate) {
    return data != oldDelegate.data;
  }
}

class DataPoint {
  final String day;
  final int steps;

  DataPoint({
    required this.day,
    required this.steps,
  });
}
