class Node{
 
 int keey; // variable fur Wert der NODE
 int count=1;
 int x, y;
 
 Node leftChild;  // Neue Node fur kleinere Werte
 Node rightChild; // neue Node fur grossere Werte
 
 Node(int keey){ // Contructor Funktion
      
   this.keey = keey;  // macht das obige keey gleich mit dem lokalen keey
   
 }
}
