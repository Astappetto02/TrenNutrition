package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Ordine;
import model.OrdineDAO;
import model.Prodotto;
import model.ProdottoDAO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(value="/visualizzaordine")
public class VisualizzaOrdineServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int numOrdine = Integer.parseInt(request.getParameter("num"));
        OrdineDAO ordineDAO = new OrdineDAO();
        Ordine ordine = ordineDAO.doRetriveByNumeroOrdine(numOrdine);
        ordine = ordineDAO.doRetriveProdottiOrdine(ordine);

        List<Integer> idProdotti = ordine.getIdProdotti();
        List<Boolean> esisteProdotti = new ArrayList<>();
        ProdottoDAO prodottoDAO = new ProdottoDAO();
        for (Integer id : idProdotti){
            esisteProdotti.add(prodottoDAO.esisteProdotto(id));
        }
        request.setAttribute("esiste",esisteProdotti);
        request.setAttribute("ordine",ordine);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/visualizzaOrdine.jsp");
        dispatcher.forward(request,response);
    }
}
