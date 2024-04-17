package controller;

import dao.NoticiaDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Noticia;

@WebServlet(name = "Controller", urlPatterns = {"/Controller", "/cadastrarNoticia", "/cadastrarNoticiaBD", "/listarNoticias", "/home", "/editarNoticia", "/excluirNoticia","/editarNoticiaBD"})
public class Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getServletPath();

        System.out.println("teste");

        if (action.equals("/cadastrarNoticia")) {
            response.sendRedirect("cadastrarNoticia.jsp");
        }

        if (action.equals("/listarNoticias")) {
            List<Noticia> noticias = NoticiaDAO.listarTodas();
            request.setAttribute("noticias", noticias);
            RequestDispatcher dispatcher = request.getRequestDispatcher("listarNoticias.jsp");
            dispatcher.forward(request, response);
        }

        if (action.equals("/editarNoticia")) {
            System.out.println("caiu aqui ok");
            editarNoticia(request, response);
        }

        if (action.equals("/excluirNoticia")) {
            excluirNoticia(request, response);
        }

        if (action.equals("/home")) {
            response.sendRedirect("index.html");
        }

    }

    private void editarNoticia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Noticia noticia = NoticiaDAO.buscarPorId(id);
        request.setAttribute("noticia", noticia);
        RequestDispatcher dispatcher = request.getRequestDispatcher("formularioEdicao.jsp"); // Você precisa criar essa JSP
        dispatcher.forward(request, response);
    }

    private void excluirNoticia(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        NoticiaDAO.remover(id);
        response.sendRedirect("listarNoticias");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getServletPath();
        Noticia noticia = new Noticia();

        if (action.equals("/cadastrarNoticiaBD")) {
            noticia.setTitulo(request.getParameter("titulo"));
            noticia.setConteudo(request.getParameter("conteudo"));
            noticia.setImagem(request.getParameter("imagem"));

            if (NoticiaDAO.adicionar(noticia)) {
                response.sendRedirect("cadNoticiaSucesso.jsp");
            } else {
                response.sendRedirect("cadNoticiaErro.jsp");
            }
        } else if (action.equals("/editarNoticiaBD")) {
            noticia.setId(Integer.parseInt(request.getParameter("id")));
            noticia.setTitulo(request.getParameter("titulo"));
            noticia.setConteudo(request.getParameter("conteudo"));
            noticia.setImagem(request.getParameter("imagem"));

            if (NoticiaDAO.atualizar(noticia)) {
                response.sendRedirect("listarNoticias");
            } else {
                response.sendRedirect("editNoticiaErro.jsp");
            }
        }

    }
}
