//valori alpha di colibri e piuma
int alphaColibri=0;
int alphaColibriIncreas=10;
int alphaPiuma=255;
int alphaPiumaIncrease=10;

Personaggio ermione;
class Personaggio {
  PShape shape;
  float x = width*0.1;
  float y = height*0.5;
  Personaggio(String filename) {
    shape = loadShape(filename);
    shape.setFill(color(#744513));
    shape.rotateX(radians(180));
    shape.rotateY(radians(90));
  }
  void disegna() {
    shape(shape, x, y);
  }
}
Trasfigurabile piuma;
Trasfigurabile colibri;
class Trasfigurabile {
  PShape shape;
  float x=width*0.9;
  float y=height*0.5;
  float xpiuma=10;
  float xcolibri=10;

  Trasfigurabile(String filename) {
    shape = loadShape(filename);
    shape.setFill(color(#11E6F7));
  }
  void disegna() {
    shape(shape, x, y);
  }
}

void setup() {
  fullScreen(P3D);
  ermione=new Personaggio("witch.obj");//asegnazione del file obj di ermione 
  piuma=new Trasfigurabile("quill.obj");//asegnazione del file obj della piuma 
  colibri=new Trasfigurabile("colibri.obj");//asegnazione del file obj del colibri
}

void draw() {
  background(#87D6FC);
  lights();
  piuma.disegna();
  ermione.disegna();
  colibri.disegna();
  colibri.shape.setFill(color(#FF0000));
  if (piuma.x>width*0.2) {
    piuma.x=piuma.x-piuma.xpiuma;
    colibri.x=colibri.x-colibri.xcolibri;
    colibri.shape.setFill(color(255, 0, 0, alphaColibri));
    piuma.shape.setFill(color(17, 230, 247, alphaPiuma));
  }
  if (keyPressed && key == ' ') {
    alphaColibri=alphaColibri+alphaColibriIncreas;
    alphaPiuma=alphaPiuma-alphaPiumaIncrease;
  }
}
