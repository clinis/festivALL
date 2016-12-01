<%
    Connection connection = null;
    String resource = "jdbc:mysql://localhost/festivall?user=root&password=password";
    Class.forName ("com.mysql.jdbc.Driver").newInstance ();
    connection = DriverManager.getConnection (resource);
%>
