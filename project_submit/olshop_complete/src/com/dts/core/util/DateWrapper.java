/*
 * DateWrapper.java
 *
 * Created on December 8, 2007, 11:55 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.dts.core.util;

import java.util.Date;

/**
 *
 * @author drdtl007
 */
public class DateWrapper {
    
    static String month[]={"01","02","03","04","05","06","07","08","09","10","11","12"};
    /** Creates a new instance of DateWrapper */
    public DateWrapper() 
    {
        
    }
    public static String parseDate(Date date)
    {
    	@SuppressWarnings("deprecation")
		int monthid=date.getMonth();
        @SuppressWarnings("deprecation")
		String newdate=(date.getYear()+1900)+"-"+month[monthid]+"-"+date.getDate();
        System.out.println("new date=="+newdate);
        return newdate;
    }
    public static String parseDate(String date)
    {
    	int monthid=Integer.parseInt(date.substring(date.indexOf("-")+1,date.lastIndexOf("-")));
        String newdate=date.substring(0,date.indexOf("-"))+"-"+month[monthid-1]+"-"+(date.substring(date.lastIndexOf("-")+1,date.length()));
        return newdate;
    }     
    public static String parseDate(java.sql.Date date)
    {
    	String olddate=date.toString();
    	String newdate=olddate.substring(olddate.lastIndexOf("-")+1, olddate.length())+"-"+olddate.substring(olddate.indexOf("-")+1, olddate.lastIndexOf("-"))+"-"+olddate.substring(0,olddate.indexOf("-"));
		return newdate;
    	
    }
}
