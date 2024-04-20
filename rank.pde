void rank() {
  for ( int i = 0; i < 12; i++ ) {
    fill(0);
    textSize(40);
    if (i < 9) {
      text( String.valueOf(i+1) + "  位　" + String.valueOf(data[i]), 1100, i * 55 + 75);
    } else {
      text( String.valueOf(i+1) + "位　" + String.valueOf(data[i]), 1100, i * 55 + 75);
    }
    //textファイルの行数ごとに画面に表示
  }
}

void textWrite( String fileName, String msg ) {
  try {
    FileOutputStream fos = new FileOutputStream( fileName, true);
    fos.write( msg.getBytes() );
    fos.close();
  }
  catch (Exception ex) {
    //例外
    ex.printStackTrace();
  }
}

void getData() {
  textScoreData = loadStrings( file );
  if ( textScoreData == null ) {
    println( "\n" + file + "読み込み失敗" );
    exit();
  }
  for (int i = 0; i < textScoreData.length; i++) {
    data[i] = Integer.valueOf(textScoreData[i]);
  }
  //data[textScoreData.length] = calorie;
  data = reverse(sort(data));
  //新しく取得したデータを大きい順に並べる
}
