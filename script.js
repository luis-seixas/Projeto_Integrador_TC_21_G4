let countx = 1;
document.getElementById("radio1").checked = true;

setInterval( function(){
nextImage();
},3000)

function nextImage(){
    countx++;
    if(countx>4){
        countx = 1;
    }
    document.getElementById("radio"+countx).checked = true;
}