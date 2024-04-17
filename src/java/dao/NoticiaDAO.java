package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Noticia;

public class NoticiaDAO {

    public static Connection getConnection() {

        Connection con = null;
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://mysql04-farm36.kinghost.net:3306/devfelipeborge03", "devfelipeborge03", "f148101496");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        return con;
    }

    public static boolean adicionar(Noticia noticia) {
        boolean status = false;
        System.out.println("tesFDSFSDFSDFSDte");
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO noticias (titulo, conteudo, imagem) VALUES (?, ?, ?)");
            ps.setString(1, noticia.getTitulo());
            ps.setString(2, noticia.getConteudo());
            ps.setString(3, noticia.getImagem());
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                status = true;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        System.out.println("status" + status);
        return status;
    }

    public static Noticia buscarPorId(int id) {
        Noticia noticia = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM noticias WHERE id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                noticia = new Noticia();
                noticia.setId(rs.getInt("id"));
                noticia.setTitulo(rs.getString("titulo"));
                noticia.setConteudo(rs.getString("conteudo"));
                noticia.setImagem(rs.getString("imagem"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return noticia;
    }

    public static boolean remover(int id) {
        boolean status = false;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM noticias WHERE id = ?");
            ps.setInt(1, id);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                status = true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }

    public static boolean atualizar(Noticia noticia) {
        boolean status = false;
        try (Connection con = getConnection()) {
            PreparedStatement ps = con.prepareStatement("UPDATE noticias SET titulo = ?, conteudo = ?, imagem = ? WHERE id = ?");
            ps.setString(1, noticia.getTitulo());
            ps.setString(2, noticia.getConteudo());
            ps.setString(3, noticia.getImagem());
            ps.setInt(4, noticia.getId());
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                status = true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }

    public static List<Noticia> listarTodas() {
        List<Noticia> lista = new ArrayList<>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM noticias");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Noticia noticia = new Noticia();
                noticia.setId(rs.getInt("id"));
                noticia.setTitulo(rs.getString("titulo"));
                noticia.setConteudo(rs.getString("conteudo"));
                noticia.setImagem(rs.getString("imagem"));
                lista.add(noticia);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return lista;
    }

}
