import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Random;


public class RandomData1 {
	public static int custId()
	{
		int start = 10;
		int end = 1000;
		Random randomGenerator = new Random();
		return(randomGenerator.nextInt(end-start+1)+start);
	}
	public static int sqId()
	{
		int start = 1;
		int end =6;
		Random randomGenerator = new Random();
		return(randomGenerator.nextInt(end-start+1)+start);
	}
	public static int proId()
	{
		int start = 20;
		int end = 90;
		Random randomGenerator = new Random();
		return(randomGenerator.nextInt(end-start+1)+start);
	}
	public static int brandId()
	{
		int start = 1;
		int end = 17;
		Random randomGenerator = new Random();
		return(randomGenerator.nextInt(end-start+1)+start);
	}
	public static int catId(int brandid)
	{
		//int start = 1;
		//int end = 17;
		
		Random randomGenerator = new Random(); 
		
		if(brandid==1)
		{
			int[] a1={1,2};
			int i1 = randomGenerator.nextInt(a1.length);
			return i1;
		}
		else if(brandid==2)
		{
			int[] a1={1,2,6,7,8,9};
			int i1 = randomGenerator.nextInt(a1.length);
			return i1;
		}
		else if(brandid==3)
		{
			int[] a1={1,8};
			int i1 = randomGenerator.nextInt(a1.length);
			return i1;
		}
		else if(brandid==4)
		{
			int[] a1={1,5,6,7,8};
			int i1 = randomGenerator.nextInt(a1.length);
			return i1;
		}
		else if(brandid==5)
		{
			int[] a1={1,5,6,7,8,9};
			int i1 = randomGenerator.nextInt(a1.length);
			return i1;
		}
		else if(brandid==6)
		{
			int[] a1={1,8,9,10};
			int i1 = randomGenerator.nextInt(a1.length);
			return i1;
		}
		else if(brandid==7)
		{
			int[] a1={6,7,8};
			int i1 = randomGenerator.nextInt(a1.length);
			return i1;
		}
		else if(brandid==8)
		{
			int[] a1={1,3,8,9};
			int i1 = randomGenerator.nextInt(a1.length);
			return i1;
		}
		else if(brandid==9)
		{
			int[] a1={8};
			int i1 = randomGenerator.nextInt(a1.length);
			return i1;
		}
		else if(brandid==10)
		{
			int[] a1={10};
			int i1 = randomGenerator.nextInt(a1.length);
			return i1;
		}
		else if(brandid==11)
		{
			int[] a1={1,3,8,9};
			int i1 = randomGenerator.nextInt(a1.length);
			return i1;
		}
		if(brandid==12)
		{
			int[] a1={2,8};
			int i1 = randomGenerator.nextInt(a1.length);
			return i1;
		}
		else if(brandid==13)
		{
			int[] a1={6,7,9};
			int i1 = randomGenerator.nextInt(a1.length);
			return i1;
		}
		else if(brandid==14)
		{
			int[] a1={4};
			int i1 = randomGenerator.nextInt(a1.length);
			return i1;
		}
		else if(brandid==15)
		{
			int[] a1={4};
			int i1 = randomGenerator.nextInt(a1.length);
			return i1;
		}
		else if(brandid==16)
		{
			int[] a1={3,9};
			int i1 = randomGenerator.nextInt(a1.length);
			return i1;
		}
		else if(brandid==17)
		{
			int[] a1={2,9};
			int i1 = randomGenerator.nextInt(a1.length);
			return i1;
		}
		return 4;
	}
	
	public static int itemId(int catid)
	{
		//int start = 1;
		//int end = 4;
		Random randomGenerator = new Random();
		
		if(catid==1)
		{
			int[] a1={1};
			int i1 = randomGenerator.nextInt(a1.length);
			return i1;
		}
		else if(catid==2)
		{
			int[] a1={1};
			int i1 = randomGenerator.nextInt(a1.length);
			return i1;
		}
		else if(catid==3)
		{
			int[] a1={1};
			int i1 = randomGenerator.nextInt(a1.length);
			return i1;
		}
		else if(catid==4)
		{
			int[] a1={1};
			int i1 = randomGenerator.nextInt(a1.length);
			return i1;
		}
		else if(catid==5)
		{
			int[] a1={1};
			int i1 = randomGenerator.nextInt(a1.length);
			return i1;
		}
		else if(catid==6)
		{
			int[] a1={1};
			int i1 = randomGenerator.nextInt(a1.length);
			return i1;
		}
		else if(catid==7)
		{
			int[] a1={1};
			int i1 = randomGenerator.nextInt(a1.length);
			return i1;
		}
		else if(catid==8)
		{
			int[] a1={1};
			int i1 = randomGenerator.nextInt(a1.length);
			return i1;
		}
		else if(catid==9)
		{
			int[] a1={1};
			int i1 = randomGenerator.nextInt(a1.length);
			return i1;
		}
		else if(catid==10)
		{
			int[] a1={1};
			int i1 = randomGenerator.nextInt(a1.length);
			return i1;
		}
		return 7;
	}
	public static int discount()
	{
		int start = 1;
		int end = 4;
		Random randomGenerator = new Random();
		int randomInt = randomGenerator.nextInt(end-start+1)+start;
		if(randomInt==1)
		return 5;
		else if(randomInt==2)
			return 10;
			else if (randomInt==3)
				return 15;
			else if (randomInt==4)
				return 20;
		return 0;
				
	}
	
