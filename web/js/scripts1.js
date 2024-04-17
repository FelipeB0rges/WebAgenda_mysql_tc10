function editar(id) {
    post('/WebAgenda_mysql_tc10/editaNoticia', {id: id});
}

/**
 * Envia uma solicitação para o URL especificado de um formulário. Isso mudará a localização da janela.
 * @param {string} path o caminho para enviar a solicitação POST
 * @param {object} params os parâmetros para adicionar ao URL
 * @param {string} [method=post] o método a ser usado no formulário
 */
function post(path, params, method = 'post') {
    // O restante deste código assume que você não está usando uma biblioteca.
    // Pode ser simplificado se você estiver usando uma.
    const form = document.createElement('form');
    form.method = method;
    form.action = path;

    for (const key in params) {
        if (params.hasOwnProperty(key)) {
            const hiddenField = document.createElement('input');
            hiddenField.type = 'hidden';
            hiddenField.name = key;
            hiddenField.value = params[key];

            form.appendChild(hiddenField);
        }
    }

    console.log(params)
    
    document.body.appendChild(form);
    form.submit();
}
