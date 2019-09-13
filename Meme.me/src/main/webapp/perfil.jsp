<%-- 
    Document   : perfil
    Created on : 20/06/2019, 00:58:14
    Author     : florincy
--%>

<%@page import="br.edu.iff.meme.entidades.UsuarioMeme"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
    <head>
        <style type="text/css">

            #selectid{
                width:150;
                font-size:11px;
            }

        </style>
        <!-- Theme Made By www.w3schools.com - No Copyright -->
        <title>Meme.Me</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="login_css.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
        <%UsuarioMeme user = (UsuarioMeme) session.getAttribute("usuarioLogado");%>
        <div id="fundo1">
            <nav class="navbar navbar-default" id="menu">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>                        
                        </button>
                        <a class="navbar-brand" href="index.html">Meme.Me</a>
                        <div id="barra-busca">
                            <input type="text" placeholder="Procurar" name="search" style="color: black;">
                            <button type="submit"><img src="imagens/lupa.png" class="icone"></button>
                        </div>
                    </div>
                    <div class="collapse navbar-collapse"id="myNavbar">
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <button onclick="window.location.replace('index.html')" class="w3-button w3-large" id="botao1" >
                                    Sair
                                </button>
                            </li>
                            <li>
                                <button onclick="window.location.replace('publicar.html')"class="w3-button w3-large" id="botao2">
                                    Publicar   
                                </button>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>  
        <div class="vertical-menu">
            <img src="imagens/foto-perfil.jpg" class="perfil" style="position: relative;left: 50px;width:100px;height:100px;">
            <br>
            <span style="position: relative;left: 17px;">
                <%=user.getNick()%>
            </span>
            <a href="principal.jsp">
                Feed
            </a>
            <a href="perfil.jsp">
                Perfil
            </a>
        </div>
        <div id="feed">
            <div id="perfilbloco">
                <span id="nome-usuario">
                    <%=user.getNick()%>
                </span>
                <br>
                <img src="imagens/foto-perfil.jpg" class="fotoperfil">
                <br>
                <span id="bio-usuario">
                    <%=user.getBio()%>
                </span>
                <br>
                <button type="button" onclick="document.getElementById('alterar').style.display = 'block'" class="w3-button w3-large" style="position: relative; left: 60px" >
                    Editar perfil
                </button>
                <div id="alterar" class="w3-modal">
                    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:550px">
                        <form class="w3-container" action="" method="POST">
                            <div class="w3-section">
                                <label for="nome" id="nome">
                                    Nome:
                                </label>
                                <input type="text" id="nome" class="w3-input w3-border w3-margin-bottom" name="nome" value="<%=user.getNome()%>">
                                <label for="sobrenome" id="sobrenome">
                                    Sobrenome
                                </label>
                                <!--
                                <label for="date" id="data">
                                    Data de nascimento
                                </label>
                                <input type="date" name="birth">
                                -->
                                <input type="text" id="sobrenome"  class="w3-input w3-border w3-margin-bottom" name="sobrenome" value="<%=user.getSobrenome()%>">
                                <label for="nick" id="nick">
                                    Nick:
                                </label>
                                <input type="text" id="nick" class="w3-input w3-border w3-margin-bottom" name="nick" value="<%=user.getNick()%>">
                                <label for="senha" id="senha">
                                    Senha:
                                </label>
                                <input type="password" id="senha" class="w3-input w3-border w3-margin-bottom" name="senha" value="<%=user.getSenha()%>">

                                <label for="pais" id="pais">
                                    País:
                                </label>
                                <select id="selectid" name="pais" value="<%=user.getPais()%>">
                                    <option value="África do Sul">África do Sul</option>
                                    <option value="Albânia">Albânia</option>
                                    <option value="Alemanha">Alemanha</option>
                                    <option value="Andorra">Andorra</option>
                                    <option value="Angola">Angola</option>
                                    <option value="Anguilla">Anguilla</option>
                                    <option value="Antigua">Antigua</option>
                                    <option value="Arábia Saudita">Arábia Saudita</option>
                                    <option value="Argentina">Argentina</option>
                                    <option value="Armênia">Armênia</option>
                                    <option value="Aruba">Aruba</option>
                                    <option value="Austrália">Austrália</option>
                                    <option value="Áustria">Áustria</option>
                                    <option value="Azerbaijão">Azerbaijão</option>
                                    <option value="Bahamas">Bahamas</option>
                                    <option value="Bahrein">Bahrein</option>
                                    <option value="Bangladesh">Bangladesh</option>
                                    <option value="Barbados">Barbados</option>
                                    <option value="Bélgica">Bélgica</option>
                                    <option value="Benin">Benin</option>
                                    <option value="Bermudas">Bermudas</option>
                                    <option value="Botsuana">Botsuana</option>
                                    <option value="Brasil" selected>Brasil</option>
                                    <option value="Brunei">Brunei</option>
                                    <option value="Bulgária">Bulgária</option>
                                    <option value="Burkina Fasso">Burkina Fasso</option>
                                    <option value="botão">botão</option>
                                    <option value="Cabo Verde">Cabo Verde</option>
                                    <option value="Camarões">Camarões</option>
                                    <option value="Camboja">Camboja</option>
                                    <option value="Canadá">Canadá</option>
                                    <option value="Cazaquistão">Cazaquistão</option>
                                    <option value="Chade">Chade</option>
                                    <option value="Chile">Chile</option>
                                    <option value="China">China</option>
                                    <option value="Cidade do Vaticano">Cidade do Vaticano</option>
                                    <option value="Colômbia">Colômbia</option>
                                    <option value="Congo">Congo</option>
                                    <option value="Coréia do Sul">Coréia do Sul</option>
                                    <option value="Costa do Marfim">Costa do Marfim</option>
                                    <option value="Costa Rica">Costa Rica</option>
                                    <option value="Croácia">Croácia</option>
                                    <option value="Dinamarca">Dinamarca</option>
                                    <option value="Djibuti">Djibuti</option>
                                    <option value="Dominica">Dominica</option>
                                    <option value="EUA">EUA</option>
                                    <option value="Egito">Egito</option>
                                    <option value="El Salvador">El Salvador</option>
                                    <option value="Emirados Árabes">Emirados Árabes</option>
                                    <option value="Equador">Equador</option>
                                    <option value="Eritréia">Eritréia</option>
                                    <option value="Escócia">Escócia</option>
                                    <option value="Eslováquia">Eslováquia</option>
                                    <option value="Eslovênia">Eslovênia</option>
                                    <option value="Espanha">Espanha</option>
                                    <option value="Estônia">Estônia</option>
                                    <option value="Etiópia">Etiópia</option>
                                    <option value="Fiji">Fiji</option>
                                    <option value="Filipinas">Filipinas</option>
                                    <option value="Finlândia">Finlândia</option>
                                    <option value="França">França</option>
                                    <option value="Gabão">Gabão</option>
                                    <option value="Gâmbia">Gâmbia</option>
                                    <option value="Gana">Gana</option>
                                    <option value="Geórgia">Geórgia</option>
                                    <option value="Gibraltar">Gibraltar</option>
                                    <option value="Granada">Granada</option>
                                    <option value="Grécia">Grécia</option>
                                    <option value="Guadalupe">Guadalupe</option>
                                    <option value="Guam">Guam</option>
                                    <option value="Guatemala">Guatemala</option>
                                    <option value="Guiana">Guiana</option>
                                    <option value="Guiana Francesa">Guiana Francesa</option>
                                    <option value="Guiné-bissau">Guiné-bissau</option>
                                    <option value="Haiti">Haiti</option>
                                    <option value="Holanda">Holanda</option>
                                    <option value="Honduras">Honduras</option>
                                    <option value="Hong Kong">Hong Kong</option>
                                    <option value="Hungria">Hungria</option>
                                    <option value="Iêmen">Iêmen</option>
                                    <option value="Ilhas Cayman">Ilhas Cayman</option>
                                    <option value="Ilhas Cook">Ilhas Cook</option>
                                    <option value="Ilhas Curaçao">Ilhas Curaçao</option>
                                    <option value="Ilhas Marshall">Ilhas Marshall</option>
                                    <option value="Ilhas Turks & Caicos">Ilhas Turks & Caicos</option>
                                    <option value="Ilhas Virgens (brit.)">Ilhas Virgens (brit.)</option>
                                    <option value="Ilhas Virgens(amer.)">Ilhas Virgens(amer.)</option>
                                    <option value="Ilhas Wallis e Futuna">Ilhas Wallis e Futuna</option>
                                    <option value="Índia">Índia</option>
                                    <option value="Indonésia">Indonésia</option>
                                    <option value="Inglaterra">Inglaterra</option>
                                    <option value="Irlanda">Irlanda</option>
                                    <option value="Islândia">Islândia</option>
                                    <option value="Israel">Israel</option>
                                    <option value="Itália">Itália</option>
                                    <option value="Jamaica">Jamaica</option>
                                    <option value="Japão">Japão</option>
                                    <option value="Jordânia">Jordânia</option>
                                    <option value="Kuwait">Kuwait</option>
                                    <option value="Latvia">Latvia</option>
                                    <option value="Líbano">Líbano</option>
                                    <option value="Liechtenstein">Liechtenstein</option>
                                    <option value="Lituânia">Lituânia</option>
                                    <option value="Luxemburgo">Luxemburgo</option>
                                    <option value="Macau">Macau</option>
                                    <option value="Macedônia">Macedônia</option>
                                    <option value="Madagascar">Madagascar</option>
                                    <option value="Malásia">Malásia</option>
                                    <option value="Malaui">Malaui</option>
                                    <option value="Mali">Mali</option>
                                    <option value="Malta">Malta</option>
                                    <option value="Marrocos">Marrocos</option>
                                    <option value="Martinica">Martinica</option>
                                    <option value="Mauritânia">Mauritânia</option>
                                    <option value="Mauritius">Mauritius</option>
                                    <option value="México">México</option>
                                    <option value="Moldova">Moldova</option>
                                    <option value="Mônaco">Mônaco</option>
                                    <option value="Montserrat">Montserrat</option>
                                    <option value="Nepal">Nepal</option>
                                    <option value="Nicarágua">Nicarágua</option>
                                    <option value="Niger">Niger</option>
                                    <option value="Nigéria">Nigéria</option>
                                    <option value="Noruega">Noruega</option>
                                    <option value="Nova Caledônia">Nova Caledônia</option>
                                    <option value="Nova Zelândia">Nova Zelândia</option>
                                    <option value="Omã">Omã</option>
                                    <option value="Palau">Palau</option>
                                    <option value="Panamá">Panamá</option>
                                    <option value="Papua-nova Guiné">Papua-nova Guiné</option>
                                    <option value="Paquistão">Paquistão</option>
                                    <option value="Peru">Peru</option>
                                    <option value="Polinésia Francesa">Polinésia Francesa</option>
                                    <option value="Polônia">Polônia</option>
                                    <option value="Porto Rico">Porto Rico</option>
                                    <option value="Portugal">Portugal</option>
                                    <option value="Qatar">Qatar</option>
                                    <option value="Quênia">Quênia</option>
                                    <option value="Rep. Dominicana">Rep. Dominicana</option>
                                    <option value="Rep. Tcheca">Rep. Tcheca</option>
                                    <option value="Reunion">Reunion</option>
                                    <option value="Romênia">Romênia</option>
                                    <option value="Ruanda">Ruanda</option>
                                    <option value="Rússia">Rússia</option>
                                    <option value="Saipan">Saipan</option>
                                    <option value="Samoa Americana">Samoa Americana</option>
                                    <option value="Senegal">Senegal</option>
                                    <option value="Serra Leone">Serra Leone</option>
                                    <option value="Seychelles">Seychelles</option>
                                    <option value="Singapura">Singapura</option>
                                    <option value="Síria">Síria</option>
                                    <option value="Sri Lanka">Sri Lanka</option>
                                    <option value="St. Kitts & Nevis">St. Kitts & Nevis</option>
                                    <option value="St. Lúcia">St. Lúcia</option>
                                    <option value="St. Vincent">St. Vincent</option>
                                    <option value="Sudão">Sudão</option>
                                    <option value="Suécia">Suécia</option>
                                    <option value="Suiça">Suiça</option>
                                    <option value="Suriname">Suriname</option>
                                    <option value="Tailândia">Tailândia</option>
                                    <option value="Taiwan">Taiwan</option>
                                    <option value="Tanzânia">Tanzânia</option>
                                    <option value="Togo">Togo</option>
                                    <option value="Trinidad & Tobago">Trinidad & Tobago</option>
                                    <option value="Tunísia">Tunísia</option>
                                    <option value="Turquia">Turquia</option>
                                    <option value="Ucrânia">Ucrânia</option>
                                    <option value="Uganda">Uganda</option>
                                    <option value="Uruguai">Uruguai</option>
                                    <option value="Venezuela">Venezuela</option>
                                    <option value="Vietnã">Vietnã</option>
                                    <option value="Zaire">Zaire</option>
                                    <option value="Zâmbia">Zâmbia</option>
                                    <option value="Zimbábue">Zimbábue</option>
                                </select>
                                <br>
                                <label for="privatePublic" id="privatePublic">
                                    Perfil:
                                </label>

                                <%
                                    boolean checa;
                                    boolean naoCheca;
                                    if (user.isPrivado() == true) {
                                        checa = true;
                                        naoCheca = false;
                                    } else {
                                        checa = false;
                                        naoCheca = true;
                                    }
                                      
                                %>

                                <script>
                                    document.getElementById('true').checked = <%=checa%>;
                                    document.getElementById('false').checked = <%=naoCheca%>;
                                </script>

                                <input type="radio" name="private" value="true" checked="" id="true" />Privado
                                <input type="radio" name="private" value="false" checked="" id="false"/>Público
                                <br>
                                <label for="bio" id="bio">
                                    Bio:
                                </label>
                                <br>
                                <input name="bio" value="<%=user.getBio()%>"></input>
                                <input class="w3-button w3-block w3-green w3-section w3-padding" type="submit" value="Enviar">
                            </div>
                        </form>
                        <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
                            <button onclick="document.getElementById('alterar').style.display = 'none'" type="button" class="w3-button w3-red">
                                Cancelar
                            </button>
                        </div>
                    </div>
                </div>
                <table id="infMeme">
                    <tr>
                        <td class="inf">
                            <b>
                                500
                            </b>
                        </td>
                        <td class="inf">
                            <b>
                                200
                            </b>
                        </td>
                        <td class="inf">
                            <b>
                                12
                            </b>
                        </td>
                    </tr>
                    <tr>
                        <td class="inf">
                            Seguidores
                        </td>
                        <td class="inf">
                            Seguindo
                        </td>
                        <td class="inf">
                            Postagens
                        </td>
                    </tr>
                </table>
                <table id="galeria">
                    <tr>
                        <td><img src="imagens/meme-new.jpg" class="fotos-galeria"></td>
                        <td><img src="imagens/meme-novooo.jpg" class="fotos-galeria"></td>
                        <td><img src="imagens/meme-newww.jpg" class="fotos-galeria"></td>
                        <td><img src="imagens/meme-novo.jpg" class="fotos-galeria"></td>
                    </tr>
                    <tr>
                        <td><img src="imagens/meme-new.jpg" class="fotos-galeria"></td>
                        <td><img src="imagens/meme-newww.jpg" class="fotos-galeria"></td>
                        <td><img src="imagens/meme-novo.jpg" class="fotos-galeria"></td>
                        <td><img src="imagens/meme-neww.jpg" class="fotos-galeria"></td>
                    </tr>
                    <tr>
                        <td><img src="imagens/meme-novoo.jpg" class="fotos-galeria"></td>
                        <td><img src="imagens/meme-novooo.jpg" class="fotos-galeria"></td>
                        <td><img src="imagens/meme-novo.jpg" class="fotos-galeria"></td>
                        <td><img src="imagens/meme-new.jpg" class="fotos-galeria"></td>
                    </tr>
                </table>
            </div>
        </div>
    </body>
</html>
