void Rule_description() {
  background(0);
  fill(255);
  textSize(40);
  text("・HPが0、具材がない状態でゴミを拾う　→ゲームオーバー", 20, 100);
  text("・ゴミに当たると、HP-1, 一番上の具材も消える", 20, 200);
  text("・クリアするとつくったハンバーガーのカロリーが", 20, 600);
  text("   ご飯何杯分かで表されるよ", 20, 660);
  text("・", 20, 520);
  text("をとると、ゲーム終了!", 150, 515);
  fill(#FCF8A6);
  ellipseMode(CORNER);
  ellipse(800, 600, 1100, 550);// + 150
  fill(0);
  textSize(70);
  mcnt++;
  if ( (mcnt%80) < 50 ) {
    text("click to start!!", 950, 820);
  }

  imageMode(CENTER);
  textAlign(CENTER);
  fill(255);
  textSize(40);

  image(ingredients[0], 100, 320);
  text("3kcal", 100, 425);

  image(ingredients[1], 260, 320);
  text("1kcal", 260, 425);

  image(ingredients[2], 420, 320);
  text("216kcal", 420, 425);

  image(ingredients[3], 580, 320);
  text("85kcal", 580, 425);

  image(ingredients[4], 740, 320);
  text("77kcal", 740, 425);

  image(ingredients[5], 900, 320);
  text("61kcal", 900, 425);

  image(star, 1070, 320);
  text("? ? ?", 1080, 425);

  image(ingredients[9], 100, 500);

  textAlign(CORNER);
  imageMode(CORNER);

  if (rule_count > 50 && mousePressed) {
    gameInit();
    gseq = 0;
  }
  rule_count++;
} 
