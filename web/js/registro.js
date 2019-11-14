$(function () {

    $("#bRegistro").on("click", function () {
        $("#registro").validate
                ({
                    rules:
                            {
                                nomU: {required: true},
                                contra: {required: true},
                                rContra: {required:true,equalTo:"#contra"},
                                fileInput: {required: true}

                            },
                    messages:
                            {
                                nomU: {required: "Ingrese el usuario"},
                                contra: {required: "Ingrese la contraseña"},
                                rContra: {required: "Repita la contraseña", equalTo: "Asegurese que coincidan las contraseñas"},
                                fileInput: {required:""}
                            
            }
                });
    });
});