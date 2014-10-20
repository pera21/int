var buscarRegion
buscarRegion = function() {
  var provincia_id = $("#p_provincia_id").val()
  $.ajax({
    url: "/principals/obtener_region.js",
    dataType: "json",
    type: "GET",
    data: { provincia_id: provincia_id },
    contentType: "application/json",
    success:function(result){
      $("#region").val(result.detalle)
    },
    error: function(jqXHR, textStatus, errorThrown){
    }
  });
};

$(document).ready(function(){
  $("#p_provincia_id").change(function() {
    buscarRegion();
  });

  if ($("#p_provincia_id").length) {
    if ($("#p_provincia_id").val() != "") {
      buscarRegion(); 
    };
  };

});

// Generated by CoffeeScript 1.6.2
(function() {
  jQuery(function() {
    var localidades, llenarLocalidades;

    llenarLocalidades = function(localidades) {
      var provincia, options;

      provincia = $('#p_provincia_id :selected').text();
      options = $(localidades).filter("optgroup[label='" + provincia + "']").html();
      if (options) {
        $("#principal_localidad_id").html('<option value="">Seleccione una localidad...</option>');
        return $("#principal_localidad_id").append(options);
      } else {
        return $("#principal_localidad_id").empty();
      }
    };
    localidades = $("#principal_localidad_id").html();
    llenarLocalidades(localidades);
    return $('#p_provincia_id').change(function() {
      return llenarLocalidades(localidades);
    });
  });

}).call(this);
