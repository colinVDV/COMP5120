public class Main {
//Main class initiates a GUI instance and displays it.
    public static void main(String[] args){
            String dbName = "comp5120";
            String port = "3306";
            String userName = "root";
            String password = "Password.1";
			GUI GUI = new GUI(dbName, port, userName, password);
			GUI.display();
    }
}
