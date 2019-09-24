<%-- 
    Document   : feliz
    Created on : 20/09/2019, 21:18:36
    Author     : florincy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <script type="text/javascript">
            function fe() {
                var b = document.getElementById("oi");

                b.setAttribute("selected", "selected");
            }

        </script>
        <button onclick="fe()">fe</button>
        <select>
            <option>1</option>
            <option id="oi">2</option>
        </select>
    </body>
</html>
