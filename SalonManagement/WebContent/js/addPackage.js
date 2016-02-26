function addElement() { 
  // create a new div element 
  // and give it some content 
  var newDiv = document.createElement("div"); 
  var newSelect =  document.createElement("select");
  var newOption = document.createElement("option");
  var node1 = document.createTextNode("Package 1");


  newDiv.setAttribute('class', input-field col s6);
  newSelect.setAttribute('id', newpackage-list);


  newSelect.appendChild(newOption);
  newDiv.appendChild(newSelect); //add the text node to the newly created div. 

  // add the newly created element and its content into the DOM 
  var currentDiv = document.getElementById("div1"); 
  document.body.insertBefore(newDiv, currentDiv); 
}