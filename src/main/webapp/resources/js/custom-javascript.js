/**
 * Created by TD on 6/10/2015.
 */
function checkAll(field)
{
    for (i=0; i < field.length; i++)
    {   field[i].checked = true; }
}
function Chargement()
{
    var obj = document.getElementById("id_erreur");
    if (obj.value!='')
        alert('Erreur signalée  : "'+obj.value+"'");
}