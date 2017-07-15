var VER = 1;
var ABRIR = 2;
var SOBRE = 3;
var ALEJA = 4;
var ETIQUETA = 5;
var ENLACE = 6;
var alturaBton = 15;

var celda1Odd = null;
var celda2Odd = null;
var anclaOdd = null;
var nOdd = 0;
var celda1Enlace = null;
var celda2Enlace = null;
var anclaEnlace = null;
var nEnlace = 0;
var etqOdd = new Etiqueta("R1");
var etq;
var ena = true;
var htmlMENU;
var seccion = -1;
var seccion2 = "";
var seccion3 = "";

function Etiqueta(opt, n) {
    this.f1 = document.getElementById(opt);
    this.f2 = document.getElementById("C" + opt);
    this.f3 = document.getElementById("CA" + opt);
    this.f4 = document.getElementById("A" + opt);
    this.f5 = document.getElementById("B" + opt);
    this.f6 = document.getElementById("BL" + opt);
    this.an = document.getElementById("Ancla_" + opt);
    this.n = n;
}
function accionar(accion, tipo, opt, n) {
    switch (accion) {
        case VER:
            if (ena) {
                ena = false;
                etq = new Etiqueta(opt);
                var nro = -1;
                var nro2 = "";
                var nro3 = "";
                if (n == 0) {
                    nro = parseInt(etq.f1.id.substring(5, 6));
                    if (seccion != -1 && seccion != nro)
                        ocultarEtiqueta("Item_" + seccion, 0);
                    seccion = nro;
                } else if (n == 1) {
                    var vec = etq.f1.id.split("_");
                    nro2 = vec[1] + "_" + vec[2];
                    if (seccion2 != "" && seccion2 != nro2)
                        ocultarEtiqueta("Item_" + seccion2, 1);
                    seccion2 = nro2;
                } else if (n == 2) {
                    var vec = etq.f1.id.split("_");
                    nro3 = vec[1] + "_" + vec[2] + "_" + vec[3];
                    if (seccion3 != "" && seccion3 != nro3)
                        ocultarEtiqueta("Item_" + seccion3, 2);
                    seccion3 = nro3;
                }
                if (etq.f3.style.display == 'none') {
                    etq.f1.className = 'sobreEtiAbi_' + n;
                    etq.f2.className = 'sobreMenos_' + n;
                    etq.f3.className = 'sobreCol_' + n;
                    etq.f4.className = 'sobreFondo_' + n;
                    etq.f5.className = 'sobreAbajo1_' + n;
                    etq.f6.className = 'sobreAbajo2_' + n;
                    etq.an.className = 'vern' + n;
                    etq.f3.style.display = '';
                    etq.f4.style.display = '';
                    etq.f5.style.display = '';
                    etq.f6.style.display = '';
                } else {
                    etq.f1.className = 'sobreEtiCer_' + n;
                    etq.f2.className = 'sobreMas_' + n;
                    etq.f3.className = 'sobreCol_' + n;
                    etq.an.className = 'vern' + n;
                    etq.f3.style.display = 'none';
                    etq.f4.style.display = 'none';
                    etq.f5.style.display = 'none';
                    etq.f6.style.display = 'none';
                }
                setTimeout('ena=true;', 200);
            }
            break;
        case ABRIR:
            if (ena) {
                ena = false;
                var f1 = document.getElementById(opt[1]);
                var f2 = document.getElementById("C" + opt[1]);
                var an = document.getElementById("Ancla_" + opt[1]);
                if (celda1Enlace != null) {
                    celda1Enlace.className = 'cerrada_' + nEnlace;
                    celda2Enlace.className = 'vin_' + nEnlace;
                    an.className = 'n' + nEnlace;
                }
                f1.className = 'click_' + n;
                f2.className = 'clickVin_' + n;
                an.className = 'clickn' + n;
                nEnlace = n;
                celda1Enlace = f1;
                celda2Enlace = f2;
                anclaEnlace = an;
                if (opt[0] != "") {
                   location.href = contextPath + '/'  + opt[0];
                }
            }
            setTimeout('ena=true;', 200);
            break;
        case SOBRE:
            if (tipo == ENLACE) {
                var f1 = document.getElementById(opt);
                var f2 = document.getElementById("C" + opt);
                var an = document.getElementById("Ancla_" + opt);
                if (celda1Odd != null) {
                    celda1Odd.className = 'cerrada_' + nOdd;
                    celda2Odd.className = "vin_" + nOdd;
                    an.className = 'n' + nOdd;
                }
                if (celda1Enlace == null || f1.id != celda1Enlace.id) {
                    f1.className = 'sobre_' + n;
                    f2.className = 'sobreVin_' + n;
                    an.className = 'sobren' + n;
                    nOdd = n;
                    celda1Odd = f1;
                    celda2Odd = f2;
                    anclaOdd = an;
                }
            } else if (tipo == ETIQUETA) {
                etq = new Etiqueta(opt, n);
                if (etq.f3.style.display == 'none') {
                    etq.f1.className = 'sobreEtiCer_' + n;
                    etq.f2.className = 'sobreMas_' + n;
                    etq.an.className = 'sobren' + n;
                } else {
                    etq.f1.className = 'sobreEtiAbi_' + n;
                    etq.f2.className = 'sobreMenos_' + n;
                    etq.f3.className = 'sobreCol_' + n;
                    etq.f4.className = 'sobreFondo_' + n;
                    etq.f5.className = 'sobreAbajo1_' + n;
                    etq.f6.className = 'sobreAbajo2_' + n;
                    etq.an.className = 'sobren' + n;
                }
                etqOdd = etq;
            }
            break;
        case ALEJA:
            if (tipo == ENLACE) {
                if (celda1Odd != null && (celda1Enlace == null || celda1Odd.id != celda1Enlace.id)) {
                    celda1Odd.className = 'cerrada_' + nOdd;
                    celda2Odd.className = "vin_" + nOdd;
                    anclaOdd.className = 'n' + nOdd;
                }
                celda1Odd = null;
                celda2Odd = null;
                anclaOdd = null;
            } else if (tipo == ETIQUETA) {
                if (etqOdd.f1 != null) {// existe
                    if (etqOdd.f3.style.display == 'none') {
                        etqOdd.f1.className = 'cerrada_' + etqOdd.n;
                        etqOdd.f2.className = 'mas_' + etqOdd.n;
                        etqOdd.an.className = 'n' + etqOdd.n;
                    } else {
                        etqOdd.f1.className = 'abierta_' + etqOdd.n;
                        etqOdd.f2.className = 'menos_' + etqOdd.n;
                        etqOdd.f3.className = 'col_' + etqOdd.n;
                        etqOdd.f4.className = 'fondo_' + etqOdd.n;
                        etqOdd.f5.className = 'abajo1_' + etqOdd.n;
                        etqOdd.f6.className = 'abajo2_' + etqOdd.n;
                        etqOdd.an.className = 'n' + etqOdd.n;
                    }
                }
            }
            break;
    }
}
Item = function (nombre, tipo, opt, toolTip, icono) {
    this.size = 0;
    this.url = null;
    this.nombre = nombre;
    this.items = null;
    this.tipo = tipo;
    this.toolTip = (toolTip != null ? toolTip : nombre).toUpperCase();
    this.icono = icono;
    if (tipo == ENLACE) {
        this.url = opt;
    } else if (tipo == ETIQUETA) {
        this.items = new Array();
    }
}
Item.prototype.add = function (i) {
    if (this.items != null) {
        this.items[this.size] = i;
        this.size = this.size + 1;
    }
}
function crearMenu(menu) {
    var posicion = new Array();
    posicion[0] = 0;//posiciones
    var nivel = 0;//nivel;
    htmlMENU = '<table width="205"  border="0" align="left" cellpadding="0" cellspacing="0">\n';
    for (j = 0; j < menu.length; j++) {
        menu[j].nombre = menu[j].nombre.toUpperCase();
        constructor(posicion, nivel, menu[j]);
        posicion[0] = posicion[0] + 1;
    }
    htmlMENU += '</table>';
    document.getElementById("divMenu").innerHTML = htmlMENU;
}
function constructor(posicion, nivel, objItem) {
    var k = 0;
    var id = "Item";
    var clase = "n" + nivel;
    for (k = 0; k <= nivel; k++)
        id += "_" + posicion[k];
    if (objItem.tipo == ETIQUETA && objItem.size > 0) {// si es etiqueta y tiene sub menus
        // html para abrir y cerrar el submenu
        htmlMENU += '<tr><td width="10" class="mas_' + nivel + '" id="C' + id + '" onMouseOver="accionar(SOBRE,ETIQUETA,\'' + id + '\',' + nivel + ')" onMouseOut="accionar(ALEJA,ETIQUETA,null,' + nivel + ')" onClick="accionar(VER,null,\'' + id + '\',' + nivel + ')">' +
                '</td><td class="cerrada_' + nivel + '" id="' + id + '" onMouseOver="accionar(SOBRE,ETIQUETA,\'' + id + '\',' + nivel + ')" onMouseOut="accionar(ALEJA,ETIQUETA,null,' + nivel + ')" onClick="accionar(VER,null,\'' + id + '\',' + nivel + ')" title="' + objItem.toolTip + '">\n';
        if (objItem.icono != null)
            htmlMENU += '<div class="boton' + nivel + '" style="background-image:url(' + contextPath + '/resources/imagenes/' + objItem.icono + '.gif);background-repeat:no-repeat;background-position:right;">';
        htmlMENU += '<a id="Ancla_' + id + '" href="javascript:accionar(VER,null,\'' + id + '\',' + nivel + ')" onFocus="accionar(SOBRE,ETIQUETA,\'' + id + '\',' + nivel + ')" onBlur="accionar(ALEJA,ETIQUETA,null,' + nivel + ')" class="' + clase + '">' + objItem.nombre + '</a>';
        if (objItem.icono != null)
            htmlMENU += '</div>';
        htmlMENU += '</td></tr><tr><td width="10" class="sobreCol_' + nivel + '" height="15" id="CA' + id + '" onMouseOver="accionar(SOBRE,ETIQUETA,\'' + id + '\',' + nivel + ')" onMouseOut="accionar(ALEJA,ETIQUETA,null,' + nivel + ')" onClick="accionar(VER,null,\'' + id + '\',' + nivel + ')" style="display:none"></td><td id="A' + id + '" style="display:none" class="fondo_' + nivel + '">\n' +
                '<table width="100%"  border="0" align="right" cellpadding="0" cellspacing="0">\n';
        posicion[nivel + 1] = 0;
        for (k = 0; k < objItem.size; k++) {
            posicion[nivel + 1] = posicion[nivel + 1] + 1;
            constructor(posicion, nivel + 1, objItem.items[k]);
        }
        htmlMENU += '</table></td></tr><tr><td width="10" class="abajo2_' + nivel + '" id="BL' + id + '" onMouseOver="accionar(SOBRE,ETIQUETA,\'' + id + '\',' + nivel + ')" onMouseOut="accionar(ALEJA,ETIQUETA,null,' + nivel + ')" onClick="accionar(VER,null,\'' + id + '\',' + nivel + ')" style="display:none">' +
                '</td><td class="abajo1_' + nivel + '" id="B' + id + '" onMouseOver="accionar(SOBRE,ETIQUETA,\'' + id + '\',' + nivel + ')" onMouseOut="accionar(ALEJA,ETIQUETA,null,' + nivel + ')" onClick="accionar(VER,null,\'' + id + '\',' + nivel + ')" style="display:none"></td></tr>';
    } else if (objItem.tipo == ENLACE) {// es una url
        // html para abrir
        htmlMENU += '<tr><td width="10" class="vin_' + nivel + '" id="C' + id + '">' +
                '</td><td class="cerrada_' + nivel + '" id="' + id + '" onMouseOver="accionar(SOBRE,ENLACE,\'' + id + '\',' + nivel + ')" onMouseOut="accionar(ALEJA,ENLACE,null,' + nivel + ')" onClick="accionar(ABRIR,ENLACE,new Array(\'' + objItem.url + '\',\'' + id + '\'),' + nivel + ')" title="' + objItem.toolTip + '">';
        if (objItem.icono != null)
            htmlMENU += '<div class="boton' + nivel + '" style="background-image:url(' + contextPath + '/resources/imagenes/' + objItem.icono + '.gif);background-repeat:no-repeat;background-position:right;">';
        htmlMENU += '<a id="Ancla_' + id + '" href="javascript:accionar(ABRIR,ENLACE,new Array(\'' + objItem.url + '\',\'' + id + '\'),' + nivel + ')" onFocus="accionar(SOBRE,ENLACE,\'' + id + '\',' + nivel + ')" onBlur="accionar(ALEJA,ENLACE,null,' + nivel + ')" class="' + clase + '">' + objItem.nombre + '</a>';
        if (objItem.icono != null)
            htmlMENU += '</div>';
        htmlMENU += '</td></tr>\n';
    }
}
function ocultarEtiqueta(nomItem, n) {
    var etqTemp = new Etiqueta(nomItem, n);
    etqTemp.f1.className = 'cerrada_' + n;
    etqTemp.f2.className = 'mas_' + n;
    etqTemp.f3.className = 'col_' + n;
    etqTemp.f4.className = 'fondo_' + n;
    etqTemp.f5.className = 'abajo1_' + n;
    etqTemp.f6.className = 'abajo2_' + n;
    etqTemp.an.className = 'n' + n;
    etqTemp.f3.style.display = 'none';
    etqTemp.f4.style.display = 'none';
    etqTemp.f5.style.display = 'none';
    etqTemp.f6.style.display = 'none';
}