class Matrix {
  List<double> rowOne = [];
  List<double> rowTwo = [];
  List<double> rowThree = [];
  
  void sortMatrixFirstTime(){
    if (rowOne[0].abs() > rowTwo[0].abs()) {
      if (rowOne[0].abs() > rowThree[0].abs()) {
        if (rowTwo[0].abs() < rowThree[0].abs()) {
          for (int i = 0; i < rowTwo.length; i++) {
            double temp = rowTwo[i];
            rowTwo[i] = rowThree[i];
            rowThree[i] = temp;
          }
        }
      }
    }else{
      for (int i = 0; i < rowTwo.length; i++) {
        double temp = rowTwo[i];
        rowTwo[i] = rowOne[i];
        rowOne[i] = temp;
      }
      if (rowTwo[0].abs() < rowThree[0].abs()){
        for (int i = 0; i < rowTwo.length; i++) {
          double temp = rowTwo[i];
          rowTwo[i] = rowThree[i];
          rowThree[i] = temp;
        }
      }
      if(rowOne[0].abs() < rowTwo[0].abs()){
        for (int i = 0; i < rowTwo.length; i++) {
          double temp = rowTwo[i];
          rowTwo[i] = rowOne[i];
          rowOne[i] = temp;
        }
      }
    }
  }
  
  void sortMatrixSecondTime (){
    if(rowTwo[1].abs()<rowThree[1].abs()){
      for (int i = 0; i < rowTwo.length; i++) {
        double temp = rowTwo[i];
        rowTwo[i] = rowThree[i];
        rowThree[i] = temp;
      }
    }
  }
}