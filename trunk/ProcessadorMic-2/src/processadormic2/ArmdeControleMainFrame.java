/*
 * ArmdeControleMainFrame.java
 *
 * Created on 8 de Janeiro de 2009, 16:13
 */

package processadormic2;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.Rectangle;
import java.awt.Toolkit;
import javax.swing.JPanel;
import javax.swing.JSplitPane;

/**
 *
 * @author  Duilio
 */
public class ArmdeControleMainFrame extends javax.swing.JFrame {

    static final Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
    private static final Dimension appSize = new Dimension(775, 440);
    private static final int appPosX = (screenSize.width / 2) - (appSize.width / 2);
    private static final int appPosY = (screenSize.height / 2) - (appSize.height / 2);
     Rectangle appBounds = new Rectangle(appPosX, appPosY, appSize.width, appSize.height);
    
     private JPanel contentPanel = null;
     public static JSplitPane splitPane,innerSplitPane = null;
     public JPanel leftPanel = new JPanel(new BorderLayout());
     
     LerMicroProg lmp = new LerMicroProg();
     
     
     Converter conv = new Converter();
     CreditoDialog cred = null;
     public MapaDialog md = null;
     public RemoveDialog rd = null;
     public AddDialog ad = null;
     
     String nomeInstrucao;
     String codHexa;
     int codDec;
     int numMicroInstrucoes;
     
    /** Creates new form ArmdeControleMainFrame */
    public ArmdeControleMainFrame() {
        
        
        initComponents();
        setBounds(appBounds);
        
        
        
    }

    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel2 = new javax.swing.JPanel();
        jPanel4 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jScrollPane2 = new javax.swing.JScrollPane();
        jTextArea2 = new javax.swing.JTextArea();
        jPanel3 = new javax.swing.JPanel();
        jPanel5 = new javax.swing.JPanel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jTextField1 = new javax.swing.JTextField();
        jTextField2 = new javax.swing.JTextField();
        jTextField3 = new javax.swing.JTextField();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();
        jButton4 = new javax.swing.JButton();
        jButton5 = new javax.swing.JButton();
        jButton6 = new javax.swing.JButton();

        jPanel2.setLayout(new java.awt.BorderLayout());

        jPanel4.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel2.setText("Nome da Instrução:");
        jPanel4.add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 10, -1, -1));
        jPanel4.add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(150, 10, -1, -1));

        jTextArea2.setColumns(20);
        jTextArea2.setEditable(false);
        jTextArea2.setRows(5);
        jScrollPane2.setViewportView(jTextArea2);

        jPanel4.add(jScrollPane2, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 40, 300, 160));

        jPanel2.add(jPanel4, java.awt.BorderLayout.CENTER);

        jPanel3.setLayout(new java.awt.BorderLayout());

        jPanel5.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel4.setText("Código Hexadecimal:");
        jPanel5.add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 50, -1, -1));

        jLabel5.setText("Número de Microinstruções:");
        jPanel5.add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 80, -1, -1));

        jLabel6.setText("Nome da Instruição:");
        jPanel5.add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 20, -1, -1));
        jPanel5.add(jTextField1, new org.netbeans.lib.awtextra.AbsoluteConstraints(200, 78, 120, -1));
        jPanel5.add(jTextField2, new org.netbeans.lib.awtextra.AbsoluteConstraints(200, 18, 120, -1));
        jPanel5.add(jTextField3, new org.netbeans.lib.awtextra.AbsoluteConstraints(200, 48, 120, -1));

        jButton1.setText("Créditos");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        jPanel5.add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(230, 140, 90, -1));

        jButton2.setText("Buscar");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });
        jPanel5.add(jButton2, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 140, 100, -1));

        jButton3.setText("Sair");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });
        jPanel5.add(jButton3, new org.netbeans.lib.awtextra.AbsoluteConstraints(130, 140, 90, -1));

        jButton4.setText("Remover");
        jButton4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton4ActionPerformed(evt);
            }
        });
        jPanel5.add(jButton4, new org.netbeans.lib.awtextra.AbsoluteConstraints(130, 110, 90, -1));

        jButton5.setText("Adicionar");
        jButton5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton5ActionPerformed(evt);
            }
        });
        jPanel5.add(jButton5, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 110, 100, -1));

        jButton6.setText("Mapa");
        jButton6.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton6ActionPerformed(evt);
            }
        });
        jPanel5.add(jButton6, new org.netbeans.lib.awtextra.AbsoluteConstraints(230, 110, 90, -1));

        jPanel3.add(jPanel5, java.awt.BorderLayout.CENTER);

        setDefaultCloseOperation(javax.swing.WindowConstants.DO_NOTHING_ON_CLOSE);
        setTitle("Processador Mic-2");

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

private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
    System.exit(0);
}//GEN-LAST:event_jButton3ActionPerformed

