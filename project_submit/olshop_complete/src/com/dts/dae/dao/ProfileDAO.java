/*
 * ProfileDAO.java
 *
 * 
 * 
 */

package com.dts.dae.dao;

import com.dts.dae.model.Profile;
import com.dts.core.dao.AbstractDataAccessObject; 
import com.dts.core.util.DateWrapper;
import com.dts.core.util.LoggerManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import javax.mail.Session;


/**
 *
 * @author 
 */
public class ProfileDAO extends AbstractDataAccessObject{
    
    public Connection con;

    private boolean flag;
    /** Creates a new instance of ProfileDAO */
    public ProfileDAO() 
    {
           //getting Database Connection
           
    }
    
       
    //User Registration
    public boolean registration(Profile regbean)
    {
    	System.out.println("reg vcvkjvcfs");
        String loginname=regbean.getLoginID();
        System.out.println("reg vcvkjvcfs");
        String password=regbean.getPassword();
        String firstname=regbean.getFirstName();
        String lastname=regbean.getLastName();
        String logintype=regbean.getLoginType();
        int status=regbean.getStatus();
        //String regdate=regbean.getRegDate();
        int secretquest=regbean.getSecretQuestionID();
        String ownsecretquest=regbean.getOwnSecretQuestion();
        String secretans=regbean.getSecretAnswer();
        int firstlogin=regbean.getFirstLogin();
        //String bdate=DateWrapper.parseDate(regbean.getBirthDate());
        String hno = regbean.getHno();
        String street = regbean.getStreet();
        String city=regbean.getCity();
        String state=regbean.getState();
        String country=regbean.getCountry();
        String pincode = regbean.getPincode();
        String phoneno = regbean.getPhoneNo();
        String email = regbean.getEmail();
        //String locale=regbean.getLocale();
        //String passmdate=regbean.getPasswordModifiedDate();
        //String profilemdate=regbean.getProfileModifiedDate();
        
        try 
        {
        	System.out.println("in try");
        	con=getConnection();
        	System.out.println(" pre con info"+con.getSchema());
           con.setAutoCommit(false);
           PreparedStatement pst=null;
           Statement st=con.createStatement();
           System.out.println("con info"+con.getSchema());
           int i=0;
           if(secretquest==0)
           {
        	    ResultSet rs = st.executeQuery("select questionid from questionbase where questiondetail='"+ownsecretquest+"'");
        	    if(!rs.next())
        	    {
        	    	rs=st.executeQuery("select (max(questionid))+1 from questionbase");
        	    	if(rs.next())
        	    		secretquest=rs.getInt(1);
        	    	pst = con.prepareStatement("INSERT INTO questionbase VALUES(?,?)");
        
        	    	pst.setInt(1,secretquest);
        	    	pst.setString(2,ownsecretquest);
        
        	    	pst.executeUpdate();
        	    }
        	    else
        	    	secretquest=rs.getInt(1);
           }
           String newdate=DateWrapper.parseDate(new Date());
            
           //st.executeUpdate("insert into logindetails values('"+loginname+"','"+password+"','"+firstname+"','"+lastname+"','"+logintype+"',"+status+",'"+newdate+"',"+secretquest+",'"+secretans+"',"+firstlogin+",'"+newdate+"')");
           //st.executeUpdate("insert into logindetails values()
           pst=con.prepareStatement("insert into logindetails values(?,?,?,?,?,?,?,?,?,?,?)");
                        
           pst.setString(1,loginname);
           pst.setString(2,password);
           pst.setString(3,firstname);
           pst.setString(4,lastname);
           pst.setString(5,logintype);
           pst.setInt(6,status);
           pst.setString(7,newdate);
           pst.setInt(8,secretquest);
           pst.setString(9,secretans);
           pst.setInt(10,firstlogin);
           pst.setString(11,newdate);
           i=pst.executeUpdate();
           
           if(i==1)
           {
        	   
                pst=con.prepareStatement("insert into loginprofile values(?,?,?,?,?,?,?,?,?,?)");
                pst.setString(1,loginname);
                //String bdate = null;
				//pst.setString(2,bdate);
                pst.setString(2, hno);
                pst.setString(3, street);
                pst.setString(4,city);
                pst.setString(5,state);
                pst.setString(6,country);
                pst.setString(7, pincode);
                pst.setString(8, phoneno);
                pst.setString(9, email);                
               // String locale = null;
				//pst.setString(11,locale);
                pst.setString(10,newdate);
                i=pst.executeUpdate();
            }
            if(i==1)
            {
                flag=true;
                con.commit();
            }
            else
            {
                flag=false;
                con.rollback();
            } 
            con.close();
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
            flag=false;
            try 
            {
                con.rollback();
            } 
            catch (SQLException sex) 
            {
                sex.printStackTrace();
            }
        }
        catch (Exception e) 
        {
            e.printStackTrace();
            flag=false;
            try 
            {
                con.rollback();
            } 
            catch (SQLException se) 
            {
                se.printStackTrace();
            }
        }
        return flag;
    }
    
