import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;

import javax.swing.BorderFactory;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.SwingUtilities;

public class PaintDemo {

  public static void main(String[] args) {
    SwingUtilities.invokeLater(new Runnable() {
      public void run() {
        createAndShowGUI();
      }
    });
  }

  private static void createAndShowGUI() {
    JFrame f = new JFrame("Swing Paint Demo");
    f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    
    f.add(new MyPanel());
    f.pack();
    f.setVisible(true);
  }
}

class MyPanel extends JPanel {

  public MyPanel() {
    setBorder(BorderFactory.createLineBorder(Color.black));
  }

  public Dimension getPreferredSize() {
    return new Dimension(250, 200);
  }

  public void paintComponent(Graphics g) {
    super.paintComponent(g);

    // Draw Text
    g.drawString("This is my custom Panel!", 10, 20);
  }
}
