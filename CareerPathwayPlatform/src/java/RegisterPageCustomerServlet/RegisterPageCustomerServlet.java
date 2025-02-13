import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.PreparedStatement;
/**
* Servlet implementation class ResgisterPageCustomerServlet
*/
@WebServlet("/ResgisterPageCustomerServlet")
public class RegisterPageCustomerServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
/**
* @see HttpServlet#HttpServlet()
*/
public RegisterPageCustomerServlet() {
super();
// TODO Auto-generated constructor stub
}
/**
* @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
response)
*/
protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

// TODO Auto-generated method stub
response.getWriter().append("Served at: ").append(request.getContextPath());
}

/**
* @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
response)
*/
protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

// TODO Auto-generated method stub
//doGet(request, response);
response.setContentType("text/html");
PrintWriter out=response.getWriter();
String cName=request.getParameter("custName");
String uName=request.getParameter("username");
String cemail=request.getParameter("cemail");
String cpnum=request.getParameter("cpnum");
String cpword=request.getParameter("cpword");
String ccpword=request.getParameter("ccpword");
int custID=0;

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/carrentaldb", "root", "root");

Statement stmt=con.createStatement();
String sql="select custID from custdetails order by custID";
ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{
custID=rs.getInt("custID");
}
custID= custID + 1;

boolean check = false;
if(cpword.equalsIgnoreCase(ccpword))
check = true;

if(check==true)
{
PreparedStatement ps = (PreparedStatement)
con.prepareStatement("INSERT INTO custdetails VALUES (?,?,?,?,?,?)");

ps.setInt(1, custID);
ps.setString(2, cName);
ps.setString(3, uName);
ps.setString(4, cemail);
ps.setString(5, cpnum);
ps.setString(6, cpword);
ps.executeUpdate();
ps.close();
out.println("<html>");
out.println("<head>");
out.println(" <title>Registration Success</title>");
out.println(" <style>");
out.println(" body {");
out.println(" background-color: #f7f7f7;");
out.println(" font-family: Arial, sans-serif;");
out.println(" }");
out.println("");
out.println(" .container {");
out.println(" max-width: 400px;");
out.println(" margin: 50px auto;");
out.println(" padding: 20px;");
out.println(" background-color: #fff;");
out.println(" box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);");
out.println(" border-radius: 4px;");
out.println(" }");
out.println("");
out.println(" h1 {");
out.println(" font-size: 24px;");
out.println(" margin-bottom: 20px;");
out.println(" text-align: center;");
out.println(" }");
out.println("");
out.println(" p {");
out.println(" margin-bottom: 20px;");
out.println(" }");
out.println("");
out.println(" .message {");
out.println(" text-align: center;");
out.println(" font-size: 18px;");
out.println(" color: #4caf50;");
out.println(" }");
out.println("");
out.println(" .button-container {");
out.println(" text-align: center;");
out.println(" }");
out.println("");
out.println(" .button {");
out.println(" display: inline-block;");
out.println(" padding: 10px 20px;");
out.println(" background-color: #4caf50;");
out.println(" color: #fff;");
out.println(" text-decoration: none;");
out.println(" border-radius: 4px;");
out.println(" transition: background-color 0.3s ease;");
out.println(" }");
out.println("");
out.println(" .button:hover {");
out.println(" background-color: #45a049;");
out.println(" }");
out.println(" </style>");
out.println("</head>");
out.println("<body>");
out.println(" <div class=\"container\">");
out.println(" <h1>Registration Successful</h1>");
out.println(" <p class=\"message\">Congratulations! You have successfully registered.</p>");
out.println(" <div class=\"button-container\">");
out.println(" <a href=\"login.jsp\" class=\"button\">Continue</a>");

out.println(" </div>");
out.println(" </div>");
out.println("</body>");
out.println("</html>");
}
else
{
out.println("<html>");
out.println("<head>");
out.println(" <title>Registration Failed</title>");
out.println(" <style>");
out.println(" body {");
out.println(" background-color: #f7f7f7;");
out.println(" font-family: Arial, sans-serif;");
out.println(" }");
out.println("");
out.println(" .container {");
out.println(" max-width: 400px;");
out.println(" margin: 50px auto;");
out.println(" padding: 20px;");
out.println(" background-color: #fff;");
out.println(" box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);");
out.println(" border-radius: 4px;");
out.println(" }");
out.println("");
out.println(" h1 {");
out.println(" font-size: 24px;");
out.println(" margin-bottom: 20px;");
out.println(" text-align: center;");
out.println(" }");
out.println("");
out.println(" p {");
out.println(" margin-bottom: 20px;");
out.println(" }");
out.println("");
out.println(" .message {");
out.println(" text-align: center;");
out.println(" font-size: 18px;");
out.println(" color: #ff4d4d;");
out.println(" }");
out.println("");
out.println(" .button-container {");
out.println(" text-align: center;");
out.println(" }");
out.println("");
out.println(" .button {");
out.println(" display: inline-block;");
out.println(" padding: 10px 20px;");
out.println(" background-color: #ff4d4d;");
out.println(" color: #fff;");
out.println(" text-decoration: none;");
out.println(" border-radius: 4px;");
out.println(" transition: background-color 0.3s ease;");
out.println(" }");
out.println("");
out.println(" .button:hover {");
out.println(" background-color: #ff3333;");
out.println(" }");
out.println(" </style>");
out.println("</head>");
out.println("<body>");
out.println(" <div class=\"container\">");
out.println(" <h1>Registration Failed</h1>");
out.println(" <p class=\"message\">Oops! Something went wrong during the registration process.</p>");

out.println(" <div class=\"button-container\">");
out.println(" <a href=\"RegisterPageCustomer.jsp\" class=\"button\">Go Back</a>");

out.println(" </div>");
out.println(" </div>");
out.println("</body>");
out.println("</html>");
}

stmt.close();
con.close();
}
catch(Exception e2)
{
System.out.println(e2);
}
out.close();
}

}