    //Getting profile
    public Profile getProfile(String loginname)
    {
        Profile rb=null;
        try
        {
        	con=getConnection();
           Statement st = con.createStatement();
           ResultSet rs = st.executeQuery("select ld.firstname,ld.lastname,lp.birthdate,lp.city,lp.state,lp.country from logindetails ld,loginprofile lp where ld.loginname=lp.loginid and ld.loginname='"+loginname+"'");
           if(rs.next())
           {
        	   rb=new Profile();
        	   rb.setLoginID(loginname);
        	   rb.setFirstName(rs.getString(1));
        	   rb.setLastName(rs.getString(2));
        	   rb.setBirthDate1(rs.getDate(3));
        	   rb.setCity(rs.getString(4));
        	   rb.setState(rs.getString(5));
        	   rb.setCountry(rs.getString(6));
           }
           con.close();
        }
        catch(Exception e)
        {
        	LoggerManager.writeLogSevere(e);
        }
        return rb;
    } 
    
    // Modify Profile
    public boolean modifyProfile(Profile regbean)
    {
        String loginid=regbean.getLoginID();
        String hno = regbean.getHno();
        String street = regbean.getStreet();
        String bdate=DateWrapper.parseDate(regbean.getBirthDate());
        String city=regbean.getCity();
        String state=regbean.getState();
        String country=regbean.getCountry();
        String pincode = regbean.getPincode();
        String contactno = regbean.getPhoneNo();
        String email = regbean.getEmail();
        
        String firstname=regbean.getFirstName();
        String lastname=regbean.getLastName();
        
        
        try 
        {
        	con=getConnection();
            con.setAutoCommit(false);
            PreparedStatement pst=con.prepareStatement("UPDATE loginprofile SET birthdate=?,hno=?,street=?,city=?,state=?,country=?,pincode=?,contactno=?,email=?,profilemodifieddate=? WHERE loginid=?");
            PreparedStatement pst1=con.prepareStatement("UPDATE logindetails SET firstname=?,lastname=? WHERE loginname=?");
            
            pst.setString(1,bdate);
            pst.setString(2, hno);
            pst.setString(3, street);
            pst.setString(4,city);
            pst.setString(5,state);
            pst.setString(6,country);
            pst.setString(7, pincode);
            pst.setString(8, contactno);
            pst.setString(9, email);
            pst.setString(10, DateWrapper.parseDate(new Date()));
            pst.setString(11,loginid);
           
            pst1.setString(1, firstname);
            pst1.setString(2, lastname);
            pst1.setString(3,loginid);
            
            int i=pst.executeUpdate();
            
            if(i!=0)
            {
            	i=pst1.executeUpdate();
            	if(i!=0)
            	{
                flag=true;
                con.commit();
            	}
            	else
            	{
            		flag=false;
            		con.rollback();
            	}
            }
            else
            {
                flag=false;
                con.rollback();
            }
            con.close();
        } 
        catch (SQLException ex) 
        {
        	ex.printStackTrace();
            LoggerManager.writeLogSevere(ex);
            flag=false;
            try 
            {
                con.rollback();
            } 
            catch (SQLException se) 
            {
                LoggerManager.writeLogSevere(se);
            }
        }
        catch (Exception e) 
        {
        	LoggerManager.writeLogSevere(e);
            flag=false;
            try 
            {
                con.rollback();
            } 
            catch (SQLException se) 
            {
            	LoggerManager.writeLogSevere(se);
            }
        }
        return flag;
    }
    
    public boolean changeAccountStatus(String loginid,int status)
    {
        try 
        {
        	con=getConnection();
            con.setAutoCommit(false);
            if(status == 0)
            	status = 1;
            else
            	status = 0;
            PreparedStatement pst=con.prepareStatement("UPDATE logindetails SET loginstatus=? WHERE loginname=?");
            
            pst.setInt(1,status);
            pst.setString(2,loginid);
            int i=pst.executeUpdate();

            if(i==1)
            {
                flag=true;
                con.commit();
            }
            else
            {
                flag=false;
                con.rollback();
            }
            con.close();
        } 
        catch (SQLException ex) 
        {
        	LoggerManager.writeLogSevere(ex);
            flag=false;
            try 
            {
                con.rollback();
            } 
            catch (SQLException se) 
            {
            	LoggerManager.writeLogSevere(se);
            }
        }
        catch (Exception e) 
        {
        	LoggerManager.writeLogSevere(e);
            flag=false;
            try 
            {
                con.rollback();
            } 
            catch (SQLException se) 
            {
            	LoggerManager.writeLogSevere(se);
            }
        }
        return flag;
    }
}
