<%@page import="model.Noticia"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html">
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="imagens/phone.png"/>
    <title>Editar Notícia</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        h1 {
            color: #d9534f;
            margin-bottom: 20px;
        }

        table {
            border-collapse: collapse;
            width: 50%;
            margin-top: 20px;
        }

        td, th {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        input[type="text"], input[type="password"], input[type="email"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Editar Notícia</h1>
    <form action="editaNoticiasbd" method="post">
        <table>
            <input type="hidden" name="id" id="hiddenField" value="${noticia.id}"/>
            <tr><td>Título:</td><td><input type="text" name="titulo" value="${noticia.titulo}"/></td></tr>
            <tr><td>Autor:</td><td><input type="text" name="autor" value="${noticia.autor}"/></td></tr>
            <tr><td>Conteúdo:</td><td><textarea name="conteudo">${noticia.conteudo}</textarea></td></tr>
            <tr><td>Data:</td><td><input type="text" name="data" value="${noticia.data}"/></td></tr>
            <tr><td colspan="2"><input type="submit" value="Salvar"/></td></tr>
        </table>
    </form>
</body>
</html>
