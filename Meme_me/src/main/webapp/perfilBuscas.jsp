<%-- 
    Document   : perfilBuscas
    Created on : 29/10/2019, 12:55:12
    Author     : aluno
--%>
<%@page import="br.edu.iff.meme.entidades.Follow"%>
<%@page import="org.hibernate.Query"%>
<jsp:directive.page import="java.util.*" />
<%@page import="org.hibernate.Transaction"%>
<%@page import="br.edu.iff.meme.entidades.Post"%>
<%@page import="br.edu.iff.meme.utilidades.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.iff.meme.entidades.UsuarioMeme"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%><!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
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
        <%
            UsuarioMeme user = (UsuarioMeme) session.getAttribute("usuarioLogado");
            Follow seguida = (Follow) session.getAttribute("seguido");
            UsuarioMeme usuario = (UsuarioMeme) session.getAttribute("buscado");
            byte[] fotoPerfilBusca = usuario.getFoto();
            String perfilFotoBusca = Base64.getEncoder().encodeToString(fotoPerfilBusca);
            Session session2 = HibernateUtil.getSession();
            String hql = "select count(*) from Post where user_cd_user_meme='" + usuario.getCdUsuarioMeme() + "'";
            String hql2 = "select count(*) from Follow where followed_cd_user_meme='" + usuario.getCdUsuarioMeme() + "'";
            String hql3 = "select count(*) from Follow where follower_cd_user_meme='" + usuario.getCdUsuarioMeme() + "'";
            Query query = session2.createQuery(hql);
            Query query2 = session2.createQuery(hql2);
            Query query3 = session2.createQuery(hql3);
            List listResult = query.list();
            List listResult2 = query2.list();
            List listResult3 = query3.list();
            Number postagens = (Number) listResult.get(0);
            Number seguidores = (Number) listResult2.get(0);
             Number seguidos = (Number) listResult3.get(0);
        %>

        <%@include file="WEB-INF/jspf/menuPrincipal.jspf"%>
        <%@include file="WEB-INF/jspf/menuLateral.jspf"%>
        <div id="feed">
            <div id="perfilbloco">
                <span id="nome-usuario">
                    <%=usuario.getNick()%>
                </span>
                <br>
                <img src="data:image/png;base64,<%=perfilFotoBusca%>" class="fotoperfil">
                <br>
                <span id="bio-usuario">
                    <%=usuario.getBio()%>
                </span>
                <br>
                <table id="infMeme">
                    <tr>
                        <td class="inf">
                            <b>
                                <%=seguidos%>   
                            </b>
                        </td>
                        <td class="inf">
                            <b>
                                <%=seguidores%>   
                            </b>
                        </td>
                        <td class="inf">
                            <b>
                                <%=postagens%>   
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
                <form action="ServletSeguirUsuarioMeme" method="post">
                    <%
                        if (user.getCdUsuarioMeme() == usuario.getCdUsuarioMeme()) {
                            out.print("<button type=" + "\"button\"" + "onclick=\"document.getElementById('alterar').style.display = 'block'; fe()\"" + "class=\"w3-button w3-large\"" + "style=\"position: relative; left: 60px;background-color: #28bfa0;color: #f5f6f7;\"" + ">Editar perfil" + "</button>");
                        } else {
                            out.print("<button type=" + "\"button\"" + "class=\"w3-button w3-large\"" + "style=\"position: relative; left: 83px;background-color: #28bfa0;color: #f5f6f7;\"" + "id=\"muda\"" + ">" + "Seguir" + "</button>");
                        }
                    %>
                </form>
                <div id="alterar" class="w3-modal">
                    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:550px">
                        <form class="w3-container" action="AtualizarUsuario" method="POST" enctype="multipart/form-data">
                            <div class="w3-section" style="font-size:15px;">
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
                                    }%>/>Público
                                <br>
                                <h4>Informações Pessoais</h4>
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
                                    País:
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
                                    <option value="AfricaDoSul" id="AfricaDoSul">África do Sul</option>
                                    <option value="Albania" id="Albania">Albânia</option>
                                    <option value="Alemanha" id="Alemanha">Alemanha</option>
                                    <option value="Andorra"id="Andorra">Andorra</option>
                                    <option value="Angola" id="Angola">Angola</option>
                                    <option value="Anguilla" id="Anguilla">Anguilla</option>
                                    <option value="Antigua" id="Antigua">Antigua</option>
                                    <option value="ArabiaSaudita"id="ArabiaSaudita">Arábia Saudita</option>
                                    <option value="Argentina" id="Argentina">Argentina</option>
                                    <option value="Armenia" id="Armenia">Armênia</option>
                                    <option value="Aruba" id="Aruba">Aruba</option>
                                    <option value="Australia" id="Australia">Austrália</option>
                                    <option value="austria" id="austria">Áustria</option>
                                    <option value="Azerbaijao" id="Azerbaijao">Azerbaijão</option>
                                    <option value="Bahamas" id="Bahamas">Bahamas</option>
                                    <option value="Bahrein" id="Bahrein">Bahrein</option>
                                    <option value="Bangladesh" id="Bangladesh">Bangladesh</option>
                                    <option value="Barbados" id="Barbados">Barbados</option>
                                    <option value="Belgica" id="Belgica">Bélgica</option>
                                    <option value="Benin" id="Benin">Benin</option>
                                    <option value="Bermudas" id="Bermudas">Bermudas</option>
                                    <option value="Botsuana" id="Botsuana">Botsuana</option>
                                    <option value="Brasil" id="Brasil">Brasil</option>
                                    <option value="Brunei" id="Brunei">Brunei</option>
                                    <option value="Bulgária" id="Bulgária">Bulgária</option>
                                    <option value="BurkinaFasso" id="BurkinaFasso">Burkina Fasso</option>
                                    <option value="CaboVerde" id="CaboVerde">Cabo Verde</option>
                                    <option value="Camaroes" id="Camaroes">Camarões</option>
                                    <option value="Camboja" id="Camboja">Camboja</option>
                                    <option value="Canada" id="Canada">Canadá</option>
                                    <option value="Cazaquistao" id="Cazaquistao">Cazaquistão</option>
                                    <option value="Chade" id="Chade">Chade</option>
                                    <option value="Chile" id="Chile">Chile</option>
                                    <option value="China" id="China">China</option>
                                    <option value="CidadeDoVaticano" id="CidadeDoVaticano">Cidade do Vaticano</option>
                                    <option value="Colombia" id="Colombia">Colômbia</option>
                                    <option value="Congo" id="Congo">Congo</option>
                                    <option value="CoreiaDoSul" id="CoreiaDoSul">Coréia do Sul</option>
                                    <option value="CostaDoMarfim" id="CostaDoMarfim">Costa do Marfim</option>
                                    <option value="CostaRica id="CostaRica">Costa Rica</option>
                                    <option value="Croacia" id="Croacia">Croácia</option>
                                    <option value="Dinamarca" id="Dinamarca">Dinamarca</option>
                                    <option value="Djibuti" id="Djibuti">Djibuti</option>
                                    <option value="Dominica" id="Dominica">Dominica</option>
                                    <option value="EUA" id="EUA">EUA</option>
                                    <option value="Egito" id="Egito">Egito</option>
                                    <option value="ElSalvador" id="ElSalvador">El Salvador</option>
                                    <option value="EmiradosArabes" id="EmiradosArabes">Emirados Árabes</option>
                                    <option value="Equador" id="Equador">Equador</option>
                                    <option value="Eritreia" id="Eritreia">Eritréia</option>
                                    <option value="Escocia" id="Escocia">Escócia</option>
                                    <option value="Eslovaquia" id="Eslovaquia">Eslováquia</option>
                                    <option value="Eslovenia" id="Eslovenia">Eslovênia</option>
                                    <option value="Espanha" id="Espanha">Espanha</option>
                                    <option value="Estonia" id="Estonia">Estônia</option>
                                    <option value="Etiopia" id="Etiopia">Etiópia</option>
                                    <option value="Fiji" id="Fiji">Fiji</option>
                                    <option value="Filipinas" id="Filipinas">Filipinas</option>
                                    <option value="Finlandia" id="Finlandia">Finlândia</option>
                                    <option value="França" id="França">França</option>
                                    <option value="Gabao" id="Gabao">Gabão</option>
                                    <option value="Gambia" id="Gambia">Gâmbia</option>
                                    <option value="Gana" id="Gana">Gana</option>
                                    <option value="Georgia" id="Georgia">Geórgia</option>
                                    <option value="Gibraltar" id="Gibraltar">Gibraltar</option>
                                    <option value="Granada" id="Granada">Granada</option>
                                    <option value="Grecia" id="Grecia">Grécia</option>
                                    <option value="Guadalupe" id="Guadalupe">Guadalupe</option>
                                    <option value="Guam"id="Guam">Guam</option>
                                    <option value="Guatemala" id="Guatemala">Guatemala</option>
                                    <option value="Guiana"id="Guiana">Guiana</option>
                                    <option value="GuianaFrancesa" id="GuianaFrancesa">Guiana Francesa</option>
                                    <option value="Guine-bissau" id="Guine-bissau">Guiné-bissau</option>
                                    <option value="Haiti" id="Haiti">Haiti</option>
                                    <option value="Holanda" id="Holanda">Holanda</option>
                                    <option value="Honduras" id="Honduras">Honduras</option>
                                    <option value="HongKong" id="HongKong">Hong Kong</option>
                                    <option value="Hungria"id="Hungria">Hungria</option>
                                    <option value="Iemen" id="Iemen">Iêmen</option>
                                    <option value="IlhasCayman" id="IlhasCayman">Ilhas Cayman</option>
                                    <option value="IlhasCook" id="IlhasCook">Ilhas Cook</option>
                                    <option value="IlhasCuraçao" id="IlhasCuraçao">Ilhas Curaçao</option>
                                    <option value="IlhasMarshall" id="IlhasMarshall">Ilhas Marshall</option>
                                    <option value="IlhasTurksECaicos" id="IlhasTurksECaicos">Ilhas Turks & Caicos</option>
                                    <option value="IlhasVirgensBrit" id="IlhasVirgensBrit">Ilhas Virgens (brit.)</option>
                                    <option value="IlhasVirgensAme" id="IlhasVirgensAme">Ilhas Virgens(amer.)</option>
                                    <option value="IlhasWallisEutuna" id="IlhasWallisEutuna">Ilhas Wallis e Futuna</option>
                                    <option value="India" id="India">Índia</option>
                                    <option value="Indonesia" id="Indonesia">Indonésia</option>
                                    <option value="Inglaterra"id="Inglaterra">Inglaterra</option>
                                    <option value="Irlanda"id="Irlanda">Irlanda</option>
                                    <option value="Islandia" id="Islandia">Islândia</option>
                                    <option value="Israel" id="Israel">Israel</option>
                                    <option value="Italia" id="Italia">Itália</option>
                                    <option value="Jamaica" id="Jamaica">Jamaica</option>
                                    <option value="Japao" id="Japao">Japão</option>
                                    <option value="Jordania" id="Jordania">Jordânia</option>
                                    <option value="Kuwait" id="Kuwait">Kuwait</option>
                                    <option value="Latvia" id="Latvia">Latvia</option>
                                    <option value="Libano" id="Libano">Líbano</option>
                                    <option value="Liechtenstein" id="Liechtenstein">Liechtenstein</option>
                                    <option value="Lituania"iid="Lituania">Lituânia</option>
                                    <option value="Luxemburgo" id="Luxemburgo">Luxemburgo</option>
                                    <option value="Macau"id="Macau">Macau</option>
                                    <option value="Macedonia" id="Macedonia">Macedônia</option>
                                    <option value="Madagascar" id="Madagascar">Madagascar</option>
                                    <option value="Malasia"id="Malasia">Malásia</option>
                                    <option value="Malaui" id="Malaui">Malaui</option>
                                    <option value="Mali" id="Mali">Mali</option>
                                    <option value="Malta" id="Malta">Malta</option>
                                    <option value="Marrocos" id="Marrocos">Marrocos</option>
                                    <option value="Martinica"id="Martinica">Martinica</option>
                                    <option value="Mauritania" id="Mauritania">Mauritânia</option>
                                    <option value="Mauritius" id="Mauritius">Mauritius</option>
                                    <option value="Mexico" id="Mexico">México</option>
                                    <option value="Moldova" id="Moldova">Moldova</option>
                                    <option value="Monaco" id="Monaco">Mônaco</option>
                                    <option value="Montserrat"id="Montserrat">Montserrat</option>
                                    <option value="Nepal" id="Nepal">Nepal</option>
                                    <option value="Nicaragua" id="Nicaragua">Nicarágua</option>
                                    <option value="Niger"id="Niger">Niger</option>
                                    <option value="Nigeria" id="Nigeria">Nigéria</option>
                                    <option value="Noruega" id="Noruega">Noruega</option>
                                    <option value="NovaCaledonia" id="NovaCaledonia">Nova Caledônia</option>
                                    <option value="NovaZelandia" id="NovaZelandia">Nova Zelândia</option>
                                    <option value="Oma"id="Oma">Omã</option>
                                    <option value="Palau" id="Palau">Palau</option>
                                    <option value="Panama"id="Panama">Panamá</option>
                                    <option value="Papua-novaGuine" id="Papua-novaGuine">Papua-nova Guiné</option>
                                    <option value="Paquistao" id="Paquistao">Paquistão</option>
                                    <option value="Peru"id="Peru">Peru</option>
                                    <option value="PolinesiaFrancesa" id="PolinesiaFrancesa" >Polinésia Francesa</option>
                                    <option value="Polonia" id="Polonia">Polônia</option>
                                    <option value="PortoRico" id="PortoRico">Porto Rico</option>
                                    <option value="Portugal"id="Portugal">Portugal</option>
                                    <option value="Qatar" id="Qatar">Qatar</option>
                                    <option value="Quenia"id="Quenia">Quênia</option>
                                    <option value="RepDominicana" id="RepDominicana">Rep. Dominicana</option>
                                    <option value="RepTcheca" id="RepTcheca">Rep. Tcheca</option>
                                    <option value="Romenia"id="Romenia">Romênia</option>
                                    <option value="Ruanda"id="Ruanda">Ruanda</option>
                                    <option value="Russia"id="Russia">Rússia</option>
                                    <option value="Saipan"id="Saipan">Saipan</option>
                                    <option value="SamoaAmericana"id="SamoaAmericana">Samoa Americana</option>
                                    <option value="Senegal" id="Senegal">Senegal</option>
                                    <option value="SerraLeone"id="SerraLeone">Serra Leone</option>
                                    <option value="Seychelles" id="Seychelles">Seychelles</option>
                                    <option value="Singapura"id="Singapura">Singapura</option>
                                    <option value="Siria"id="Siria">Síria</option>
                                    <option value="SriLanka" id="SriLanka">Sri Lanka</option>
                                    <option value="StKittsENevis" id="StKittsENevis">St. Kitts & Nevis</option>
                                    <option value="StLucia" id="StLucia">St. Lúcia</option>
                                    <option value="StVincent" id="StVincent">St. Vincent</option>
                                    <option value="Sudao"id="Sudao">Sudão</option>
                                    <option value="Suecia"id="Suecia">Suécia</option>
                                    <option value="Suiça" id="Suiça">Suiça</option>
                                    <option value="Suriname" id="Suriname">Suriname</option>
                                    <option value="Tailandia"id="Tailandia">Tailândia</option>
                                    <option value="Taiwan" id="Taiwan">Taiwan</option>
                                    <option value="Tanzania" id="Tanzania">Tanzânia</option>
                                    <option value="Togo"id="Togo">Togo</option>
                                    <option value="TrinidadETobago"id="TrinidadETobago">Trinidad & Tobago</option>
                                    <option value="Tunisia"id="Tunisia">Tunísia</option>
                                    <option value="Turquia" id="Turquia">Turquia</option>
                                    <option value="Ucrania"id="Ucrania">Ucrânia</option>
                                    <option value="Uganda" id="Uganda">Uganda</option>
                                    <option value="Uruguai" id="Uruguai">Uruguai</option>
                                    <option value="Venezuela"id="Venezuela">Venezuela</option>
                                    <option value="Vietna"id="Vietna">Vietnã</option>
                                    <option value="Zaire"id="Zaire">Zaire</option>
                                    <option value="Zambia" id="Zambia" >Zâmbia</option>
                                    <option value="Zimbabue"id="Zimbabue" >Zimbábue</option>
                                </select>
                                <br>
                                <label for="imagem">
                                    Foto de Perfil:
                                </label>
                                <input id="imagem" name="imagem" type="file" accept=".gif,.jpg,.jpeg,.png" > 
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
                <br>

            </div>              
        </div>
    </body>
</html>