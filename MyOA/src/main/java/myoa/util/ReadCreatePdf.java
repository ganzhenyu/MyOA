package myoa.util;
import java.io.BufferedReader;     
import java.io.FileOutputStream;     
import java.io.FileReader;     
import java.io.IOException;     
import com.lowagie.text.Document;     
import com.lowagie.text.DocumentException;     
import com.lowagie.text.Element;     
import com.lowagie.text.Font;     
import com.lowagie.text.PageSize;     
import com.lowagie.text.Paragraph;     
import com.lowagie.text.pdf.BaseFont;     
import com.lowagie.text.pdf.PdfWriter;     
    
/**   
 * 将从.txt中读到的内容写到pdf中。   
 * */    
public class ReadCreatePdf {     
    private final static String READFILEPATH = "C:\\Users\\gdglc8\\Desktop\\新建文件夹\\sql.txt";  //txt文件     
    private final static String WRITEFILEPATH = "C:\\Users\\gdglc8\\Desktop\\新建文件夹\\sql.pdf"; //生成的pdf文件     
    
    
    public static void zhuantext(String READFILEPATH,String WRITEFILEPATH,String name)  throws DocumentException,     
    IOException {
    	Document document = new Document(PageSize.A4, 80, 80, 60, 30);     
        PdfWriter.getInstance(document, new FileOutputStream(WRITEFILEPATH));     
        document.open();     
        BaseFont bfChinese = BaseFont.createFont("STSong-Light",     
        		"UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);     
        Font FontChinese = new Font(bfChinese, 18, Font.NORMAL);     
        Paragraph t = new Paragraph(name, FontChinese);    
        t.setAlignment(Element.ALIGN_CENTER);     
        t.setLeading(30.0f);     
        document.add(t);     
        FontChinese = new Font(bfChinese, 11, Font.NORMAL);     
        BufferedReader read = null;     
        try {     
            read = new BufferedReader(new FileReader(READFILEPATH));     
            String line = null;     
            while ((line = read.readLine()) != null) {     
                t = new Paragraph(line, FontChinese);     
                t.setAlignment(Element.ALIGN_LEFT);     
                t.setLeading(20.0f);     
                document.add(t);     
            }     
        } catch (Exception e) {     
            System.out.println("目标文件不存，或者不可读！");     
            e.printStackTrace();     
        } finally {     
            try {     
                read.close();     
                document.close();     
            } catch (IOException e) {     
                e.printStackTrace();     
            }     
        }     
        System.out.println("============执行成功！===========");     
    }
    
    
    public static void main(String[] args) {
    	try {
			zhuantext(READFILEPATH, WRITEFILEPATH, "mysql");
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}  