private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
    
    nomeInstrucao = jTextField2.getText();
    codHexa = jTextField3.getText();
    
    
    Boolean continua = true;
    
    if(codHexa.contains("0x")== true){
        char array[] = codHexa.toCharArray();
    char arrayAux[] = new char[array.length  - 2];
    if(arrayAux.length == 0){
        continua = false;
        javax.swing.JOptionPane.showMessageDialog(null, "Código hexadecimal inválido!","Error",javax.swing.JOptionPane.ERROR_MESSAGE);
        
    }
        int k =0;
        for(int i = 0; i<array.length; i++){
            if(i>1){
                arrayAux[k] = array[i];
                k++;
             }
        
        }
    
        codHexa = String.valueOf(arrayAux);
        System.out.println(codHexa);
    
    }
    
    else{
        javax.swing.JOptionPane.showMessageDialog(null, "Código hexadecimal inválido! Insira o código começando por 0x e tente novamente.","Error",javax.swing.JOptionPane.ERROR_MESSAGE);
        continua = false;
    }
    
    if(continua == true) {
        
        String aux = jTextField1.getText();
        Boolean b = validaCodHexa(codHexa);
        if(b == false){
            javax.swing.JOptionPane.showMessageDialog(null, "Código hexadecimal inválido! Tente novamente.","Error",javax.swing.JOptionPane.ERROR_MESSAGE);
            continua = false;
        }
         else if(aux.equals("") == true ){
            javax.swing.JOptionPane.showMessageDialog(null, "Por favor insira o número de microinstruções e tente novamente.","Error",javax.swing.JOptionPane.ERROR_MESSAGE);
            continua = false;
         }
         else if (aux.equals("") == false){
            try{
                numMicroInstrucoes = Integer.parseInt(aux); 
            }
            catch(Exception e){
                javax.swing.JOptionPane.showMessageDialog(null, "Número de Microinstruções inválido! Tente novamente.","Error",javax.swing.JOptionPane.ERROR_MESSAGE);
                continua = false;
            }
        
         }
        
        if(continua == true){
            jLabel3.setText(nomeInstrucao);
            codDec = conv.HexatoDec(codHexa);
            
            lmp.ExecutaBusca(codDec,numMicroInstrucoes);
             
        }
    
    }
   
    
}//GEN-LAST:event_jButton2ActionPerformed

private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
    cred = new CreditoDialog(new javax.swing.JFrame(),true);
    cred.setVisible(true);
}//GEN-LAST:event_jButton1ActionPerformed

private void jButton4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton4ActionPerformed
    rd = new RemoveDialog(new javax.swing.JFrame(), true);
    rd.setVisible(true);
}//GEN-LAST:event_jButton4ActionPerformed

private void jButton5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton5ActionPerformed
    //chama um dialog para coloccar o nome da instrucao e o cd hexadecial, validando o codigohexa entao criamos a add dialog

    String nome = javax.swing.JOptionPane.showInputDialog("Insira o nome da nova instrução:");
    String codh;
    if(nome != null){
        codh = javax.swing.JOptionPane.showInputDialog("Insira o código hexadecimal da nova instrução:");
        boolean teste = validaCodHexa(codh);
        while(teste != true){
            javax.swing.JOptionPane.showMessageDialog(null, "Código hexadecimal inválido! Tente novamente!");
            codh = javax.swing.JOptionPane.showInputDialog("Insira o código hexadecimal da nova instrução:");
            teste = validaCodHexa(codh);
        }

        Converter c = new Converter();
        if(c.HexatoDec(codh)<511){
            ad = new AddDialog(new javax.swing.JFrame(), false);
            ad.setDados(nome,codh);
            ad.setVisible(true);
        }
        else
            javax.swing.JOptionPane.showMessageDialog(null, "Código hexadecimal além do limite! ( 0-512 )");

    }
    else{
        javax.swing.JOptionPane.showMessageDialog(null, "Não fora inserido o nome da nova instrução!");
    }
   

    
}//GEN-LAST:event_jButton5ActionPerformed

private void jButton6ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton6ActionPerformed
    md = new MapaDialog(new javax.swing.JFrame(), true);
    md.setVisible(true);
}//GEN-LAST:event_jButton6ActionPerformed


    
    public Boolean validaCodHexa(String a){
        
        char array[] = a.toCharArray();
        
        Boolean b = true;
        for(int i = 0; i<array.length; i++){
            
            if(array[i]!= '0'&& array[i]!= '1'&& array[i]!= '2'&& array[i]!= '3'&& array[i]!= '4'&& array[i]!= '5'
                    && array[i]!= '6'&& array[i]!= '7'&& array[i]!= '8'&& array[i]!= '9'&& array[i]!= 'A'&& array[i]!= 'B'
                    && array[i]!= 'C'&& array[i]!= 'D'&& array[i]!= 'E'&& array[i]!= 'F'){
                b =false;
                break;
            }
            else
                b = true;
        }
        return b;
        
    }
    public void initContentPane(){
        contentPanel = new JPanel(new BorderLayout());
        
        innerSplitPane = new JSplitPane(JSplitPane.VERTICAL_SPLIT, true,jPanel2 ,jPanel3 );
        innerSplitPane.setDividerLocation(230);        
        leftPanel.add(innerSplitPane);
        
         splitPane = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT, true, leftPanel, lmp.contentpanel);
             
         splitPane.setDividerLocation(360);      
         contentPanel.add(splitPane, BorderLayout.CENTER);
         
         this.setContentPane(contentPanel);
    }
    /**
    * @param args the command line arguments
    */
    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new ArmdeControleMainFrame().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JButton jButton4;
    private javax.swing.JButton jButton5;
    private javax.swing.JButton jButton6;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JScrollPane jScrollPane2;
    public javax.swing.JTextArea jTextArea2;
    private javax.swing.JTextField jTextField1;
    private javax.swing.JTextField jTextField2;
    private javax.swing.JTextField jTextField3;
    // End of variables declaration//GEN-END:variables

}
