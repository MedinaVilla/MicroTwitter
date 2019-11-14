$(function () {

    $("#bLogin").on("click", function () {
        $("#login").validate
                ({
                    rules:
                            {
                                nomU: {required: true},
                                contra: {required: true}

                            },
                    messages:
                            {
                                nomU: {required: "Ingrese el usuario"},
                                contra: {required: "Ingrese la contraseña"}
                            }
                });
    });
});
