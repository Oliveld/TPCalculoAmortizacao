<%-- 
    Document   : tabelaPrice
    Created on : 13 de set de 2020, 16:50:07
    Author     : Fhayha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% 
    float saldoDevedor = 26000;
    float taxa = 5;
    int parcelas = 12;

       try{
        parcelas = Integer.parseInt(request.getParameter("nparcelas"));
        taxa = Float.parseFloat(request.getParameter("taxa"));
        saldoDevedor = Float.parseFloat(request.getParameter("valorEmprestimo"));
    }
    catch(Exception ex){

        parcelas = 0;
        taxa = 0;
        saldoDevedor = 0;
       
    }

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="StylePage.css">
    </head>
    <body>
        
        <%@include file="WEB-INF/jspf/menu.jsp" %>
        <div class="titulo"> 
        <h1>Java Server Pages</h1>
        <h2>Tabela Price</h2>
        </div>
        
        <div class="container">
         <form>
            
            <input type="number" class="texto" placeholder="Valor do emprestimo:" name="valorEmprestimo"/>
            <br>
            <input type="number" class="texto" placeholder="Taxa de juros ao ano:" name="taxa"/>
            <br>
            <input type="number" class="texto" placeholder="Numero de parcelas:" name="nparcelas"/>
            <br>
            <input type="submit" class="Submit" name="Gerar"/>
        </form>
            
        </div>
        
        <br>

        <% 
           
           
            float taxaConvertida = (taxa / 12) / 100;
            
            float amortizacao = 0;
            float juros = 0;
            float parcelafixa = (float) (saldoDevedor * (Math.pow( 1 + taxaConvertida, parcelas ) * taxaConvertida ) / (Math.pow(1 + (taxaConvertida), parcelas) - 1));

            float totalSaldoDevedor = 0;
            float totalJuros = 0;
            float totalAmortizacao = 0;
            float totalParcelas = 0;
        %>
        <div class="table-div">
            <table class="table">


            <tr>
                <th>Mes</th>
                <th>Saldo devedor</th>
                <th>Amortizacao</th>
                <th>Juros</th>
                <th>Parcela</th>
            </tr>
            
            <tr>
                <td>0</td>
                <td><% out.print(saldoDevedor); %></td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
            </tr>
        
        <%
            
            

            for(int i = 1; i <= parcelas; i++){

                totalSaldoDevedor += saldoDevedor;


                juros =  saldoDevedor * taxaConvertida;
                amortizacao = parcelafixa - juros;
                saldoDevedor -=  amortizacao;

                 totalJuros += juros;
                 totalAmortizacao += amortizacao;
                 totalParcelas += parcelafixa;
                %> 

                
                <tr>
                <td> <% out.print(i); %> </td>
                <td> <% out.print(saldoDevedor); %> </td>
                <td> <% out.print(juros); %> </td>
                <td> <% out.print(amortizacao); %> </td>
                <td> <% out.print(parcelafixa); %> </td>
                </tr>
                
                <%

               }
        
            %>
            <tr>

            <td> <% out.print("Total"); %> </td>
            <td> <% out.print(totalSaldoDevedor); %> </td>
            <td> <% out.print(totalJuros); %> </td>
            <td> <% out.print(totalAmortizacao); %> </td>
            <td> <% out.print(totalParcelas); %> </td>
            </tr>
        </table>
       </div>

    </body>
</html>