	public static String sanswer()
	{
		int start = 1;
		int end = 21;
		Random randomGenerator = new Random();
		int randomInt = randomGenerator.nextInt(end-start+1)+start;
		if(randomInt==1)
		return "olshop";
		else if(randomInt==2)
			return "memphis";
			else if (randomInt==3)
				return "usa";
			else if(randomInt==4)
				return "roller";
			else if(randomInt==5)
				return "chocolate";
			else if(randomInt==6)
				return "pitbull";
			else if(randomInt==7)
				return "father";
			else if(randomInt==8)
				return "puppy";
			else if(randomInt==9)
				return "jealous";
			else if(randomInt==10)
				return "honest";
			else if(randomInt==11)
				return "dell";
			else if(randomInt==12)
				return "china";
				else if (randomInt==13)
					return "japan";
				else if(randomInt==14)
					return "coaster";
				else if(randomInt==15)
					return "apkebarmodisarkar";
				else if(randomInt==16)
					return "beiber";
				else if(randomInt==17)
					return "sanskrit";
				else if(randomInt==18)
					return "gulte";
				else if(randomInt==19)
					return "telugu";
				else if(randomInt==20)
					return "english";
				else if(randomInt==21)
					return "engineer";
		return null;
				
	}
	public static String street()
	{
		int start = 1;
		int end = 21;
		Random randomGenerator = new Random();
		int randomInt = randomGenerator.nextInt(end-start+1)+start;
		if(randomInt==1)
		return "patterson";
		else if(randomInt==2)
			return "southern";
			else if (randomInt==3)
				return "texas";
			else if(randomInt==4)
				return "roller";
			else if(randomInt==5)
				return "chocolate";
			else if(randomInt==6)
				return "pitbull";
			else if(randomInt==7)
				return "spotswood";
			else if(randomInt==8)
				return "university";
			else if(randomInt==9)
				return "drive";
			else if(randomInt==10)
				return "park";
			else if(randomInt==11)
				return "dell";
			else if(randomInt==12)
				return "china";
				else if (randomInt==13)
					return "japan";
				else if(randomInt==14)
					return "coaster";
				else if(randomInt==15)
					return "norris wood";
				else if(randomInt==16)
					return "beiber";
				else if(randomInt==17)
					return "sanskrit";
				else if(randomInt==18)
					return "gulte";
				else if(randomInt==19)
					return "telugu";
				else if(randomInt==20)
					return "english";
				else if(randomInt==21)
					return "mexico";
		return null;
				
	}
	public static String desc()
	{
		int start = 1;
		int end = 12;
		Random randomGenerator = new Random();
		int randomInt = randomGenerator.nextInt(end-start+1)+start;
		if(randomInt==1)
		return "Microst mouse and keyboard";
		else if(randomInt==2)
			return "iPhone 5s";
			else if (randomInt==3)
				return "GalaXy S 5";
			else if(randomInt==4)
				return "Dell XPS";
			else if(randomInt==5)
				return "14 inch tablets";
			else if(randomInt==6)
				return "iPad Air";
			else if(randomInt==7)
				return "Mice";
			else if(randomInt==8)
				return "Update Invetory for Speakers";
			else if(randomInt==9)
				return "Hard Drive- Seagate";
			else if(randomInt==10)
				return "Music Player";
			else if(randomInt==11)
				return "iMac";
			else if(randomInt==12)
				return "iPhone Charger";
				
		return null;
				
	}
	public static String city()
	{
		int start = 1;
		int end = 5;
		Random randomGenerator = new Random();
		int randomInt = randomGenerator.nextInt(end-start+1)+start;
		if(randomInt==1)
		return "Memphis";
		else if(randomInt==2)
			return "Nashville";
			else if (randomInt==3)
				return "Chattenooga";
			else if(randomInt==4)
				return "Cordova";
			else if(randomInt==5)
				return "Coellierville";
			
		return null;
				
	}
	public static String status()
	{
		int start = 1;
		int end = 3;
		Random randomGenerator = new Random();
		int randomInt = randomGenerator.nextInt(end-start+1)+start;
		if(randomInt==1)
		return "Rejected";
		else if(randomInt==2)
			return "Accepted";
		else if(randomInt==3)
			return "Pending";
			
			
		return null;
				
	}
	public static String status1()
	{
		int start = 1;
		int end = 2;
		Random randomGenerator = new Random();
		int randomInt = randomGenerator.nextInt(end-start+1)+start;
		if(randomInt==1)
		return "Process";
		else if(randomInt==2)
			return "Solved";
			
			
		return null;
				
	}
	public static String year()
	{
		int start = 2015;
		int end = 2015;
		Random randomGenerator = new Random();
		int randomInt = randomGenerator.nextInt(end-start+1)+start;
		return Integer.toString(randomInt);
	}
	public static String month()
	{
		int start = 1;
		int end = 12;
		Random randomGenerator = new Random();
		int randomInt = randomGenerator.nextInt(end-start+1)+start;
		return Integer.toString(randomInt);
	}
	
