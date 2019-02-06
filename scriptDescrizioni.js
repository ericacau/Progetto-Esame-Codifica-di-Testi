$(document).ready(function () {
    //chiama le varie funzioni
    nascondi_cartoline_default();
    //nasconde le cartoline e visualizza solo il fronte della prima
    $("#selezioneCartolina").change(select_fronte);
    //visualizza il fronte della cartolina selezionata
    $(".bottone_fronte").click(visualizza_fronte);
    $(".bottone_retro").click(visualizza_retro);
    
});

//nasconde la descrizione del recto, il contenitore con l'img del recto, visualizzando solo il fronte della 006
function nascondi_cartoline_default() {
    $('.seconda').hide();
    $(".terza").hide();
    $(".contenitore_retro").hide();
    $("#desc_retro").hide();
    $(".bottone_ruota").hide();
}

//visualizza il fronte della cartolina selezionata
function select_fronte() {
    nascondi_cartoline_default();
    visualizza_fronte();
    if ($("#selezioneCartolina").val() == 'Coppia di innamorati') {
        $(".prima").show();
        $(".seconda").hide();
        $(".terza").hide();
    }
    if ($("#selezioneCartolina").val() == 'Giulietta e Romeo') {
        $(".prima").hide();
        $(".seconda").show();
        $(".terza").hide();
    }
    if ($("#selezioneCartolina").val() == 'La Madonna del cardellino') {
        $(".prima").hide();
        $(".seconda").hide();
        $(".terza").show();
    }
}

//funzioni per la visualizzazione del retro delle cartoline
function visualizza_retro() {
    $(".bottone_retro").css("background-color", "#663330");
    $(".bottone_fronte").css("background-color", "white");
    $(".bottone_fronte").css("color", "#663330");
    $(".bottone_retro").css("color", "white");
    $(".contenitore_retro").show();
    $("#desc_retro").show(800);
    $("#desc_fronte").hide();
    $(".bottone_ruota").show();
    $(".contenitore_fronte").hide();
    select_retro();
}

function select_retro() {
    if ($("#selezioneCartolina").val() == 'Coppia di innamorati') {
        $("#Retro_2").show();
        $("#Retro_4").hide();
        $("#Retro_6").hide();
        $("#cartolina_facs_006_r").show();
        $("#cartolina_facs_007_r").hide();
        $("#cartolina_facs_193_r").hide();
        $("#trascrizione_testo1").show();
        $("#trascrizione_testo2").hide();
        $("#trascrizione_testo3").hide();
        $(".timbri_francobolli").hide();
        $(".bottone_ruota").hide();
    }
    if ($("#selezioneCartolina").val() == 'Giulietta e Romeo') {
        $("#Retro_2").hide();
        $("#Retro_4").show();
        $("#Retro_6").hide();
        $("#cartolina_facs_006_r").hide();
        $("#cartolina_facs_007_r").show();
        $("#cartolina_facs_193_r").hide();
        $(".bottone_ruota").hide();
        $("#trascrizione_testo2").show();
        $("#trascrizione_testo3").hide();
        $("#trascrizione_testo1").hide();
        $(".timbri_francobolli").hide();
    }
    if ($("#selezioneCartolina").val() == 'La Madonna del cardellino') {
        $("#Retro_2").hide();
        $("#Retro_4").hide();
        $("#Retro_6").show();
        $("#cartolina_facs_006_r").hide();
        $("#cartolina_facs_007_r").hide();
        $("#cartolina_facs_193_r").show();
        $("#trascrizione_testo3").show();
        $("#trascrizione_testo2").hide();
        $("#trascrizione_testo1").hide();
        $(".timbri_francobolli").show();
    }
}

function visualizza_fronte() {
    $(".bottone_fronte").css("background-color", "663330");
    $(".bottone_retro").css("background-color", "white");
    $(".bottone_retro").css("color", "#663330");
    $(".bottone_fronte").css("color", "white");
    $(".contenitore_retro").hide();
    $("#desc_retro").hide();
    $("#desc_fronte").show(800);
    $(".contenitore_fronte").show();
}

//funzioni per evidenziare le righe
function puntatore(area) {
    $(area).css("visibility", "visible");
}

function puntatore_base(area) {
    $(area).css("visibility", "hidden");
}
