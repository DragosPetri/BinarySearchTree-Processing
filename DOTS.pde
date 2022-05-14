

void setup() {
  
  size (1800, 900); // macht den " CANVAS "
  
  background(170); // der Hintergrund wird grau
  
 // TREE tree = new TREE(); // mach einen neuen TREE Objekt
  
 // tree.core(); // rufe die method core()  des Objekten tree auf
  
}

int lol=0;
TREE tree = new TREE();

void draw() { 
     
}

void keyPressed() {
  
    
  if (key > '9' || key < '0')  {
   
    if (keyCode == ENTER) {
    tree.addNode(lol); 
    tree.drawTree(tree.root);
    lol = 0;
    }
    
  } else { 
    lol= lol*10 + (key-'0');
    
  }

}
