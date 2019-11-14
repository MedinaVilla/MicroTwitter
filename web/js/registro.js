$(function () {

    $("#bRegistro").on("click", function () {
        $("#registro").validate
                ({
                    rules:
                            {
                                email: {required: true, email: true},
                                nomU: {required: true},
                                contra: {required: true},
                                rContra: {required:true,equalTo:"#contra"},
                                fileInput: {required: true}

                            },
                    messages:
                            {
                                email: {required:"Ingrese el correo electronico", email: "Ingrese un correo valido"},
                                nomU: {required: "Ingrese el nombre de usuario"},
                                contra: {required: "Ingrese la contraseña"},
                                rContra: {required: "Repita la contraseña", equalTo: "Asegurese que coincidan las contraseñas"},
                                fileInput: {required:""}
                            
            }
                });
    });
});