<%-- 
    Document   : amortizacao-constante
    Created on : Sep 7, 2020, 11:23:41 PM
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Double valorEmprestimo;
    int nparcelas, taxa;
    Exception requestException = null;
    try{
        nparcelas = Integer.parseInt(request.getParameter("nparcelas"));
        taxa = Integer.parseInt(request.getParameter("taxa"));
        valorEmprestimo = Double.parseDouble(request.getParameter("valorEmprestimo"));
    }
    catch(Exception ex){
        nparcelas = 0;
        taxa = 0;
        valorEmprestimo = 0.0;
        requestException = ex;
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculo de amortizacao constante</title>
    </head>
    <body>
        <h4><a href="home.jsp">Voltar</a></h4>
        <h1>Java Server Pages</h1>
        <h2>Amortizacao Constante</h2>
        <form>
            Valor do emprestimo:
            <input type="number" name="valorEmprestimo"/>
            Taxa de juros ao ano:
            <input type="number" name="taxa"/>
            Numero de parcelas:
            <input type="number" name="nparcelas"/>
            <input type="submit" name="Gerar"/>
        </form>
        <Br/>
        
        <table border="1">
            <tr>
                <th>Mes</th>
                <th>Saldo devedor</th>
                <th>Juros</th>
                <th>Amortizacao</th>
                <th>Parcela</th>
            </tr>
            <% if (request.getParameter("nparcelas") == null) {%>
            <tr><td colspan="2">Sem parametro</td></tr>
            <% } else if (requestException != null) {%>
            <tr><td colspan="2">Parametro invalido</td></tr>
            <% } %>
            <% if (request.getParameter("taxa") == null) {%>
            <tr><td colspan="2">Sem parametro</td></tr>
            <% } else if (requestException != null) {%>
            <tr><td colspan="2">Parametro invalido</td></tr>
            <% } %>
            
            <% if (request.getParameter("valorEmprestimo") == null) {%>
            <tr><td colspan="2">Sem parametro</td></tr>
            <% } else if (requestException != null) {%>
            <tr><td colspan="2">Parametro invalido</td></tr>
            <% } %>
         
            
            <% Double saldo = valorEmprestimo; 
             taxa = (taxa/12); 
             Double a = (valorEmprestimo/nparcelas); 
             Double j = (valorEmprestimo*taxa)/100; %>
            
            <% for (int i = 1; i <=nparcelas; i++) {%>
            <tr>
                <td><%= i%></td>
                <% if (i == 1) {%>
                <td><%= valorEmprestimo%></td>
                <td><%= j%></td>
                <% } else {%>
                <% j = (saldo*taxa)/100; %>
                <td><%= saldo%></td>
                <td><%= j%></td>
                <% } %>
                <td><%= a%></td>
                <th><%= a+j%></th>
                <% saldo = saldo-a; %>

            </tr>
            <% } %>
        </table>
    </body>
</html>
