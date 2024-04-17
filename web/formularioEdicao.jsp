<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
        }

        h1 {
            text-align: center;
            margin-top: 30px;
            color: #333;
        }

        form {
            width: 50%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 10px;
        }

        input[type="text"],
        input[type="file"],
        textarea {
            width: calc(100% - 20px);
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
    <h1>Editar Notícia</h1>
    <form action="editarNoticiaBD" method="post">
        <input type="hidden" name="id" value="${noticia.getId()}"/>
        <table>
            <tr>
                <td>Título:</td>
                <td><input type="text" name="titulo" value="${noticia.getTitulo()}"/></td>
            </tr>
            <tr>
                <td>Conteúdo:</td>
                <td><textarea name="conteudo" rows="4" cols="50">${noticia.getConteudo()}</textarea></td>
            </tr>
            <tr>
                <td>Imagem:</td>
                <td><input type="text" name="imagem" value="${noticia.getImagem()}"/></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Atualizar Notícia"/></td>
            </tr>
        </table>
    </form>
</body>
</html>
