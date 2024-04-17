<%@page import="dao.NoticiaDAO,model.Noticia,java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="imagens/phone.png"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Notícias</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f7f7f7;
            }

            h1 {
                text-align: center;
                margin-top: 30px;
                color: #333;
            }

            table {
                width: 90%;
                margin: 20px auto;
                border-collapse: collapse;
                border: 1px solid #ccc;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            th, td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #333;
                color: #fff;
            }

            img {
                max-width: 100px;
                height: auto;
                display: block;
                margin: 0 auto;
            }

            a {
                display: block;
                text-align: center;
                margin-top: 20px;
                text-decoration: none;
                color: #333;
            }

            a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <h1>Lista de Notícias</h1>
        <table>
            <tr>
                <th>Título</th>
                <th>Conteúdo</th>
                <th>Imagem</th>
                <th>Editar</th>
                <th>Excluir</th>
            </tr>
            <c:forEach items="${noticias}" var="noticia">
                <tr>
                    <td>${noticia.getTitulo()}</td>
                    <td>${noticia.getConteudo()}</td>
                    <td><img src="${noticia.getImagem()}" alt="Imagem da Notícia" width="100"></td>
                    <td><a href="editarNoticia?id=${noticia.getId()}">Editar</a></td>
                    <td><a href="excluirNoticia?id=${noticia.getId()}" onclick="return confirm('Tem certeza que deseja excluir esta notícia?');">Excluir</a></td>
                </tr>
            </c:forEach>

        </table>

        <a href="home">Home</a>
        <a href="cadastrarNoticia">Cadastrar Notícia</a>

    </body>

</html>