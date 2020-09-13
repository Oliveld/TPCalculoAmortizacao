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
    </head>
    <body>
        <h1>Hello World!</h1>
         <form>
            
            <input type="number" class="texto" placeholder="Valor do emprestimo:" name="valorEmprestimo"/>
            
            <input type="number" class="texto" placeholder="Taxa de juros ao ano:" name="taxa"/>
            
            <input type="number" class="texto" placeholder="Numero de parcelas:" name="nparcelas"/>
            <input type="submit" class="Submit" name="Gerar"/>
        </form>

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
            <table border="1">


            <tr>
                <th>Mes</th>
                <th>Saldo devedor</th>
                <th>Amortizacao</th>
                <th>Juros</th>
                <th>Parcela</th>
            </tr>
            
            <tr>
                <th>0</th>
                <th><% out.print(saldoDevedor); %></th>
                <th>-</th>
                <th>-</th>
                <th>-</th>
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

            <th> <% out.print("Total"); %> </td>
            <th> <% out.print(totalSaldoDevedor); %> </td>
            <th> <% out.print(totalJuros); %> </td>
            <th> <% out.print(totalAmortizacao); %> </td>
            <th> <% out.print(totalParcelas); %> </td>
            </tr>
        </table>
    </body>
</html>

