import 'package:calculator_project/core/app_constance.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomeController extends ChangeNotifier{
  String formula = "";
  double? result;
  double formulaSize = 22.0;
  double resultSize = 50.0;
  bool darkMode = false;

  //themeFun
  darkModeFun(){
    if(!darkMode){
      darkMode = true;
      setModeToSP(true);
      notifyListeners();
    }
  }
  lightModeFun() {
    if (darkMode) {
      darkMode = false;
      setModeToSP(false);
      notifyListeners();
    }
  }
  setModeToSP(val) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool(AppConstance.mode, val);
  }
  Future<void> getModeFromSP() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    darkMode = sp.getBool(AppConstance.mode)??false;
  }

  //result
  void addToFormula(dynamic text) {
    if(formula.length < 25){
      formulaSize = 50.0;
      resultSize = 22.0;
      formula = "$formula$text";
    }
    notifyListeners();
  }
  void clear(){
    formula = "";
    result = null;
    formulaSize = 50.0;
    resultSize = 22.0;
    notifyListeners();
  }
  void changeResultAndFormulaSize(){
    formulaSize = 50.0;
    resultSize = 22.0;
    notifyListeners();
  }
  removeLastSymbol(){
    if(formula.isNotEmpty){
      formulaSize = 50.0;
      resultSize = 22.0;
      result = null;
      formula = formula.substring(0, formula.length-1);
      notifyListeners();
    }
  }
  getResult(){
    if(formula.isNotEmpty){
      formulaSize = 22.0;
      resultSize = 50.0;
      String ex = formula.replaceAll("x", "*").replaceAll("÷", "/");
      Parser p = Parser();
      try{
        Expression exp = p.parse(ex);
        ContextModel cm = ContextModel();
        result = exp.evaluate(EvaluationType.REAL, cm);
      }catch(e){
        result = null;
      }
      notifyListeners();
    }
  }
  void onPressed(dynamic text){
    if(text == "AC"){
      clear();
    }else if(text == "removeLastItem"){
      removeLastSymbol();
    }else if(text == "="){
      getResult();
    }else{
      addToFormula(text);
    }
  }
}