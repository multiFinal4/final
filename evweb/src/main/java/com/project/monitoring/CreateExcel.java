package com.project.monitoring;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.web.util.WebUtils;

import com.project.charge.ChargeDTO;
import com.project.charger.ChargerDTO;
import com.project.station.StationDTO;
@Service
public class CreateExcel {
	
	
	public String createXlsx(StationDTO station,List<ChargerDTO> chargerlist,List<ChargeDTO> chargelist, double monweekamount,double monthamount, HttpSession session){
		// Workbook 생성
        Workbook xlsxWb = new XSSFWorkbook(); // Excel 2007 이상
        // *** Sheet-------------------------------------------------
        // Sheet 생성
        Sheet sheet1 = xlsxWb.createSheet("충전소 정보");
        Sheet sheet2 = xlsxWb.createSheet("월간 충전량");
        // 컬럼 너비 설정
        for(int i=0; i<10;i++) {
        	sheet1.setColumnWidth(i, 4000); //4000:15(125픽셀)
        }
        sheet2.setColumnWidth(0, 2000); 
        sheet2.setColumnWidth(1, 4000); 
        sheet2.setColumnWidth(2, 5000); 
        sheet2.setColumnWidth(3, 5000); 
        sheet2.setColumnWidth(4, 3000);
        // *** Style--------------------------------------------------
        // Cell 스타일 생성
        CellStyle cellStyle = xlsxWb.createCellStyle();
        // 줄 바꿈
        cellStyle.setWrapText(true);
        // Cell 색깔, 무늬 채우기
        // cellStyle.setFillForegroundColor(HSSFColor.LIME.index);
        // cellStyle.setFillPattern(CellStyle.BIG_SPOTS);
        Row row = null;
        Cell cell = null;
        //----------------------------------------------------------
         
        // 첫 번째 줄
        row = sheet1.createRow(0);
        // 첫 번째 줄에 Cell 설정하기-------------
        cell = row.createCell(0);
        cell.setCellValue("충전기 정보");
        // 셀병합
        sheet1.addMergedRegion(new CellRangeAddress(
                0, //first row (0-based)
                0, //last row  (0-based)
                0, //first column (0-based)
                1  //last column  (0-based)
        ));
        for(int i=1;i<5;i++) {
        	sheet1.addMergedRegion(new CellRangeAddress(
                    i, //first row (0-based)
                    i, //last row  (0-based)
                    1, //first column (0-based)
                    4  //last column  (0-based)
            ));
        }
        sheet2.addMergedRegion(new CellRangeAddress(
                0, //first row (0-based)
                0, //last row  (0-based)
                0, //first column (0-based)
                1  //last column  (0-based)
        ));
        // 두 번째 줄
        row = sheet1.createRow(1);
        // 두 번째 줄에 Cell 설정하기-------------
        cell = row.createCell(0);
        cell.setCellValue("충전소 ID");
        cell = row.createCell(1);
        cell.setCellValue(station.getStation_id());
       
        row = sheet1.createRow(2);
        cell = row.createCell(0);
        cell.setCellValue("충전소 이름");
        cell = row.createCell(1);
        cell.setCellValue(station.getStation_name());
 
        row = sheet1.createRow(3);
        cell = row.createCell(0);
        cell.setCellValue("충전소 위치");
        cell = row.createCell(1);
        cell.setCellValue(station.getAddr_do()+" "+station.getAddr_sigun()+" "+station.getAddr_detail());
        
        row = sheet1.createRow(4);
        cell = row.createCell(0);
        cell.setCellValue("구분");
        cell = row.createCell(1);
        cell.setCellValue(station.getKind());
        
        row = sheet1.createRow(4);
        cell = row.createCell(0);
        cell.setCellValue("이용시간");
        cell = row.createCell(1);
        cell.setCellValue(station.getUse_time());
        
        row = sheet1.createRow(6);
        cell = row.createCell(0);
        cell.setCellValue("충전기 ID");
        cell = row.createCell(1);
        cell.setCellValue("충전기 타입");
        cell = row.createCell(2);
        cell.setCellValue("충전기 상태");
        //충전기 정보
        for(int i=0;i<chargerlist.size();i++) {
        	row = sheet1.createRow(i+7);
            cell = row.createCell(0);
            cell.setCellValue(chargerlist.get(i).getCharger_id());
            cell = row.createCell(1);
            switch (chargerlist.get(i).getCharger_type()) {
				case "01":
					cell.setCellValue("DC차데모");
					break;
				case "02":
					cell.setCellValue("AC완속");
					break;
				case "03":
					cell.setCellValue("DC차데모/AC3상");
					break;
				case "04":
					cell.setCellValue("DC콤보");
					break;
				case "05":
					cell.setCellValue("DC차데모/DC콤보");
					break;
				case "06":
					cell.setCellValue("DC차데모/AC3상/DC콤보");
					break;
				case "07":
					cell.setCellValue("AC3상");
					break;
			}
            cell = row.createCell(2);
            switch (chargerlist.get(i).getStat()) {
			case "1":
				cell.setCellValue("통신이상");
				break;
			case "2":
				cell.setCellValue("충전대기");
				break;
			case "3":
				cell.setCellValue("충전중");
				break;
			case "4":
				cell.setCellValue("운영중지");
				break;
			case "5":
				cell.setCellValue("점검중");
				break;
			case "9":
				cell.setCellValue("상태미확인");
				break;
            } 
        }
       
        //sheet2
        row = sheet2.createRow(0);
        cell = row.createCell(0);
        cell.setCellValue(station.getStation_name());
        cell = row.createCell(2);
        cell.setCellValue("("+station.getStation_id()+")");
        cell = row.createCell(3);
        cell.setCellValue(LocalDate.now().getMonthValue()+"월 충전량");
        cell = row.createCell(4);
        cell.setCellValue("총 "+monthamount+"kWh");
        
        row = sheet2.createRow(2);
        cell = row.createCell(0);
        cell.setCellValue("번호");
        cell = row.createCell(1);
        cell.setCellValue("충전 날짜");
        cell = row.createCell(2);
        cell.setCellValue("충전 시작 일시");
        cell = row.createCell(3);
        cell.setCellValue("충전 종료 일시");
        cell = row.createCell(4);
        cell.setCellValue("충전량[kWh]");
        
        for(int i=0; i<chargelist.size();i++) {
        	  row = sheet2.createRow(i+3);
              cell = row.createCell(0);
              cell.setCellValue(i+1);
              cell = row.createCell(1);
              cell.setCellValue(chargelist.get(i).getCharging_date());
              cell = row.createCell(2);
              cell.setCellValue(chargelist.get(i).getStart_time());
              cell = row.createCell(3);
              cell.setCellValue(chargelist.get(i).getEnd_time());
              cell = row.createCell(4);
              cell.setCellValue(chargelist.get(i).getCharging_amount());
        }
      
        
        // excel 파일 저장
        String filename = station.getStation_id()+LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"))+".xlsx";
        try {
            File xlsxFile = new File(WebUtils.getRealPath(session.getServletContext(),
    				"/WEB-INF/exceldown/"+filename));
            FileOutputStream fileOut = new FileOutputStream(xlsxFile);
            xlsxWb.write(fileOut);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return filename;
	}
}
