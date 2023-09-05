//Funzione che viene letta al caricamento della pagina
$(document).ready(function(){
    //Dichiarazione delle variabili
    var click;
    var riquadro = $(".riquadro");
    var span = $("span");
    var area = $("area");
    var child = $("span").children();
    var image = $(".foto");
    var testo = $(".testo-fr"); 
    var testoIta = $(".testo-it");
    var titolo = $(".titlephoto");
    var cambio = true;
    var count = 1;
    var n;
    var versione = 0;
    var cancellature = 0;
    var collegamento = 0;
    var traduzione = 0;
    var id_visualizzato;
    var id_test;
    var aggiunte = 0;
    var punteggiatura = 0;
    var abbreviazioni = 0;
    var numeri = 0;
    var termini = 0;
    var date = 0;
    var toponimi = 0;
    var lingue = 0;
    var titoli = ['Pagina 8 - prima sezione', 'Pagina 8 - seconda sezione', 'Pagina 9 - prima sezione', 'Pagina 9 - seconda sezione']
    //Richiamo alla funzione che nasconde il testo in italiano 
    nascondiTesto();

    //Funzione che gestisce il bottone della traduzione, al primo click nasconde il testo originale e mostra quello in italiano
    //Al secondo click, torna il testo originale nascondendo la traduzione, tutto questo a seconda dell'immagine visualizzata.
    $("#traduzione").click(function(){
        if (traduzione == 0) {
            for (i = 0; i < testo.length; i++) {
                var display = $(testo[i]).css('display');
                if (display == 'block') {
                    id_visualizzato = testo[i].id.substring(0, 8);
                }                
            }
            for (i = 0; i < testoIta.length; i++) {
                id_test = testoIta[i].id.substring(0, 8);
                if (id_visualizzato == id_test) {
                    document.getElementById(id_visualizzato + '-fr').style.display = 'none';
                    document.getElementById(id_test + '-it').style.display = 'block';
                }
            }
            $("#traduzione").html("torna all'originale");
            traduzione = 1;
        } else {
            for (i = 0; i < testoIta.length; i++) {
                var display = $(testoIta[i]).css('display');
                if (display == 'block') {
                    id_visualizzato = testoIta[i].id.substring(0, 8);
                }                
            }
            for (i = 0; i < testo.length; i++) {
                id_test = testo[i].id.substring(0, 8);
                if (id_visualizzato == id_test) {
                    document.getElementById(id_visualizzato + '-it').style.display = 'none';
                    document.getElementById(id_test + '-fr').style.display = 'block';
                }
            }
            $("#traduzione").html("visualizza traduzione");
            traduzione = 0;
        }
    });

    $("#versione").click(function () {
        if (versione == 0) {
            $(".g").fadeIn();
            $(".del").fadeIn();
            $(".original").show();
            $(".abbreviazione").show();
            $(".regolarizzazione").hide();
            $(".expan").hide();
            $("#versione").html("versione normalizzata");
            versione = 1;
        } else {
            $(".g").fadeOut();
            $(".del").fadeOut();
            $(".original").hide();
            $(".abbreviazione").hide();
            $(".regolarizzazione").show();
            $(".expan").show();
            $("#versione").html("versione originale");
            versione = 0;
        }
    });
    
    $("#cancellature").click(function () {
        if(cancellature == 0) {
            $(".del").fadeIn();
            $(".del").css('color', 'red');
            $("#cancellature").css('color', 'red');
            $("#cancellature").html("nascondi testo cancellato");
            cancellature = 1;
        } else {
            $(".del").fadeOut();
            $("#cancellature").css('color', 'black');
            $("#cancellature").html("mostra testo cancellato");
            cancellature = 0;
        }
    });

    $("#aggiunte").click(function () {
        if(aggiunte == 0) {
            $(".add").css('color', 'chocolate');
            $("#aggiunte").css('color', 'chocolate');
            $("#aggiunte").html("nascondi testo aggiunto");
            aggiunte = 1;
        } else {
            $(".add").css('color', 'black');
            $("#aggiunte").css('color', 'black');
            $("#aggiunte").html("mostra testo aggiunto");
            aggiunte = 0;
        }
    });

    $("#punteggiatura").click(function () {
        if(punteggiatura == 0) {
            $(".prof").show();
            $(".eliminati").hide();
            $(".prof").css('color', 'DarkRed');
            $("#punteggiatura").css('color', 'DarkRed');
            $("#punteggiatura").html("mostra punteggiatura originale");
            punteggiatura = 1;
        } else {
            $(".prof").hide();
            $(".eliminati").show();
            $("#punteggiatura").css('color', 'black');
            $("#punteggiatura").html("mostra punteggiatura normalizzata");
            punteggiatura = 0;
        }
    });

    $("#abbreviazioni").click(function () {
        if(abbreviazioni == 0) {
            $(".expan").show();
            $(".abbreviazione").hide();
            $("#abbreviazioni").html("Torna alle abbreviazioni");
            $(".expan").css('color', 'Tomato');
            $("#abbreviazioni").css('color', 'Tomato');
            abbreviazioni = 1;
        } else {
            $(".expan").hide();
            $(".abbreviazione").show();
            $("#abbreviazioni").html("Mostra espansione abbreviazioni");
            $("#abbreviazioni").css('color', 'black');
            abbreviazioni = 0;
        }
    });

    $("#numeri").click(function () {
        if(numeri == 0) {
            $(".original").hide();
            $(".regolarizzazione").show();
            $("#numeri").html("mostra numeri originali");
            $("#numeri").css('color', 'SeaGreen');
            $(".regolarizzazione").css('color', 'SeaGreen');
            numeri = 1;
        } else {
            $(".original").show();
            $(".regolarizzazione").hide();
            $("#numeri").html("mostra numeri normalizzati");
            $("#numeri").css('color', 'black');
            numeri = 0;
        }
    });

    $("#termini").click(function () {
        if(termini == 0) {
            $(".terminologia").css('background-color', 'yellow');
            $("#termini").html('nascondi elementi terminologici');
            $("#termini").css('color', 'yellow');
            termini = 1;
        } else {
            $(".terminologia").css('background-color', 'transparent');
            $("#termini").html('mostra elementi terminologici');
            $("#termini").css('color', 'black');
            termini = 0;
        }
    }); 
   

    $("#date").click(function () {
        if(date == 0) {
            $(".date").css('background-color', 'DarkGreen');
            $("#date").html('nascondi date o eventi databili');
            $("#date").css('color', 'DarkGreen');
            date = 1;
        } else {
            $(".date").css('background-color', 'transparent');
            $("#date").html('mostra date o eventi databili');
            $("#date").css('color', 'black');
            date = 0;
        }
    });

    $("#toponimi").click(function () {
        if(toponimi == 0) {
            $(".toponimo").css('background-color', 'DarkRed');
            $("#toponimi").html('nascondi toponimi');
            $("#toponimi").css('color', 'DarkRed');
            toponimi = 1;
        } else {
            $(".toponimo").css('background-color', 'transparent');
            $("#toponimi").html('mostra toponimi');
            $("#toponimi").css('color', 'black');
            toponimi = 0;
        }
    });

    $("#lingue").click(function () {
        if(lingue == 0) {
            $(".lingua").css('background-color', 'Olive');
            $("#lingue").html('nascondi lingue');
            $("#lingue").css('color', 'Olive');
            lingue = 1;
        } else {
            $(".lingua").css('background-color', 'transparent');
            $("#lingue").html('mostra lingue');
            $("#lingue").css('color', 'black');
            lingue = 0;
        }
    });

    function nascondiTesto() {
        for(i = 0; i < testoIta.length; i++) {
            testoIta[i].style.display = 'none';
        }
    }
    
    for (i = 0; i < testo.length; i++) {
        if (testo[i].id.substring(5) != '8-1-fr') {
            testo[i].style.display = 'none';
        }
    }

    for(i = 0; i < image.length; i++) {
        if (image[i].id.substring(6) != 'pg8') {
            image[i].style.display = 'none';
        }
    }

    for (i = 0; i < titolo.length; i++) {
        if(titolo[i].id.substring(6) == 'pg8') {
            titolo.html('Pagina 8 - prima sezione');
        }
    }


    $("#avanti").click(function () {
        n = 1;
        if (cambio) {
            cambiaFoto(count += n);
        }
        nascondiTesto();
        traduzione = 0;
        $("#traduzione").html("visualizza traduzione");
    });
          
    $("#indietro").click(function() {
        n = -1;
        if (cambio) {
            cambiaFoto(count += n);
        }
        nascondiTesto();
        traduzione = 0;
        $("#traduzione").html("visualizza traduzione");
    });

    function cambiaFoto (n) {
        if (n > image.length) {
            count = 1;
        }
        if (n < 1) {
            count = image.length;
        }
        for (i = 0; i < testo.length; i++) {
            testo[i].style.display = 'none';
        }
        for (i = 0; i < image.length; i++) {
            image[i].style.display = "none";
        }
        $(image[count-1]).css('display', 'block');      
        $(testo[count-1]).css('display', 'block');      
        titolo.html(titoli[count-1]);
    }
 
    $("#collegamento").click(function () {
        if(collegamento == 0) {
            $("map").show();
            $("map").css('cursor', 'pointer');
            $("span").css('cursor', 'pointer');
            $("#collegamento").html("nascondi collegamento testo-immagine");
            for ( i = 0; i < child.length; i++) {
                child[i].addEventListener("mouseover", colorMapFromText);
                child[i].addEventListener("mouseout", deletecolorMapFromText);
            }
            for ( i = 0; i < span.length; i++) {
                span[i].addEventListener("mouseover", colorMapFromText);
                span[i].addEventListener("mouseout", deletecolorMapFromText);
            }
            for ( i = 0; i < riquadro.length; i++) {
                riquadro[i].addEventListener("mouseover", colorTextFromMap);
                riquadro[i].addEventListener("mouseout", deletecolorTextFromMap);
            }
            span.click(function(event) {
                for (i = 0; i < child.length; i++) {
                    var ch = child[i];
                    var color = $(ch).css('background-color');
                    if(color == 'rgba(255, 255, 0, 0.5)') {
                        $(ch).css('background-color', 'transparent');
                    }
                }
                for (i = 0; i < span.length; i++) {
                    var sp = span[i];
                    var color = $(sp).css('background-color');
                    if(color == 'rgba(255, 255, 0, 0.5)') {
                        $(sp).css('background-color', 'transparent');
                    }
                }
                for (i = 0; i < area.length; i++) {
                    var areas = area[i];
                    var colorArea = $(areas).css('background-color');
                    if(colorArea == 'rgba(255, 255, 0, 0.5)') {
                        $(areas).css('background-color', 'transparent');
                    }
                }
                var id = event.target.id;
                if(id == ""){
                    var target = event.target;
                    id = target.parentNode.id;
                }
                var testo = document.getElementById(id);
                var mappa = document.getElementById(testo.id.substring(5));       
                $(testo).css("background-color", "rgba(255,255,0,0.5)");
                $(mappa).css("background-color", "rgba(255,255,0,0.5)");
                click = true;      
            });
            riquadro.click(function (event) {
                for (i = 0; i < child.length; i++) {
                    var ch = child[i];
                    var color = $(ch).css('background-color');
                    if(color == 'rgba(255, 255, 0, 0.5)') {
                        $(ch).css('background-color', 'transparent');
                    }
                }
                for (i = 0; i < span.length; i++) {
                    var sp = span[i];
                    var color = $(sp).css('background-color');
                    if(color == 'rgba(255, 255, 0, 0.5)') {
                        $(sp).css('background-color', 'transparent');
                    }
                }
                for (i = 0; i < area.length; i++) {
                    var areas = area[i];
                    var colorArea = $(areas).css('background-color');
                    if(colorArea == 'rgba(255, 255, 0, 0.5)') {
                        $(areas).css('background-color', 'transparent');
                    }
                }
                var p = document.getElementById('span-'+event.target.id);              
                $(p).css("background-color", "rgba(255,255,0, 0.5)");
                $(this).css("background-color", "rgba(255,255,0, 0.5)");
                click = true;                
            });
            collegamento = 1;
        } else {
            riquadro.off('click');
            span.off('click');
            $("map").hide();
            $("span").css('cursor', 'auto');
            $("#collegamento").html("mostra collegamento testo-immagine");
            for ( i = 0; i < child.length; i++) {
                child[i].removeEventListener("mouseover", colorMapFromText);
                child[i].removeEventListener("mouseout", deletecolorMapFromText);
            }
            for ( i = 0; i < span.length; i++) {
                span[i].removeEventListener("mouseover", colorMapFromText);
                span[i].removeEventListener("mouseout", deletecolorMapFromText);
            }
            for ( i = 0; i < riquadro.length; i++) {
                riquadro[i].removeEventListener("mouseover", colorTextFromMap);
                riquadro[i].removeEventListener("mouseout", deletecolorTextFromMap);
            }
            for (i = 0; i < child.length; i++) {
                var ch = child[i];
                var color = $(ch).css('background-color');
                if(color == 'rgba(255, 255, 0, 0.5)') {
                    $(ch).css('background-color', 'transparent');
                }
            }
            for (i = 0; i < span.length; i++) {
                var sp = span[i];
                var color = $(sp).css('background-color');
                if(color == 'rgba(255, 255, 0, 0.5)') {
                    $(sp).css('background-color', 'transparent');
                }
            }
            for (i = 0; i < area.length; i++) {
                var areas = area[i];
                var colorArea = $(areas).css('background-color');
                if(colorArea == 'rgba(255, 255, 0, 0.5)') {
                    $(areas).css('background-color', 'transparent');
                }
            }
            collegamento = 0;
        }
    });
    function colorTextFromMap(event){
        var p = document.getElementById('span-'+event.target.id);
        var ita = document.getElementById('ita-'+event.target.id);
        var map = event.target;
        var color = $(p).css('background-color');
        if(color == 'rgba(255, 255, 0, 0.5)') {
            $(p).css('background-color', 'rgba(255,255,0, 0.5');
            $(map).css('background-color', 'rgba(255,255,0, 0.5');
            $(ita).css('background-color', 'rgba(255,255,0, 0.5');
        } else {
            $(p).css("background-color", "rgba(255, 0, 0, 0.4)");
            $(map).css('background-color', 'rgba(255, 0, 0, 0.4)');
            $(ita).css('background-color', 'rgba(255, 0, 0, 0.4)');
        }
    }

    function deletecolorTextFromMap(event) {
        var p = document.getElementById('span-'+event.target.id);
        var ita = document.getElementById('ita-'+event.target.id);
        var map = event.target;
        var color = $(p).css('background-color');
        if (click == true) {
            $(this).css("background-color", "rgba(255,255,0, 0.5)"); 
            $(p).css("background-color", "rgba(255,255,0, 0.5)"); 
            $(ita).css("background-color", "rgba(255,255,0, 0.5)"); 
            click = false;
        } 
        if(color == 'rgba(255, 255, 0, 0.5)') {
            $(p).css('background-color', 'rgba(255,255,0, 0.5');
            $(map).css('background-color', 'rgba(255,255,0, 0.5');
            $(ita).css('background-color', 'rgba(255,255,0, 0.5');
        } else {
            $(p).css("background-color", "transparent");
            $(map).css('background-color', 'transparent');
            $(ita).css('background-color', 'transparent');
        }
    }

    function colorMapFromText(event){
        var id = event.target.id;
        if(id == ""){
            var target = event.target;
            id = target.parentNode.id;
        }
        var testo = document.getElementById(id);
        var itaMap = document.getElementById(testo.id.substring(4));
        var mappa = document.getElementById(testo.id.substring(5));
        var color = $(testo).css('background-color');
        if(color == 'rgba(255, 255, 0, 0.5)' ) {
            $(testo).css('background-color', 'rgba(255,255,0, 0.5');
            $(mappa).css('background-color', 'rgba(255,255,0, 0.5');
            $(itaMap).css('background-color', 'rgba(255,255,0, 0.5');
        } else {
            $(testo).css("background-color", "rgba(255, 0, 0, 0.4)");
            $(mappa).css("background-color", "rgba(255, 0, 0, 0.4)");
            $(itaMap).css("background-color", "rgba(255, 0, 0, 0.4)");
        }
    }

    function deletecolorMapFromText(event) {
        var id = event.target.id;
        if(id == ""){
            var target = event.target;
            id = target.parentNode.id;
        }
        var testo = document.getElementById(id);
        var itaMap = document.getElementById(testo.id.substring(4));
        var mappa = document.getElementById(testo.id.substring(5));
        var color = $(testo).css('background-color');
        if (click == true) {
            $(this).css("background-color", "rgba(255,255,0, 0.5)"); 
            $(mappa).css("background-color", "rgba(255,255,0, 0.5)"); 
            $(testo).css("background-color", "rgba(255,255,0, 0.5)"); 
            $(itaMap).css("background-color", "rgba(255,255,0, 0.5)"); 
            click = false;
        } 
        if (color == 'rgba(255, 255, 0, 0.5)') {
            $(testo).css('background-color', 'rgba(255,255,0, 0.5');
            $(mappa).css('background-color', 'rgba(255,255,0, 0.5');
            $(itaMap).css('background-color', 'rgba(255,255,0, 0.5');
        } else {
            $(testo).css("background-color", "transparent");
            $(mappa).css("background-color", "transparent");
            $(itaMap).css("background-color", "transparent");
        }   
    }
});