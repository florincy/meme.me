<%-- 
    Document   : perfil
    Created on : 20/06/2019, 00:58:14
    Author     : florincy
--%>

<jsp:directive.page import="java.util.*" />
<%@page import="org.hibernate.Transaction"%>
<%@page import="br.edu.iff.meme.entidades.Post"%>
<%@page import="br.edu.iff.meme.utilidades.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.iff.meme.entidades.UsuarioMeme"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="login_css.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script>
            function muda() {
                var imagem = document.getElementById('fotoPerfil');
                var imagem2 = document.getElementById('fotoBio');
                var imagem3 = document.getElementById('fotoPerfil3');
                var imagem4 = document.getElementById('fotoPerfil4');
                var caminho = document.getElementById('caminho').innerHTML.trim();
                var pasta = "imagens/";
                var junto = pasta + caminho;
                imagem.src = junto;
                imagem2.src = junto;
                imagem3.src = junto;
                imagem4.src = junto;
            }
        </script>
    </head>
    <body onload="muda()">
        <%UsuarioMeme user = (UsuarioMeme) session.getAttribute("usuarioLogado");
            Session session1 = HibernateUtil.getSession();
            Transaction tr = session1.beginTransaction();
            String hql = "from Post where user_cd_user_meme='" + user.getCdUsuarioMeme() + "'";
            //Post postagem = (Post) session1.createQuery(hql).list();
            List<Post> lista = (List) session1.createQuery(hql).list();
            request.setAttribute("postagens", lista);
            System.out.println(lista);
            tr.commit();
        %>
        <div id = "fundo1">
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
                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <button onclick="window.location.replace('index.html')" class="w3-button w3-large" id="botao1" >
                                    Sair
                                </button>
                            </li>
                            <li>
                                <button onclick="window.location.replace('publicar.jsp')" class="w3-button w3-large" id="botao2">
                                    Publicar   
                                </button>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div> 
        <span id="caminho" hidden>
            <%=user.getDsPhoto()%>
        </span> 
        <div class="vertical-menu">
            <img src="imagens/caderno.png" class="perfil" style="position: relative;left: 50px;width:100px;height:100px;" id="fotoPerfil">
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
                <img src="imagens/foto-perfil.jpg" class="fotoperfil" id="fotoBio">
                <br>
                <span id="bio-usuario">
                    <%=user.getBio()%>
                </span>
                <br>
                <button type="button" onclick="document.getElementById('alterar').style.display = 'block'; fe()" class="w3-button w3-large" style="position: relative; left: 60px" >
                    Editar perfil
                </button>
                <div id="alterar" class="w3-modal">
                    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:550px">
                        <form class="w3-container" action="AtualizarUsuario" method="POST">
                            <div class="w3-section">
                                <label for="email" id="email">
                                    Email:
                                </label>
                                <input type="text" id="email" placeholder="Digite seu Email" class="w3-input w3-border w3-margin-bottom" name="email" value="<%=user.getEmail()%>">
                                <label for="nick" id="nick">
                                    Nick:
                                </label>
                                <input type="text" id="nick" class="w3-input w3-border w3-margin-bottom" name="nick" value="<%=user.getNick()%>">
                                <label for="bio" id="bio">
                                    Bio:
                                </label>
                                <br>
                                <input name="bio" value="<%=user.getBio()%>">
                                <br>
                                <input name="id" type="text" value="<%=user.getCdUsuarioMeme()%>" hidden/>
                                <label for="privatePublic" id="privatePublic">
                                    Perfil:
                                </label>
                                <input type="radio" name="private" value="true" id="true" <% if (user.isPrivado()) {
                                        out.print("checked");
                                    }%>/>Privado
                                <input type="radio" name="private" value="false" id="false" <% if (!user.isPrivado()) {
                                        out.print("checked");
                                    }%>/>PÃºblico
                                <br>
                                <h4>InformaÃ§Ãµes Pessoais</h4>
                                <label for="nome" id="nome">
                                    Nome:
                                </label>
                                <input type="text" id="nome" class="w3-input w3-border w3-margin-bottom" name="nome" value="<%=user.getNome()%>">

                                <label for="date" id="data">
                                    Data de nascimento
                                </label>
                                <input type="date" name="birth" value="<%=user.getNascimento()%>">
                                <br>
                                <label for="sobrenome" id="sobrenome">
                                    Sobrenome
                                </label>
                                <input type="text" id="sobrenome"  class="w3-input w3-border w3-margin-bottom" name="sobrenome" value="<%=user.getSobrenome()%>">
                                <label for="senhaAntiga" id="senha">
                                    Senha antiga:
                                </label>
                                <input type="password" id="senhaAntiga" class="w3-input w3-border w3-margin-bottom" name="senha">
                                <label for="senhaNova" id="senhaNova">
                                    Senha Nova:
                                </label>
                                <input type="password" id="senhaAntiga" class="w3-input w3-border w3-margin-bottom" name="senhaNova">
                                <label for="senhaConf" id="senhaConf">
                                    Confirmar senha:
                                </label>
                                <input type="password" id="senhaAntiga" class="w3-input w3-border w3-margin-bottom" name="senhaConf">

                                <label for="pais" id="pais">
                                    PaÃ­s:
                                </label>
                                <input type="text" value="<%=user.getPais()%>" id="pega" hidden/>
                                <script type="text/javascript">
                                    function fe() {
                                        var valor = document.getElementById("pega").getAttribute("value");
                                        var b = document.getElementById(valor);
                                        b.setAttribute("selected", "selected");
                                    }
                                </script>
                                <select name="pais">
                                    <option value="AfricaDoSul" id="AfricaDoSul">Ãfrica do Sul</option>
                                    <option value="Albania" id="Albania">AlbÃ¢nia</option>
                                    <option value="Alemanha" id="Alemanha">Alemanha</option>
                                    <option value="Andorra"id="Andorra">Andorra</option>
                                    <option value="Angola" id="Angola">Angola</option>
                                    <option value="Anguilla" id="Anguilla">Anguilla</option>
                                    <option value="Antigua" id="Antigua">Antigua</option>
                                    <option value="ArabiaSaudita"id="ArabiaSaudita">ArÃ¡bia Saudita</option>
                                    <option value="Argentina" id="Argentina">Argentina</option>
                                    <option value="Armenia" id="Armenia">ArmÃªnia</option>
                                    <option value="Aruba" id="Aruba">Aruba</option>
                                    <option value="Australia" id="Australia">AustrÃ¡lia</option>
                                    <option value="austria" id="austria">Ãustria</option>
                                    <option value="Azerbaijao" id="Azerbaijao">AzerbaijÃ£o</option>
                                    <option value="Bahamas" id="Bahamas">Bahamas</option>
                                    <option value="Bahrein" id="Bahrein">Bahrein</option>
                                    <option value="Bangladesh" id="Bangladesh">Bangladesh</option>
                                    <option value="Barbados" id="Barbados">Barbados</option>
                                    <option value="Belgica" id="Belgica">BÃ©lgica</option>
                                    <option value="Benin" id="Benin">Benin</option>
                                    <option value="Bermudas" id="Bermudas">Bermudas</option>
                                    <option value="Botsuana" id="Botsuana">Botsuana</option>
                                    <option value="Brasil" id="Brasil">Brasil</option>
                                    <option value="Brunei" id="Brunei">Brunei</option>
                                    <option value="BulgÃ¡ria" id="BulgÃ¡ria">BulgÃ¡ria</option>
                                    <option value="BurkinaFasso" id="BurkinaFasso">Burkina Fasso</option>
                                    <option value="CaboVerde" id="CaboVerde">Cabo Verde</option>
                                    <option value="Camaroes" id="Camaroes">CamarÃµes</option>
                                    <option value="Camboja" id="Camboja">Camboja</option>
                                    <option value="Canada" id="Canada">CanadÃ¡</option>
                                    <option value="Cazaquistao" id="Cazaquistao">CazaquistÃ£o</option>
                                    <option value="Chade" id="Chade">Chade</option>
                                    <option value="Chile" id="Chile">Chile</option>
                                    <option value="China" id="China">China</option>
                                    <option value="CidadeDoVaticano" id="CidadeDoVaticano">Cidade do Vaticano</option>
                                    <option value="Colombia" id="Colombia">ColÃ´mbia</option>
                                    <option value="Congo" id="Congo">Congo</option>
                                    <option value="CoreiaDoSul" id="CoreiaDoSul">CorÃ©ia do Sul</option>
                                    <option value="CostaDoMarfim" id="CostaDoMarfim">Costa do Marfim</option>
                                    <option value="CostaRica id="CostaRica">Costa Rica</option>
                                    <option value="Croacia" id="Croacia">CroÃ¡cia</option>
                                    <option value="Dinamarca" id="Dinamarca">Dinamarca</option>
                                    <option value="Djibuti" id="Djibuti">Djibuti</option>
                                    <option value="Dominica" id="Dominica">Dominica</option>
                                    <option value="EUA" id="EUA">EUA</option>
                                    <option value="Egito" id="Egito">Egito</option>
                                    <option value="ElSalvador" id="ElSalvador">El Salvador</option>
                                    <option value="EmiradosArabes" id="EmiradosArabes">Emirados Ãrabes</option>
                                    <option value="Equador" id="Equador">Equador</option>
                                    <option value="Eritreia" id="Eritreia">EritrÃ©ia</option>
                                    <option value="Escocia" id="Escocia">EscÃ³cia</option>
                                    <option value="Eslovaquia" id="Eslovaquia">EslovÃ¡quia</option>
                                    <option value="Eslovenia" id="Eslovenia">EslovÃªnia</option>
                                    <option value="Espanha" id="Espanha">Espanha</option>
                                    <option value="Estonia" id="Estonia">EstÃ´nia</option>
                                    <option value="Etiopia" id="Etiopia">EtiÃ³pia</option>
                                    <option value="Fiji" id="Fiji">Fiji</option>
                                    <option value="Filipinas" id="Filipinas">Filipinas</option>
                                    <option value="Finlandia" id="Finlandia">FinlÃ¢ndia</option>
                                    <option value="FranÃ§a" id="FranÃ§a">FranÃ§a</option>
                                    <option value="Gabao" id="Gabao">GabÃ£o</option>
                                    <option value="Gambia" id="Gambia">GÃ¢mbia</option>
                                    <option value="Gana" id="Gana">Gana</option>
                                    <option value="Georgia" id="Georgia">GeÃ³rgia</option>
                                    <option value="Gibraltar" id="Gibraltar">Gibraltar</option>
                                    <option value="Granada" id="Granada">Granada</option>
                                    <option value="Grecia" id="Grecia">GrÃ©cia</option>
                                    <option value="Guadalupe" id="Guadalupe">Guadalupe</option>
                                    <option value="Guam"id="Guam">Guam</option>
                                    <option value="Guatemala" id="Guatemala">Guatemala</option>
                                    <option value="Guiana"id="Guiana">Guiana</option>
                                    <option value="GuianaFrancesa" id="GuianaFrancesa">Guiana Francesa</option>
                                    <option value="Guine-bissau" id="Guine-bissau">GuinÃ©-bissau</option>
                                    <option value="Haiti" id="Haiti">Haiti</option>
                                    <option value="Holanda" id="Holanda">Holanda</option>
                                    <option value="Honduras" id="Honduras">Honduras</option>
                                    <option value="HongKong" id="HongKong">Hong Kong</option>
                                    <option value="Hungria"id="Hungria">Hungria</option>
                                    <option value="Iemen" id="Iemen">IÃªmen</option>
                                    <option value="IlhasCayman" id="IlhasCayman">Ilhas Cayman</option>
                                    <option value="IlhasCook" id="IlhasCook">Ilhas Cook</option>
                                    <option value="IlhasCuraÃ§ao" id="IlhasCuraÃ§ao">Ilhas CuraÃ§ao</option>
                                    <option value="IlhasMarshall" id="IlhasMarshall">Ilhas Marshall</option>
                                    <option value="IlhasTurksECaicos" id="IlhasTurksECaicos">Ilhas Turks & Caicos</option>
                                    <option value="IlhasVirgensBrit" id="IlhasVirgensBrit">Ilhas Virgens (brit.)</option>
                                    <option value="IlhasVirgensAme" id="IlhasVirgensAme">Ilhas Virgens(amer.)</option>
                                    <option value="IlhasWallisEutuna" id="IlhasWallisEutuna">Ilhas Wallis e Futuna</option>
                                    <option value="India" id="India">Ãndia</option>
                                    <option value="Indonesia" id="Indonesia">IndonÃ©sia</option>
                                    <option value="Inglaterra"id="Inglaterra">Inglaterra</option>
                                    <option value="Irlanda"id="Irlanda">Irlanda</option>
                                    <option value="Islandia" id="Islandia">IslÃ¢ndia</option>
                                    <option value="Israel" id="Israel">Israel</option>
                                    <option value="Italia" id="Italia">ItÃ¡lia</option>
                                    <option value="Jamaica" id="Jamaica">Jamaica</option>
                                    <option value="Japao" id="Japao">JapÃ£o</option>
                                    <option value="Jordania" id="Jordania">JordÃ¢nia</option>
                                    <option value="Kuwait" id="Kuwait">Kuwait</option>
                                    <option value="Latvia" id="Latvia">Latvia</option>
                                    <option value="Libano" id="Libano">LÃ­bano</option>
                                    <option value="Liechtenstein" id="Liechtenstein">Liechtenstein</option>
                                    <option value="Lituania"iid="Lituania">LituÃ¢nia</option>
                                    <option value="Luxemburgo" id="Luxemburgo">Luxemburgo</option>
                                    <option value="Macau"id="Macau">Macau</option>
                                    <option value="Macedonia" id="Macedonia">MacedÃ´nia</option>
                                    <option value="Madagascar" id="Madagascar">Madagascar</option>
                                    <option value="Malasia"id="Malasia">MalÃ¡sia</option>
                                    <option value="Malaui" id="Malaui">Malaui</option>
                                    <option value="Mali" id="Mali">Mali</option>
                                    <option value="Malta" id="Malta">Malta</option>
                                    <option value="Marrocos" id="Marrocos">Marrocos</option>
                                    <option value="Martinica"id="Martinica">Martinica</option>
                                    <option value="Mauritania" id="Mauritania">MauritÃ¢nia</option>
                                    <option value="Mauritius" id="Mauritius">Mauritius</option>
                                    <option value="Mexico" id="Mexico">MÃ©xico</option>
                                    <option value="Moldova" id="Moldova">Moldova</option>
                                    <option value="Monaco" id="Monaco">MÃ´naco</option>
                                    <option value="Montserrat"id="Montserrat">Montserrat</option>
                                    <option value="Nepal" id="Nepal">Nepal</option>
                                    <option value="Nicaragua" id="Nicaragua">NicarÃ¡gua</option>
                                    <option value="Niger"id="Niger">Niger</option>
                                    <option value="Nigeria" id="Nigeria">NigÃ©ria</option>
                                    <option value="Noruega" id="Noruega">Noruega</option>
                                    <option value="NovaCaledonia" id="NovaCaledonia">Nova CaledÃ´nia</option>
                                    <option value="NovaZelandia" id="NovaZelandia">Nova ZelÃ¢ndia</option>
                                    <option value="Oma"id="Oma">OmÃ£</option>
                                    <option value="Palau" id="Palau">Palau</option>
                                    <option value="Panama"id="Panama">PanamÃ¡</option>
                                    <option value="Papua-novaGuine" id="Papua-novaGuine">Papua-nova GuinÃ©</option>
                                    <option value="Paquistao" id="Paquistao">PaquistÃ£o</option>
                                    <option value="Peru"id="Peru">Peru</option>
                                    <option value="PolinesiaFrancesa" id="PolinesiaFrancesa" >PolinÃ©sia Francesa</option>
                                    <option value="Polonia" id="Polonia">PolÃ´nia</option>
                                    <option value="PortoRico" id="PortoRico">Porto Rico</option>
                                    <option value="Portugal"id="Portugal">Portugal</option>
                                    <option value="Qatar" id="Qatar">Qatar</option>
                                    <option value="Quenia"id="Quenia">QuÃªnia</option>
                                    <option value="RepDominicana" id="RepDominicana">Rep. Dominicana</option>
                                    <option value="RepTcheca" id="RepTcheca">Rep. Tcheca</option>
                                    <option value="Romenia"id="Romenia">RomÃªnia</option>
                                    <option value="Ruanda"id="Ruanda">Ruanda</option>
                                    <option value="Russia"id="Russia">RÃºssia</option>
                                    <option value="Saipan"id="Saipan">Saipan</option>
                                    <option value="SamoaAmericana"id="SamoaAmericana">Samoa Americana</option>
                                    <option value="Senegal" id="Senegal">Senegal</option>
                                    <option value="SerraLeone"id="SerraLeone">Serra Leone</option>
                                    <option value="Seychelles" id="Seychelles">Seychelles</option>
                                    <option value="Singapura"id="Singapura">Singapura</option>
                                    <option value="Siria"id="Siria">SÃ­ria</option>
                                    <option value="SriLanka" id="SriLanka">Sri Lanka</option>
                                    <option value="StKittsENevis" id="StKittsENevis">St. Kitts & Nevis</option>
                                    <option value="StLucia" id="StLucia">St. LÃºcia</option>
                                    <option value="StVincent" id="StVincent">St. Vincent</option>
                                    <option value="Sudao"id="Sudao">SudÃ£o</option>
                                    <option value="Suecia"id="Suecia">SuÃ©cia</option>
                                    <option value="SuiÃ§a" id="SuiÃ§a">SuiÃ§a</option>
                                    <option value="Suriname" id="Suriname">Suriname</option>
                                    <option value="Tailandia"id="Tailandia">TailÃ¢ndia</option>
                                    <option value="Taiwan" id="Taiwan">Taiwan</option>
                                    <option value="Tanzania" id="Tanzania">TanzÃ¢nia</option>
                                    <option value="Togo"id="Togo">Togo</option>
                                    <option value="TrinidadETobago"id="TrinidadETobago">Trinidad & Tobago</option>
                                    <option value="Tunisia"id="Tunisia">TunÃ­sia</option>
                                    <option value="Turquia" id="Turquia">Turquia</option>
                                    <option value="Ucrania"id="Ucrania">UcrÃ¢nia</option>
                                    <option value="Uganda" id="Uganda">Uganda</option>
                                    <option value="Uruguai" id="Uruguai">Uruguai</option>
                                    <option value="Venezuela"id="Venezuela">Venezuela</option>
                                    <option value="Vietna"id="Vietna">VietnÃ£</option>
                                    <option value="Zaire"id="Zaire">Zaire</option>
                                    <option value="Zambia" id="Zambia" >ZÃ¢mbia</option>
                                    <option value="Zimbabue"id="Zimbabue" >ZimbÃ¡bue</option>
                                </select>
                                <br>
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

                <!--
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
                -->



                <display:table name="postagens">


                    <display:column property="dsPost" title="Descrição"/>


                    <display:column property="tsMoments" title="Tempo"/>


                    <display:caption>Postagens</display:caption>

                </display:table>



            </div>              

            <div id="feed2">
                <div class="postagem" id="postagem2">
                    <img src="imagens/foto-perfil.jpg" class="perfil" id="fotoPerfil3">
                    <%=user.getNick()%>
                    <br>

                    <!-- PublicaÃ§Ãµes -->
                    <img src="imagens/meme1.jpeg" class="padrao">
                    <br>
                    <div class="opcoes">
                        <ul>
                            <li>
                                <img src="imagens/curtir.png" class="icone">
                            </li>
                            <li>
                                <img src="imagens/compartilhar.png" class="icone">
                            </li>
                            <li>
                                <img src="imagens/comentar.png" class="icone">
                            </li>
                            <li>
                                <img src="imagens/denuncia.png" class="icone" onclick="window.location.replace('denunciar.html')">
                            </li>
                            <li>
                                <span class="dataHora">
                                    19:45 13/11/2018
                                </span>
                            </li>
                        </ul>
                    </div>
                    <span class="legenda">
                        Só li verdades! 
                    </span>
                </div>


            </div>
        </div>



    </body>
</html>
