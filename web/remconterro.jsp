<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="imagens/phone.png"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Remoção de Notícia</title>
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

        a {
            text-decoration: none;
            color: #333;
            padding: 10px 20px;
            border: 2px solid #333;
            border-radius: 5px;
            margin: 10px;
            transition: background-color 0.3s, color 0.3s;
        }

        a:hover {
            background-color: #333;
            color: #fff;
        }
    </style>
</head>
<body>
    <h1>Contato não removido, consulte os logs ... </h1>
    <a href="home">Home</a>
    <a href="adicionaNoticia">Adicionar Notícia</a>
    <a href="listaNoticias">Listar Notícias</a>
</body>
</html>
