<%-- 
    Document   : amortizacao-constante
    Created on : Sep 7, 2020, 11:23:41 PM
    Author     : Daniel
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Double valorEmprestimo, taxa;
    int nparcelas;
    Exception requestException = null;
    try{
        nparcelas = Integer.parseInt(request.getParameter("nparcelas"));
        taxa = Double.parseDouble(request.getParameter("taxa"));
        valorEmprestimo = Double.parseDouble(request.getParameter("valorEmprestimo"));
    }
    catch(Exception ex){
        nparcelas = 0;
        taxa = 0.0;
        valorEmprestimo = 0.0;
        requestException = ex;
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="StylePage.css">
        <title>Calculo de amortizacao constante</title>
    </head>
    <body>

        <!-- Titulo -->
        <div class="titulo"> 
        <h4><a href="index.jsp">Voltar</a></h4>

        <h1>Java Server Pages</h1>
        <h2>Amortizacao Constante</h2>
        </div>
        <form>
            
            <input type="number" class="texto" placeholder="Valor do emprestimo:" name="valorEmprestimo"/>
            
            <input type="number" class="texto" placeholder="Taxa de juros ao ano:" name="taxa"/>
            
            <input type="number" class="texto" placeholder="Numero de parcelas:" name="nparcelas"/>
            <input type="submit" class="Submit" name="Gerar"/>
        </form>
        <Br/>
        <div class="table-div">
        <table class="table">
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
             Double j = (valorEmprestimo*taxa)/100; 
            DecimalFormat df = new DecimalFormat("#0.00");
            df.format(taxa); %>
            
            <% for (int i = 1; i <= nparcelas; i++) {%>
            <tr>
                <td><%= i%></td>
                <% if (i == 1) {%>
                
                <td><%= valorEmprestimo%></td>
                <td><%= df.format(j)%></td>
                <% } else {%>
                
                <% j = (saldo*taxa)/100; %>
                <td><%= df.format(saldo)%></td>
                <td><%= df.format(j)%></td>

                
                <% } %>
                <td><%= df.format(a)%></td>
                <th><%= df.format(a+j)%></th>
                <% saldo -= a; %>

            </tr>
            <% } %>
        </table>
        </div>
    </body>
</html>
