void playerDisp() {
  ellipseMode(CENTER);
  fill(#EDD69C);
  strokeWeight(2);
  stroke(0);
  arc(vansx, vansy, vansw, vansh, radians(0), radians(180));
}

void playerMove() {
  if(choice == 1){
  vansx = mouseX;
  }   
  if ( (vansx+vansw/2) > width ) {
    vansx = width - vansw/2;
  }
  if ( (vansx-vansw/2) < 0) {
    vansx = 0 + vansw/2;
  }
}//パッドの動き