	public static String day()
	{
		int start = 1;
		int end = 28;
		Random randomGenerator = new Random();
		int randomInt = randomGenerator.nextInt(end-start+1)+start;
		return Integer.toString(randomInt);	
	}
	
	public static String email()
	{
		int start = 1;
		int end = 3;
		Random randomGenerator = new Random();
		int randomInt = randomGenerator.nextInt(end-start+1)+start;
		if(randomInt==1)
		return "@gmail.com";
		else if(randomInt==2)
			return "@yahoo.com";
			else if (randomInt==3)
				return "@memphis.edu";
			else if (randomInt==4)
				return "@olshop.com";
		return null;
				
	}
public static void main(String args[])
{
	int orderId=4636;
	int confId=5634;
	int custId=0;
	int productId=0;
	int discount=0;
	String billMode = "";
	String fn="Customer";
	String ln = "LastName";
	String un = "";
	String pass ="olshop123";
	String email ="";
	File f = new File("itemorder.txt");
	File f1 = new File("loginprofile.txt");
	File f2 = new File("query.txt");
	File f3 = new File("solution.txt");
	File f4 = new File("totalorders.txt");
	File f5 = new File("logindetails.txt");
	PrintWriter writer = null;
	
	try {
		writer = new PrintWriter(f, "UTF-8");
	} catch (FileNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (UnsupportedEncodingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	PrintWriter writer1 = null;
	try {
		writer1 = new PrintWriter(f1, "UTF-8");
	} catch (FileNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (UnsupportedEncodingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	PrintWriter writer2 = null;
	try {
		writer2 = new PrintWriter(f2, "UTF-8");
	} catch (FileNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (UnsupportedEncodingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	PrintWriter writer3 = null;
	try {
		writer3 = new PrintWriter(f3, "UTF-8");
	} catch (FileNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (UnsupportedEncodingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	PrintWriter writer4 = null;
	try {
		writer4 = new PrintWriter(f4, "UTF-8");
	} catch (FileNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (UnsupportedEncodingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	PrintWriter writer5 = null;
	try {
		writer5 = new PrintWriter(f5, "UTF-8");
	} catch (FileNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (UnsupportedEncodingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	//writer.println("The first line");
	//writer.println("The second line");
	//writer.close();
for(int i=1;i<1000;i++)
{
	String dob=new String();
    String year= year();
	String month=month();
	String day=day();
	dob=year+"-";
	dob+=month;
	dob+="-";
	dob+=day;
	++orderId;
	++confId;
	
	++custId;
	//custId= custId();
	productId=proId();
	discount=discount();
	//billMode=mode();
	String loginname="user";
	//String fn = null;
	int sq=sqId();
	String sans=sanswer();
	loginname=loginname+Integer.toString(custId);
	un=fn+ln;
	un+=Integer.toString(custId);
	fn = fn+Integer.toString(custId);
	ln=ln+Integer.toString(custId);
	email=fn+email();
	String logintype="customer";
	int loginstatus=1;
	String modidate="2015-04-01";
	int hno=custId();
	int qid=custId();
	//String street=street+Integer.toString(custId);
	String street=street();
	String city=city();
	String desc="Request for "+desc();
	String status=status();
	String sol="Your Request is being processed";
	String quedate="2015-03-"+day();
	String soldate="2015-04-"+day();
	String orddate="2015-01-"+day();
	String status1=status1();
	int amount=100+custId();
	int brandid=brandId();
	int catid=catId(brandid);
	int itemid=itemId(catid);
	System.out.println("------------------");
	System.out.println(brandid);
	System.out.println("------------------");
	System.out.println(catid);
	System.out.println("------------------");
	System.out.println(itemid);
	System.out.println("------------------");
	writer.println(qid);
	writer5.println(loginname+"\t"+pass+"\t"+fn+"\t"+ln+"\t"+logintype+"\t"+loginstatus+"\t"+dob+"\t"+sq+"\t"+sans+"\t"+"0"+"\t"+modidate);
	writer1.println(loginname+"\t"+hno+"\t"+street+" Street"+"\t"+city+"\t"+"Tennessee"+"\t"+"United States"+"\t"+"38152"+"\t"+"9011234567"+"\t"+email+"\t"+modidate);
	writer2.println(qid+"\t"+loginname+"\t"+quedate+"\t"+desc+"\t"+status1);
	writer3.println(qid+"\t"+soldate+"\t"+sol);
	writer4.println(qid+"\t"+loginname+"\t"+orddate+"\t"+amount+"\t"+status);
	
	fn="Customer";
	ln="Lname";
	un="";
	email="";

}
}
}
