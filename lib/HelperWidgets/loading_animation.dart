import 'package:flutter/material.dart';

class CubeGridAnimation extends StatefulWidget {
  const CubeGridAnimation(
      {Key key, this.color, this.size = 50.0, this.controller})
      : assert(color != null),
        super(key: key);

  final Color color;
  final double size;
  final AnimationController controller;

  @override
  _CubeGridAnimation createState() => _CubeGridAnimation();

}

class _CubeGridAnimation extends State<CubeGridAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation1, _animation2, _animation3, _animation4,
      _animation5;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller;
    _animation1 = TweenSequence([
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: 1.0),
        weight: 50.0,
      ),
      TweenSequenceItem(
        tween: ConstantTween(1.0),
        weight: 100.0,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 0.0),
        weight: 50.0,
      ),
      TweenSequenceItem(
        tween: ConstantTween(0.0),
        weight: 80.0,
      ),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    _animation2 = TweenSequence([
      TweenSequenceItem(
        tween: ConstantTween(0.0),
        weight: 10.0,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: 1.0),
        weight: 50.0,
      ),
      TweenSequenceItem(
        tween: ConstantTween(1.0),
        weight: 100.0,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 0.0),
        weight: 50.0,
      ),
      TweenSequenceItem(
        tween: ConstantTween(0.0),
        weight: 70.0,
      ),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    _animation3 = TweenSequence([
      TweenSequenceItem(
        tween: ConstantTween(0.0),
        weight: 20.0,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: 1.0),
        weight: 50.0,
      ),
      TweenSequenceItem(
        tween: ConstantTween(1.0),
        weight: 100.0,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 0.0),
        weight: 50.0,
      ),
      TweenSequenceItem(
        tween: ConstantTween(0.0),
        weight: 60.0,
      ),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    _animation4 = TweenSequence([
      TweenSequenceItem(
        tween: ConstantTween(0.0),
        weight: 30.0,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: 1.0),
        weight: 50.0,
      ),
      TweenSequenceItem(
        tween: ConstantTween(1.0),
        weight: 100.0,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 0.0),
        weight: 50.0,
      ),
      TweenSequenceItem(
        tween: ConstantTween(0.0),
        weight: 50.0,
      ),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    _animation5 = TweenSequence([
      TweenSequenceItem(
        tween: ConstantTween(0.0),
        weight: 40.0,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: 1.0),
        weight: 50.0,
      ),
      TweenSequenceItem(
        tween: ConstantTween(1.0),
        weight: 100.0,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 0.0),
        weight: 50.0,
      ),
      TweenSequenceItem(
        tween: ConstantTween(0.0),
        weight: 40.0,
      ),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _createSquare(Animation<double> animation, int squareIndex) {
    return ScaleTransition(
        scale: animation,
        child: SizedBox.fromSize(size: Size.square((widget.size / 3)),
            child: _squareBuilder(squareIndex))
    );
  }

  Widget _squareBuilder(int index) {
    return DecoratedBox(decoration: BoxDecoration(color: widget.color));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
        size: Size.square(widget.size),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _createSquare(_animation3, 0),
                _createSquare(_animation4, 1),
                _createSquare(_animation5, 2),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _createSquare(_animation2, 3),
                _createSquare(_animation3, 4),
                _createSquare(_animation4, 5),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _createSquare(_animation1, 6),
                _createSquare(_animation2, 7),
                _createSquare(_animation3, 8),
              ],
            ),
          ],
        )
    );
  }
}