<%-- 
    Document   : amortizacao_Americana
    Created on : 9 de set de 2020, 15:19:54
    Author     : Fhayha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>

          <table border="1">

            <tr>
                <th>Mes</th>
                <th>Saldo devedor</th>
                <th>Amortizacao</th>
                <th>Juros</th>
                <th>Parcela</th>
            </tr>


        
        <%
            int parcelas = 10;
            double emprestimo = 50000;
            double juros = 3;
            double totalJuros = 0;

                int mes = 0;
                double saldoDevedor = 0;
                double _juros = 0;
                double prestacao = 0;
                double amortizacao = 0;
           

            for(int i = 1; i <= parcelas; i++){
                //calcula juros da prestação
                double jurosPrestacao = emprestimo * (juros / 100);
                
                //soma o total de juros pago
                totalJuros += jurosPrestacao; 
                mes = i;
                 saldoDevedor = emprestimo;
                 _juros = jurosPrestacao;
                 prestacao = jurosPrestacao;
                 amortizacao = 0;


                //Na ultima parcela paga a o juros mais o emprestimo
                if(i == parcelas){

                    prestacao = jurosPrestacao + emprestimo;
                    amortizacao = emprestimo;
                    saldoDevedor = 0;

                }else{
                    
                    prestacao = jurosPrestacao;

                }
            %>

            <tr>
                 <td>  <% out.print(mes); %>   </td>
                 <td><%  out.print(saldoDevedor); %> </td>
                 <td><%   out.print(amortizacao); %></td>
                 <td><%  out.print(jurosPrestacao); %> </td>
                 <td><%  out.print(prestacao); %></td>
            </tr>

            
            <%
                

            }
            %>
            <tr>
                 <td> - </td>
                 <td> - </td>
                 <td> - </td>
                 <td> - </td>
                 <td> - </td>
            
            </tr>
            <tr>


                 <td>  Total  </td>
                 <td> - </td>
                 <td><%  out.print(amortizacao);  %> </td>
                 <td><%   out.print(totalJuros); %></td>
                 <td><%  out.print(emprestimo + totalJuros);  %></td>
            </tr>


 

      
      
      
        
        </table>
    </body>
</html>
