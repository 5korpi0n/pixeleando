PImage img;
int smallPoint,     // Tamaño del punto a dibujar
    figure,         // Figura a utilizar. Si es 1=Elipse, 2=Cuadrado, 3=Triangulo 
    medio,          // La mitan del tamaño del punto (para no calcularlo a cada rato) 
    MAX_POINT;      // Constante donde defino el tamaño maximo del "punto"

void setup() {
  size(10, 10);                                // Defino el lienzo de 10x10, aunque despues lo pongo del tamaño de la imagen
  img = loadImage("maxresdefault-4.jpg");             // Cargo la imagen que voy a usar
  surface.setResizable(true);                  // Le indico que el lienzo es resizable
  surface.setSize(img.width, img.height);      // Le asigno al lienzo el ancho y alto de la imagen
  MAX_POINT = 10;                              // Defino el tamaño maximo de 10 pixeles
  imageMode(CENTER);                           // Centro la imagen
  noStroke();                                  // Sin bordes
  background(255);                             // Pongo todo el fondo de color blanco
}

void draw() {
  for(int i=0; i<(img.width / MAX_POINT); i++) {  // Repito el proceso segun el ancho de la imagen dividido por el mayor tamaño de punto
//    float pointillize = map(mouseX, 0, width, smallPoint, largePoint);
    int x = int(random(img.width));            // Tomo un valor x al azar entre 0 y el ancho de la imagen
    int y = int(random(img.height));           // Tomo un valor y al azar entre 0 y el alto de la imagen 
    
    smallPoint = 1+ int(random(MAX_POINT));    // Tomo un valor al azar entre 1 y el valor Maximo de punto
    medio = smallPoint / 2;                    // A "medio" le asigno la parte entera del tamaño del punto / 2

    color pix = img.get(x, y);                 // Tomo el color del pixel de la imagen original en la posicion (x, y)
    
    
    fill(pix, 128);                            // Indico que la figura que voy a dibujar la voy a llenar con el color obtenido

//    figure = 1 + int(random(3)); // 1 = ellipse, 2=box 3=triangle
    figure = 1 + ( mouseX / (img.width / 3 ) );      // Dependiendo sonde se encuentre el mouse X, va a devolver 1, 2, 3 (1er tercio, 2do tercio, 3er tercio)

    if ( figure == 1 ) {                                               // Si figura == 1, es una elipse 
      ellipse(x, y, smallPoint, smallPoint);                           // dibujo una elipce con centro en (x, y) con radios del punto elegido
    } else if ( figure == 2 ) {                                        // Si figura == 2, es un cuadrado
      rect(x - medio, y - medio, smallPoint, smallPoint);              // Hago un rectangulo, restandole a "x" el "medio" y a "y" el "medio" para el primer punto
                                                                       //   y sumo a "x" el "medio" y a "y" el "medio" para el segundo punto,  
                                                                       //   asi (x,y) quedan en medio del cuadrado
    } else if ( figure == 3 ) {                                        // Si figura == 1, es un triangulo
      triangle(x,y, x+smallPoint/2, y-smallPoint, x+smallPoint, y);    // Dibujo un triangulo, donde primero pongo un vertice en (x, y), 
                                                                       //  luego, del tamaño del punto, tomo la mitad, y me desplazo hacia y+punto
                                                                       //  con eso obtengo el 2do punto que es la cima del triangulo. Por ultimo
                                                                       //  a x le sumo el punto y dejo la "y" asi obtengo el 3er punto alineado con  
                                                                       //  el primero y asi obtengo la base del triangulo
                                                                       //
                                                                       //                         *  (x+(p/2), y-p)
                                                                       //
                                                                       //
                                                                       //              (x,y) *          * (x+p, y)
    }
//    println(figure);
  }
}
