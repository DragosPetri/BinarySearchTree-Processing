class TREE{
  
       Node root; // macht eine neue Node fur den Anfang
  
       int xSpacing = 150;
       int ySpacing = 100;
       int extent = 60;
       int textSizee = 13;
  
   void drawNode(int x, int y, int extent, int keey, int count ) {
             
             fill(255);
             stroke(255);
             circle(x, y, extent);
             noFill();
             strokeWeight(2);
             stroke(0);
             circle(x, y, extent);
             fill(0, 102, 0); // das verandert die Farbe des Textes
             textSize(textSizee);
             text(keey, x-6, y+5);   // es schreibt den Wert der Node an den Koord. x und y an
             text("( "+ count + " )", x-10, y+18);       
             
     
   }
   
   void drawLeftLine(int x, int y) {
    
     line(x , y+extent/2 , x-xSpacing, y+ySpacing-extent/2);
     
   }
   
   void drawRightLine(int x, int y) {
    
     line(x , y+extent/2 , x+xSpacing, y+ySpacing-extent/2);
     
   }
   
   
   
  
   void addNode(int keey) { // funktion fur addieren von Nodes ( wie bei den Listen )
   
   
       int x=width/2, y = height/10; // diese sind Koordinaten die man " global " definiert hat
       Node newNode = new Node(keey); // wir machen eine neue Node newNode und initializieren sie mit dem Wert eingegeben  (keey)
    
    
     if ( root == null )  {
      
             root = newNode; // wenn root leer ist fullen wir es mit newNode
             
              root.x=x;
              root.y=y;
                          
             }

      else  { // wenn er nicht leer ist
      
      Node focusNode = root;  // erstens machen wir eine neue Node auf die wir " schauen " und initializiern sie mit root weil wir immer von oben anfangen
      
      Node parent; // wir machen schon eine neue Node gennant parent
      
      while (true) { // unendliche Schleife die wir irgendwann beenden mussen
      
        
        parent = focusNode; // parent wird die Node auf die wir " schauen "
        
        if ( keey == focusNode.keey) {
          
             focusNode.count++;
             
             newNode.x=x;
             newNode.y=y;
                                      
             return;
        }
        
        if ( keey < focusNode.keey ) { // wenn der eingegebene Wert kleiner ist als der Wert der Node auf die wir " schauen " mach das :
            
             x-=xSpacing;
             y+=ySpacing;
             
             focusNode = focusNode.leftChild; // Wir schauen jetzt auf den linken " Kind " der Node auf die wir " schauen " ( weil Links fur uns kleiner bedeutet )
            
           if ( focusNode == null ) { // wenn die Node auf die wir " schauen " leer ist mach das:
             
             newNode.x=x;
             newNode.y=y;
             
              
             parent.leftChild = newNode; // parent.leftChild ist die Node auf die wir " schauen " und wir wissen,
                                         // dass sie leer ist darum machen wir sie gleich mit der Node die wir einfugen wollen
             
            
           
             return; // das beendet die unendliche Schleife
      
             }
            
        } else {  // hier wird analog wie oben gearbeitet aber fur den rechten " Kind " ( weil Rechts fur uns grosser bedeutet)
         
             x+=xSpacing;
             y+=ySpacing;
         
             focusNode = focusNode.rightChild;  
          
         if ( focusNode == null ) {
              
             newNode.x=x;
             newNode.y=y;
           
             parent.rightChild = newNode;
             
             
             
            
       
             return; 
             
      }
     }  
    } 
   }
  }
   
  void drawTree (Node focusNode) { // das ist eine Funktion die den Tree liest und ihn geordnet anschreibt
    //( man kann diese Funtion leicht in eine Such Funktion umwandeln)
    // Die Funktion geht im Prinzip nur Links bis es auf null antrifft, dann weil sie rekursiv ist wird sie ein Schritt zuruck gehen
    //und dann ist sie and den kleinsten
    // Wert angelangt und dann geht sie Rechts und wenn sie dort nichts findet geht sie zwei Schritte zuruck wegen Rekursivitat
          
                
          if (focusNode != null ) {    // man geht bis man null gefunden hat also nichts
               
           drawNode(focusNode.x, focusNode.y, extent, focusNode.keey, focusNode.count ); 
           
           if (focusNode.leftChild != null)
           drawLeftLine(focusNode.x, focusNode.y);
           
           drawTree (focusNode.leftChild); // rekursivitat => wir benutzen diesmal den linken " Kind " damit wir ans kleinste Wert angelangen
           
           if (focusNode.rightChild != null)   
           drawRightLine(focusNode.x, focusNode.y); 
           
           drawTree (focusNode.rightChild); // hier geht man Rechts wenn man links nicht mehr kann 
                          
  }  
 }             
}
