import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';
import 'package:frame_conf/sudoku/blockChar.dart';
import 'package:frame_conf/sudoku/boxInner.dart';
import 'package:frame_conf/sudoku/focusClass.dart';
import 'package:sudoku_solver_generator/sudoku_solver_generator.dart';

class SudokuWidget extends StatefulWidget {
  SudokuWidget({Key? key}) : super(key: key);

  @override
  State<SudokuWidget> createState() => _SudokuWidgetState();
}

class _SudokuWidgetState extends State<SudokuWidget> {
  //nuestra variable
  List<BoxInner> boxInners = [];

  FocusClass focusClass = FocusClass();
  bool isFinish = false;
  String? tapBoxIndex;

  @override
  void initState() {
    generateSudoku();
    super.initState();
  }

  void generateSudoku() {
    isFinish = false;
    focusClass = new FocusClass();
    tapBoxIndex = null;
    generatePuzzle();
    checkFinish();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () => generatePuzzle(), child: Icon(Icons.refresh)),
        ],
      ),
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                // height: 400,
                color: Colors.blueGrey,
                padding: EdgeInsets.all(5),
                width: double.maxFinite,
                alignment: Alignment.center,
                child: GridView.builder(
                    itemCount: boxInners.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    physics: ScrollPhysics(),
                    itemBuilder: (buildContext, index) {
                      BoxInner boxInner = boxInners[index];

                      return Container(
                        color: Colors.red.shade100,
                        alignment: Alignment.center,
                        child: GridView.builder(
                            itemCount: boxInner.blokChars.length,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 1,
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 2,
                            ),
                            physics: ScrollPhysics(),
                            itemBuilder: (buildContext, indexChar) {
                              BlokChar blokChar = boxInner.blokChars[indexChar];
                              Color color = Colors.yellow.shade100;
                              Color colorText = Colors.black;

                              if (isFinish)
                                color = Colors.green;
                              else if (blokChar.isDefault)
                                color = Colors.grey;
                              else if (blokChar.isFocus)
                                color = Colors.brown.shade100;

                              if (tapBoxIndex == "${index} - ${indexChar}" &&
                                  !isFinish) color = Colors.blue.shade100;

                              if (this.isFinish)
                                colorText = Colors.white;
                              else if (blokChar.isExist) colorText = Colors.red;

                              return Container(
                                color: color,
                                alignment: Alignment.center,
                                child: TextButton(
                                  onPressed: blokChar.isDefault
                                      ? null
                                      : () => setFocus(index, indexChar),
                                  child: Text(
                                    "${blokChar.text}",
                                    style: TextStyle(color: colorText),
                                  ),
                                ),
                              );
                            }),
                      );
                    }),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        child: GridView.builder(
                          itemCount: 9,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                          ),
                          physics: ScrollPhysics(),
                          itemBuilder: (buildContext, index) {
                            return ElevatedButton(
                              onPressed: () => setInput(index + 1),
                              child: Text(
                                "${index + 1}",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: ElevatedButton(
                              onPressed: () => setInput(null),
                              child: Container(
                                child: Text(
                                  "Limpiar",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  generatePuzzle() {
//instalamos las herramientas del sodoku
    boxInners.clear();
    var sudokuGenerator = SudokuGenerator(emptySquares: 54); //54

    List<List<List<int>>> completes = partition(sudokuGenerator.newSudokuSolved,
            sqrt(sudokuGenerator.newSudoku.length).toInt())
        .toList();
    partition(sudokuGenerator.newSudoku,
            sqrt(sudokuGenerator.newSudoku.length).toInt())
        .toList()
        .asMap()
        .entries
        .forEach(
      (entry) {
        List<int> tempListCompletes =
            completes[entry.key].expand((element) => element).toList();
        List<int> tempList = entry.value.expand((element) => element).toList();

        tempList.asMap().entries.forEach((entryIn) {
          int index =
              entry.key * sqrt(sudokuGenerator.newSudoku.length).toInt() +
                  (entryIn.key % 9).toInt() ~/ 3;

          if (boxInners.where((element) => element.index == index).length ==
              0) {
            boxInners.add(BoxInner(index, []));
          }
          BoxInner boxInner =
              boxInners.where((element) => element.index == index).first;

          boxInner.blokChars.add(BlokChar(
            entryIn.value == 0 ? " " : entryIn.value.toString(),
            index: boxInner.blokChars.length,
            isDefault: entryIn.value != 0,
            isCorrect: entryIn.value != 0,
            correctText: tempListCompletes[entryIn.key].toString(),
          ));
        });
      },
    );
  }

  setFocus(int index, int indexChar) {
    tapBoxIndex = "$index - $indexChar ";
    focusClass.setData(index, indexChar);
    showFocusCenterLine();
    setState(() {});
  }

  void showFocusCenterLine() {
    int rowNoBox = focusClass.indexBox! ~/ 3;
    int colNoBox = focusClass.indexBox! % 3;

    boxInners.where((element) => element.index ~/ 3 == rowNoBox).forEach(
        (e) => e.setFocus(focusClass.indexChar!, Direction.Horizontal));

    boxInners
        .where((element) => element.index % 3 == colNoBox)
        .forEach((e) => e.setFocus(focusClass.indexChar!, Direction.Vertical));
  }

  setInput(int? number) {
    if (focusClass.indexBox == null) return;
    if (boxInners[focusClass.indexBox!].blokChars[focusClass.indexChar!].text ==
            number.toString() ||
        number == null) {
      boxInners.forEach((element) {
        element.clearFocus();
        element.clearExist();
      });
      boxInners[focusClass.indexBox!]
          .blokChars[focusClass.indexChar!]
          .setEmpty();
      tapBoxIndex = null;
      isFinish = false;
      showSameInputOnSameLine();
    } else {
      boxInners[focusClass.indexBox!]
          .blokChars[focusClass.indexChar!]
          .setText("$number");
      showSameInputOnSameLine();
      checkFinish();
    }
    setState(() {});
  }

  void showSameInputOnSameLine() {
    int rowNoBox = focusClass.indexBox! ~/ 3;
    int colNoBox = focusClass.indexBox! % 3;

    String textInput =
        boxInners[focusClass.indexBox!].blokChars[focusClass.indexChar!].text!;

    boxInners.forEach((element) => element.clearExist());

    boxInners.where((element) => element.index ~/ 3 == rowNoBox).forEach((e) =>
        e.setExistValue(focusClass.indexChar!, focusClass.indexBox!, textInput,
            Direction.Horizontal));

    boxInners.where((element) => element.index % 3 == colNoBox).forEach((e) =>
        e.setExistValue(focusClass.indexChar!, focusClass.indexBox!, textInput,
            Direction.Vertical));

    List<BlokChar> exists = boxInners
        .map((element) => element.blokChars)
        .expand((element) => element)
        .where((element) => element.isExist)
        .toList();

    if (exists.length == 1) exists[0].isExist = false;
  }

  void checkFinish() {
    int totalUnfinish = boxInners
        .map((e) => e.blokChars)
        .expand((element) => element)
        .where((element) => !element.isCorrect)
        .length;

    isFinish = totalUnfinish == 0;
  }
}
