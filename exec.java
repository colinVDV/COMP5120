import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
public class exec {
    private Statement stmt = null;
    private ResultSet rs = null;
    private Connection conn = null;
    public exec(String dbName,String port, String user, String pwd) throws SQLException{
        try {
        // The newInstance() call is a work around for some
        // broken Java implementations
        Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor()
        .newInstance();
        conn = DriverManager.getConnection("jdbc:mysql://localhost:"
        + port + "/" + dbName + "?" +
        "user=root&password=" + pwd);
        } catch (SQLException ex) {
        // handle the error
        System.out.println("SQLException: " + ex.getMessage());
        System.out.println("SQLState: " + ex.getSQLState());
        System.out.println("VendorError: " + ex.getErrorCode());
        }
    catch (Exception e) {
        System.out.println("Unkown Error:" + e.getMessage());
        }
    }

public ResultSet execStatement(String stmtIn) throws SQLException {
	stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	rs = stmt.executeQuery(stmtIn);
	return rs;
	}
}