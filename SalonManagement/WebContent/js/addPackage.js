
function myFunction() {
    var table = document.getElementById("packageTable");
    var packageType = $("#package-list").val();
    var packageQuant = $("#package_quantity").val();
    var removeBtn = document.createElement('button');
   
    var row = table.insertRow(0);
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2); 
    cell1.innerHTML = packageType;
    cell2.innerHTML = packageQuant;
    cell3.innerHTML = '<input id="Button" type="button" value="Remove" class = "waves-effect waves-light btn red" onclick="deleteRow(this)" />';
    var x = document.getElementById("package-list");
        x.remove(x.selectedIndex);
}

function deleteRow(row)
{
    var i=row.parentNode.parentNode.rowIndex;
    document.getElementById('packageTable').deleteRow(i);
    var packageText = document.getElementById("packageTable").rows[i].cells[0].innerHTML;
    alert(packageText);
    var y = document.getElementById("package-list");
    var option = document.createElement("option");
    option.text = packageText;

    y.add(option);
}