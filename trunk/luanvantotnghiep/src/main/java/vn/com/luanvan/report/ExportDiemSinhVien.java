package vn.com.luanvan.report;

import java.awt.Color;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import vn.com.luanvan.model.Diem;
import vn.com.luanvan.model.HocPhan;
import vn.com.luanvan.model.NienKhoaHocKy;

import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

public class ExportDiemSinhVien extends AbstractPdfView{

	@SuppressWarnings("unchecked")
	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document document,
			PdfWriter writer, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		response.setHeader("Content-Type", "application/octet-stream");
		response.setHeader("Content-Disposition", "inline; filename=yourExcelFile.pdf");
		
		List<Object[]> printDiem = (List<Object[]>) model.get("danhSachDiemHocPhan");
		
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int year = cal.get(Calendar.YEAR);
	    int month = cal.get(Calendar.MONTH) + 1;
	    int day = cal.get(Calendar.DAY_OF_MONTH);
		
		BaseFont baseFont = BaseFont.createFont("c:\\WINDOWS\\fonts\\times.ttf", BaseFont.IDENTITY_H, true);
		
		Font f1;
		Font f2;
		Font f3;
		f1 = new Font(baseFont, 12);
		f2 = new Font(baseFont, 16);
		f3 = new Font(baseFont, 10);
		
		  String text = "CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM";
		    Paragraph p = new Paragraph(text,f1);
		    p.setAlignment(Element.ALIGN_CENTER);
		    document.add(p);
		    
		    text = "Độc lập - Tự do - Hạnh phúc";
		    p = new Paragraph(text,f1);
		    p.setAlignment(Element.ALIGN_CENTER);
		    document.add(p);
		
		    text = "Cần Thơ, ngày " + day + " tháng " + month + " năm " + year;
		    p = new Paragraph(text,f3);
		    p.setAlignment(Element.ALIGN_RIGHT);
		    p.setSpacingBefore(10);
		    p.setSpacingAfter(35);
		    document.add(p);
		    
		    text = "BẢNG ĐIỂM SINH VIÊN";
		    p = new Paragraph(text,f2);
		    p.setAlignment(Element.ALIGN_CENTER);
		    p.setSpacingAfter(25);	
		    document.add(p);
		    
		    PdfPTable table = new PdfPTable(8);
		    table.setSpacingBefore(20);
		    table.setSpacingAfter(30);
		    table.setWidthPercentage(100);
		    PdfPCell cell = new PdfPCell(new Paragraph("TT",f1));
		    
		    cell.setGrayFill(0.75f);
		    cell.setBackgroundColor(new Color(11, 122, 244));
		    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		    cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		    cell.setPadding(8);
		    table.addCell(cell);
		    
		    cell = new PdfPCell(new Paragraph("Mã số HP",f1));
		    cell.setGrayFill(0.75f);
		    cell.setBackgroundColor(new Color(11, 122, 244));
		    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		    cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		    cell.setPadding(8);
		    
		    table.addCell(cell);
		    
		    cell = new PdfPCell(new Paragraph("Tên HP",f1));
		    
		    cell.setGrayFill(0.75f);
		    cell.setBackgroundColor(new Color(11, 122, 244));
		    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		    cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		    cell.setPadding(8);
		    table.addCell(cell);
		    
		    cell = new PdfPCell(new Paragraph("Số TC",f1));
		   
		    cell.setGrayFill(0.75f);
		    cell.setBackgroundColor(new Color(11, 122, 244));
		    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		    cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		    cell.setPadding(8);
		    table.addCell(cell);
		   
		    cell = new PdfPCell(new Paragraph("Điểm",f1));
		    
		    cell.setGrayFill(0.75f);
		    cell.setBackgroundColor(new Color(11, 122, 244));
		    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		    cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		    cell.setPadding(8);
		    table.addCell(cell);
		    
		    cell = new PdfPCell(new Paragraph("Điểm DĐ",f1));
		    
		    cell.setGrayFill(0.75f);
		    cell.setBackgroundColor(new Color(11, 122, 244));
		    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		    cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		    cell.setPadding(8);
		    table.addCell(cell);
		    
