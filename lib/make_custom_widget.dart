import 'package:flutter/material.dart';

class MakeCustomWidgets extends StatefulWidget {
  const MakeCustomWidgets({ Key? key }) : super(key: key);

  @override
  State<MakeCustomWidgets> createState() => _MakeCustomWidgetsState();
}

class _MakeCustomWidgetsState extends State<MakeCustomWidgets> {
  @override
  Widget build(BuildContext context) {
    return CustomMultiChildLayout(
      delegate: multiChildDelegate(
        height1: 40,
        height2: 300,
        width1: 100,
        width2: 300
      ),
      children: [
        LayoutId(
          id: 1,
          child: Container(
            height: 40,
            width: 100,           
            color: Colors.yellow,
            // child: TextButton(
            //   onPressed: () {
            //     print('Hello');
            //   },
            //   child: const Text('Click'),
            // ),
            child: Text('hey'),
          ),
        ),
        LayoutId(
          id: 2,
          child: Container(
            height: 300,
            width: 300,            
            color: Colors.red,
            // child: TextButton(
            //   onPressed: () {
            //     print('Hello');
            //   },
            //   child: const Text('Click'),
            // ),
            child: Text('hey'),
          ),
        ),
      ],
    );
  }
}



class multiChildDelegate extends MultiChildLayoutDelegate {
  final height1;
  final height2;
  final width1;
  final width2;
  multiChildDelegate({
    this.height1,
    this.height2,
    this.width1,
    this.width2,
  
  });
  @override
  void performLayout(Size size) {
    layoutChild(1, BoxConstraints.tight( Size(width1, height1)));
    positionChild(1, const Offset(300, 100));
    layoutChild(2, BoxConstraints.tight( Size(width2, height2)));
    positionChild(2,  Offset(300, (100 + height1).toDouble()));
  }

  @override
  bool shouldRelayout(multiChildDelegate oldDelegate) => true ;
}
