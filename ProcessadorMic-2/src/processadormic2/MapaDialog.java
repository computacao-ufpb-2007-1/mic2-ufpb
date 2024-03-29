/*
 * MapaDialog.java
 *
 * Created on 12 de Janeiro de 2009, 23:07
 */

package processadormic2;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.Rectangle;
import java.awt.Toolkit;
import java.io.File;
import java.io.FileNotFoundException;

import java.lang.String;
import java.util.Formatter;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.BorderFactory;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author  Duilio
 */
public class MapaDialog extends javax.swing.JDialog {

     static final Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
    private static final Dimension appSize = new Dimension(320, 252);
    private static final int appPosX = (screenSize.width / 2) - (appSize.width / 2);
    private static final int appPosY = (int)(screenSize.height / 1.95) - (appSize.height / 2);
    private static Rectangle appBounds = new Rectangle(appPosX, appPosY, appSize.width, appSize.height);
    
     javax.swing.JPanel contentpanel = null;
    
     Scanner strEntrada;
     MapaRecord  record2 = new MapaRecord();
     int i = 0;
     String matrix[][] ;
     
    /** Creates new form MapaDialog */
    public MapaDialog(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();
        setBounds(appBounds);
        initContentPane();
       
    }

    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Mapa de Instruções");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 400, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 300, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents


public void initContentPane(){
     i= 0 ;
    try {
            strEntrada = new Scanner(new File("mapa.txt"));
        } catch (FileNotFoundException ex) {
            Logger.getLogger(LerMicroProg.class.getName()).log(Level.SEVERE, null, ex);
            javax.swing.JOptionPane.showMessageDialog(null, "Erro ao ler o arquivo.","Error",javax.swing.JOptionPane.ERROR_MESSAGE);
            
        }
     try{
            while(strEntrada.hasNext()){
                
                record2.setcodHexadecimal(strEntrada.next());
                record2.setnomeInstr(strEntrada.next());
               i++;
               
            }
            
        }
        catch(NoSuchElementException e){
            javax.swing.JOptionPane.showMessageDialog(null, "Erro ao ler o arquivo.","Error",javax.swing.JOptionPane.ERROR_MESSAGE);
            strEntrada.close();
        }
     
     strEntrada.close();
     matrix = new String [i][2];
     int j = 0;
      try {
            strEntrada = new Scanner(new File("mapa.txt"));
        } catch (FileNotFoundException ex) {
            Logger.getLogger(LerMicroProg.class.getName()).log(Level.SEVERE, null, ex);
            javax.swing.JOptionPane.showMessageDialog(null, "Erro ao ler o arquivo.","Error",javax.swing.JOptionPane.ERROR_MESSAGE);
            
        }
     try{
            while(strEntrada.hasNext()){
                
                record2.setcodHexadecimal(strEntrada.next());
                record2.setnomeInstr(strEntrada.next());
               matrix[j][0]=record2.getcodHexadecimal();
               matrix[j][1]=record2.getnomeInstr();
               j++;
               
            }
            
        }
        catch(NoSuchElementException e){
            javax.swing.JOptionPane.showMessageDialog(null, "Erro ao ler o arquivo.","Error",javax.swing.JOptionPane.ERROR_MESSAGE);
            strEntrada.close();
        }
     
            strEntrada.close();
            contentpanel =  new javax.swing.JPanel(new BorderLayout());
            JPanel mapaPanel = new JPanel(new BorderLayout());
            
            MapaTableModel model = new MapaTableModel(i,matrix);
          JTable  mapaTable = new JTable(model);
            mapaTable.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);
            mapaTable.setColumnSelectionAllowed(false);
            mapaTable.setRowSelectionAllowed(false);
            if(i>=11){
                mapaTable.getColumnModel().getColumn(0).setPreferredWidth(145);
                mapaTable.getColumnModel().getColumn(1).setPreferredWidth(145);
            }
            else{
                mapaTable.getColumnModel().getColumn(0).setPreferredWidth(154);
                mapaTable.getColumnModel().getColumn(1).setPreferredWidth(154);
            }
            mapaPanel .add(new JScrollPane(mapaTable), BorderLayout.CENTER);
           contentpanel.add(mapaPanel, BorderLayout.CENTER);
           
          
       
        this.setContentPane(contentpanel);
}
 
    /**
    * @param args the command line arguments
    */
    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                MapaDialog dialog = new MapaDialog(new javax.swing.JFrame(), true);
                dialog.addWindowListener(new java.awt.event.WindowAdapter() {
                    public void windowClosing(java.awt.event.WindowEvent e) {
                        System.exit(0);
                    }
                });
                dialog.setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    // End of variables declaration//GEN-END:variables

}
