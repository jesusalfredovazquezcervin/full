$("#datosgenerales_select").empty()
.append("<%= escape_javascript(render(:partial => @datosgenerales)) %>")