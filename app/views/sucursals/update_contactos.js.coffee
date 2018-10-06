$("#contactos_select").empty()
$('#contactos_select').append($('<option>', {value:'', text:''})) 
.append("<%= escape_javascript(render(:partial => @contactos)) %>")

$("#contactos2_select").empty()
$('#contactos2_select').append($('<option>', {value:'', text:''})) 
.append("<%= escape_javascript(render(:partial => @contactos)) %>")

$("#contactos3_select").empty()
$('#contactos3_select').append($('<option>', {value:'', text:''})) 
.append("<%= escape_javascript(render(:partial => @contactos)) %>")

$("#contactos4_select").empty()
$('#contactos4_select').append($('<option>', {value:'', text:''})) 
.append("<%= escape_javascript(render(:partial => @contactos)) %>")