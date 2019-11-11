/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Java;

/**
 *
 * @author MedinaVilla
 */
public class Navbar {

    public String showNavbar() {
        String usuario = "";
        usuario = " <nav class=\"navbar\" role=\"navigation\" aria-label=\"main navigation\">\n"
                + "            <div class=\"navbar-brand\">\n"
                + "                <a class=\"navbar-item\" href=\"https://bulma.io\">\n"
                + "                    <img src=\"https://bulma.io/images/bulma-logo.png\" width=\"112\" height=\"28\">\n"
                + "                </a>\n"
                + "\n"
                + "                <a role=\"button\" class=\"navbar-burger burger\" aria-label=\"menu\" aria-expanded=\"false\" data-target=\"navbarBasicExample\">\n"
                + "                    <span aria-hidden=\"true\"></span>\n"
                + "                    <span aria-hidden=\"true\"></span>\n"
                + "                    <span aria-hidden=\"true\"></span>\n"
                + "                </a>\n"
                + "            </div>\n"
                + "\n"
                + "            <div id=\"navbarBasicExample\" class=\"navbar-menu\">\n"
                + "                <div class=\"navbar-start\">\n"
                + "                    <a class=\"navbar-item\">\n"
                + "                        Inicio\n"
                + "                    </a>\n"
                + "\n"
                + "                    <a class=\"navbar-item\">\n"
                + "                        Documentation\n"
                + "                    </a>\n"
                + "\n"
                + "                    <div class=\"navbar-item has-dropdown is-hoverable\">\n"
                + "                        <a class=\"navbar-link\">\n"
                + "                            More\n"
                + "                        </a>\n"
                + "\n"
                + "                        <div class=\"navbar-dropdown\">\n"
                + "                            <a class=\"navbar-item\">\n"
                + "                                About\n"
                + "                            </a>\n"
                + "                            <a class=\"navbar-item\">\n"
                + "                                Jobs\n"
                + "                            </a>\n"
                + "                            <a class=\"navbar-item\">\n"
                + "                                Contact\n"
                + "                            </a>\n"
                + "                            <hr class=\"navbar-divider\">\n"
                + "                            <a class=\"navbar-item\">\n"
                + "                                Report an issue\n"
                + "                            </a>\n"
                + "                        </div>\n"
                + "                    </div>\n"
                + "                </div>\n"
                + "\n"
                + "                <div class=\"navbar-end\">\n"
                + "                    <div class=\"navbar-item\">\n"
                + "                        <div class=\"buttons\">\n"
                + "                            <a href=\"registro\" class=\"button is-link\">\n"
                + "                                <strong>Registro</strong>\n"
                + "                            </a>\n"
                + "                            <a href=\"login\"class=\"button is-light\">\n"
                + "                                Iniciar Sesion\n"
                + "                            </a>\n"
                + "                        </div>\n"
                + "                    </div>\n"
                + "                </div>\n"
                + "            </div>\n"
                + "        </nav>";

        return usuario;
    }
}
