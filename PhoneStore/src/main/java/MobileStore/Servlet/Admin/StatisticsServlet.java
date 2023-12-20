/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package MobileStore.Servlet.Admin;

import MobileStore.DB.InvoiceDB;
import MobileStore.data.Invoice;
import MobileStore.data.LineItem;
import MobileStore.data.Statistic;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
public class StatisticsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = "/Admin.jsp";
        String AdminStatistics = request.getParameter("AdminStatistics");
        if (AdminStatistics != null && AdminStatistics.equals("DateNow")) {
            Date now = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String formattedDate = dateFormat.format(now);

            request.setAttribute("date_start", formattedDate);
            request.setAttribute("date_end", formattedDate);
            List<Invoice> invoices = InvoiceDB.selectAllInvoice();
            float totalSales = 0;
            int totalProduct = 0;
            for (Invoice in : invoices) {
                if (dateFormat.format(in.getDateCreate()).equals(formattedDate)) {
                    totalSales = totalSales + in.getTotalInvoice();
                    for (LineItem li : in.getCart().getLslineItems()) {
                        totalProduct = totalProduct + li.getQuanlity();
                    }
                }
            }
            List<Statistic> statistics = new ArrayList<>();
            statistics.add(new Statistic(formattedDate, totalSales, totalProduct));
            request.setAttribute("statistics", statistics);
        }
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = "/Admin.jsp";
        String AdminStatistics = request.getParameter("AdminStatistics");
        if (AdminStatistics != null && AdminStatistics.equals("load_statistics")) {
            Date now = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            
            String start = request.getParameter("start_date");
            String end = request.getParameter("end_date");
            try {
                Date date_start = dateFormat.parse(start);
                Date date_end = dateFormat.parse(end);
                if (start != null && end != null && date_end.compareTo(date_start) > 0) {
                    request.setAttribute("date_start", start);
                    request.setAttribute("date_end", end);
                } else {
                    String formattedDate = dateFormat.format(now);
                    request.setAttribute("date_start", formattedDate);
                    request.setAttribute("date_end", formattedDate);
                    date_start = now;
                    date_end = now;
                }
                List<Invoice> invoices = InvoiceDB.selectAllInvoice();
                List<Statistic> statistics = new ArrayList<>();
                List<Date> date_creates = new ArrayList<>();
                for (Invoice in : invoices) {
                    if (in.getDateCreate().compareTo(date_end) <= 0
                            && in.getDateCreate().compareTo(date_start) >= 0) {
                        if (!date_creates.contains(in.getDateCreate())) {
                            statistics.add(new Statistic(dateFormat.format(in.getDateCreate())));
                            date_creates.add(in.getDateCreate());
                        } 
                        for (Statistic sta : statistics) {
                            if (sta.getStatisticDate().equals(dateFormat.format(in.getDateCreate()))) {
                                sta.setTotalSales(sta.getTotalSales() + in.getTotalInvoice());
                                for (LineItem li : in.getCart().getLslineItems()) {
                                    sta.setTotalProduct(sta.getTotalProduct() + +li.getQuanlity());
                                }
                            }
                        }
                    }
                }
                Collections.sort(statistics, Comparator.comparing(Statistic::getStatisticDate));
                request.setAttribute("statistics", statistics);
            } catch (ParseException ex) {
                Logger.getLogger(StatisticsServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

}