		    cell = new PdfPCell(new Paragraph("Học kỳ",f1));
		    
		    cell.setGrayFill(0.75f);
		    cell.setBackgroundColor(new Color(11, 122, 244));
		    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		    cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		    cell.setPadding(8);
		    table.addCell(cell);
		    
		    cell = new PdfPCell(new Paragraph("Năm học",f1));
		    
		    cell.setGrayFill(0.75f);
		    cell.setBackgroundColor(new Color(11, 122, 244));
		    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		    cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		    cell.setPadding(8);
		    table.addCell(cell);
		    
		    
		    int i = 0;
		    
		    for(Object[] obj : printDiem){
		    	i++;
		    	HocPhan hocPhan = (HocPhan) obj[0];
		    	Diem diem = (Diem) obj[1];
		    	NienKhoaHocKy nienKhoaHocKy = (NienKhoaHocKy) obj[2];
		    	
		    	PdfPCell cellItem = new PdfPCell(new Paragraph(String.valueOf(i),f1));
		    	cellItem.setHorizontalAlignment(Element.ALIGN_CENTER);
		    	cellItem.setVerticalAlignment(Element.ALIGN_MIDDLE);
		    	cellItem.setPadding(8);
		    	table.addCell(cellItem);
		    	
		    	cellItem = new PdfPCell(new Paragraph(hocPhan.getMaHP(),f1));
		    	cellItem.setHorizontalAlignment(Element.ALIGN_CENTER);
		    	cellItem.setVerticalAlignment(Element.ALIGN_MIDDLE);
		    	cellItem.setPadding(8);
		    	table.addCell(cellItem);
		    	
		    	cellItem = new PdfPCell(new Paragraph(hocPhan.getTenHP(),f1));
		    	cellItem.setHorizontalAlignment(Element.ALIGN_CENTER);
		    	cellItem.setVerticalAlignment(Element.ALIGN_MIDDLE);
		    	cellItem.setPadding(8);
		    	table.addCell(cellItem);
		    	
		    	cellItem = new PdfPCell(new Paragraph(String.valueOf(hocPhan.getSoTC()),f1));
		    	cellItem.setHorizontalAlignment(Element.ALIGN_CENTER);
		    	cellItem.setVerticalAlignment(Element.ALIGN_MIDDLE);
		    	cellItem.setPadding(8);
		    	table.addCell(cellItem);
		    	
		    	cellItem = new PdfPCell(new Paragraph(String.valueOf(hocPhan.getSoTC()),f1));
		    	cellItem.setHorizontalAlignment(Element.ALIGN_CENTER);
		    	cellItem.setVerticalAlignment(Element.ALIGN_MIDDLE);
		    	cellItem.setPadding(8);
		    	table.addCell(cellItem);
		    	
		    	cellItem = new PdfPCell(new Paragraph(String.valueOf(diem.getDiem()),f1));
		    	cellItem.setHorizontalAlignment(Element.ALIGN_CENTER);
		    	cellItem.setVerticalAlignment(Element.ALIGN_MIDDLE);
		    	cellItem.setPadding(8);
		    	table.addCell(cellItem);
		    	
		    	cellItem = new PdfPCell(new Paragraph(String.valueOf(diem.getDiemDuDoan()),f1));
		    	cellItem.setHorizontalAlignment(Element.ALIGN_CENTER);
		    	cellItem.setVerticalAlignment(Element.ALIGN_MIDDLE);
		    	cellItem.setPadding(8);
		    	table.addCell(cellItem);
		    	
		    	cellItem = new PdfPCell(new Paragraph(String.valueOf(nienKhoaHocKy.getHocKy()),f1));
		    	cellItem.setHorizontalAlignment(Element.ALIGN_CENTER);
		    	cellItem.setVerticalAlignment(Element.ALIGN_MIDDLE);
		    	cellItem.setPadding(8);
		    	table.addCell(cellItem);
		    }
		    
		    document.add(table);
		    
	}

}
