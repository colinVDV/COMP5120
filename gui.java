import javax.swing.*;
import java.awt.BorderLayout;
import java.awt.event.*;
import java.sql.ResultSet;
import java.sql.SQLException;

public class gui {
    public static void main(String[] args) throws Exception {
        //Creating the Frame
        String dataBase = "comp5120";
        String Password = "Password.1";
        String port = "3306";
        String user = "root";

        JFrame frame = new JFrame("Chat Frame");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(400, 400);
        exec connection = new exec(dataBase, port, user, Password);
        // Creating the MenuBar and adding components
        JMenuBar mb = new JMenuBar();
        JMenu m1 = new JMenu("FILE");
        JMenu m2 = new JMenu("Help");
        mb.add(m1);
        mb.add(m2);
        JMenuItem m11 = new JMenuItem("Open");
        JMenuItem m22 = new JMenuItem("Save as");
        m1.add(m11);
        m1.add(m22);

        // Text Area at the Center
        JTextArea ta = new JTextArea();

        // Creating the panel at bottom and adding components
        JPanel panel = new JPanel(); // the panel is not visible in output
        JLabel label = new JLabel("Enter Query");
        JTextField tf = new JTextField(20);
        JButton send = new JButton("Send");
        JButton reset = new JButton("Reset");

        // Handling Button Click Event
        send.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try {
                    ResultSet temp = connection.execStatement(tf.getText());
                    String result = "";
                    while(temp.next()) {
                        result += (temp.getString(1) + "\n");
                    }
                    ta.setText(result);
                } catch(SQLException c) {
                    ta.setText("error, SQLException");
                }
            }
        });
        panel.add(label); // Components Added using Flow Layout
        panel.add(tf);
        panel.add(send);
        panel.add(reset);

        //Adding Components to the frame.
        frame.getContentPane().add(BorderLayout.SOUTH, panel);
        frame.getContentPane().add(BorderLayout.NORTH, mb);
        frame.getContentPane().add(BorderLayout.CENTER, ta);
        frame.setVisible(true);
    }
}