function cambiaFoto (n) {
    var i;
    
    if (n > nodoImmaginiGrandi.length) {
        slideIndex = 1;
    }
    if (n < 1) {
        slideIndex = nodoImmaginiGrandi.length;
    }
    for (i = 0; i < nodoImmaginiGrandi.length; i++) {
        nodoImmaginiGrandi[i].style.display = "none";
    }
    for (i = 0; i < nodoImmaginiPiccole.length; i++) {
        nodoImmaginiPiccole[i].className = nodoImmaginiPiccole[i].className.replace(" active", "");
    }
    nodoImmaginiGrandi[slideIndex -1].style.display = "block";
    nodoImmaginiPiccole[slideIndex -1].className += " active";
}

function gestoreAvanti(n) {
    cambiaFoto(slideIndex += n);
}

function immagineCorrente(n) {
    cambiaFoto(slideIndex = n);
}

function gestoreResize() {
    try {
        var attualeDimensioneFoto = nodoCartolina1.width;
        var ratio = attualeDimensioneFoto / dimensioneFoto;
        for (var i = 0; i < nodiArea.length; i++) {
            for (var j = 0; j < coordinateAree[i].length; j++) {
                coordinateAree[i][j] *= ratio;
            }
            nodiArea[i].coords = coordinateAree[i].join(',');
        }
        dimensioneFoto = attualeDimensioneFoto;
    }
    catch (e) {
        alert("gestoreResize " + e);
    }
}

function gestoreRuota () {
    try {
        
    } catch (e) {
        alert("gestoreRuota " + e);
    }
}

const LARGHEZZA_ORIGINALE = 829;
var slideIndex = 1;
var nodoImmaginiGrandi;
var nodoImmaginiPiccole;
var nodoAvanti;
var nodoIndietro;
var nodoCartolina1;
var nodoCartolina2;
var nodoCartolina3;
var nodiArea;

function gestoreLoad () {
    try {
        nodoImmaginiGrandi = document.getElementsByClassName("galleria");
        nodoImmaginiPiccole = document.getElementsByClassName("img_piccole");
        nodoAvanti = document.getElementById("avanti");
        nodoIndietro = document.getElementById("indietro");
        nodoCartolina1 = document.getElementById("Retro_2");
        nodiArea = document.getElementsByTagName("area");
        bottoneRuota = document.getElementsByClassName("bottone_ruota");
        coordinateAree =[];
        for (var i = 0; i < nodiArea.length; i++) {
            var nodoArea = nodiArea[i];
            coordinateAree[i] = nodoArea.coords.split(',');
        }
        dimensioneFoto = LARGHEZZA_ORIGINALE;
        window.onresize = gestoreResize;
        gestoreResize();
        cambiaFoto(slideIndex);
        
    }
    catch (e) {
        alert("gestoreLoad " + e);
    }
}

window.onload = gestoreLoad;