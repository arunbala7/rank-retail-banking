package com.rank.util;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
 
public class DateTime {
    public static LocalDate returnDate(String date) throws ParseException {
    	 DateFormat formatter = null;
         Date convertedDate = null;      
         formatter =new SimpleDateFormat("yyyy-MM-dd");
         convertedDate =(Date) formatter.parse(date);      
     		
     	//Getting the default zone id
     	ZoneId defaultZoneId = ZoneId.systemDefault();
     		
     	//Converting the date to Instant
     	Instant instant =convertedDate.toInstant();
     		
     	//Converting the Date to LocalDate
     	LocalDate localDate = instant.atZone(defaultZoneId).toLocalDate();
		return localDate;
    }
}