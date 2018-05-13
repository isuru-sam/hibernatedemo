package com.hibernate;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.annotations.CascadeType;
import org.hibernate.cfg.Configuration;

public class ManageEmployee {
/**
 * create table EMPLOYEE (
   id  serial,
   first_name VARCHAR(20) default NULL,
   last_name  VARCHAR(20) default NULL,
   salary     INT  default NULL,
   PRIMARY KEY (id)
);
 * @param args
 * 
 * https://stackoverflow.com/questions/16641758/convert-string-to-clob-and-vice-versa-in-hibernate
 */
	
	private static SessionFactory factory; 
	public static void main(String[] args) {
		 try {
	         factory = new Configuration().configure().buildSessionFactory();
	      } catch (Throwable ex) { 
	         System.err.println("Failed to create sessionFactory object." + ex);
	         throw new ExceptionInInitializerError(ex); 
	      }
	      
	      ManageEmployee ME = new ManageEmployee();

	      /* Add few employee records in database */
	   Integer empID1 = ME.addEmployee("Zara", "Ali", 1000, "note");
	     // Integer empID2 = ME.addEmployee("Daisy", "Das", 5000,"notes2");
	     // Integer empID3 = ME.addEmployee("John", "Paul", 10000,"notes3");

	      /* List down all the employees */
	   //   ME.listEmployees();
	      
	/* Employee e =    ME.findEmployee(146);
	 
	 System.out.println("Received");
	Iterator it = e.getTaskList().iterator(); 
	 while(it.hasNext())
	 {
		 System.out.println(((Task)it.next()).getNotes().length());
	 }
	 Iterator it1 = e.getCourses().iterator(); 
	 while(it.hasNext())
	 {
		 System.out.println(((Course)it.next()).getCourseName());
	 }*/
	 
//	 System.out.println(e.getTaskList().remove(o));
//ME.updateEmployee(e.getId(), 136000);
	  
	  
	      /* Update employee's records */
	    //  ME.updateEmployee(empID1, 5000);

	      /* Delete an employee from the database */
	   //   ME.deleteEmployee(empID2);

	      /* List down new list of the employees */
	    //  ME.listEmployees();
	      
	    /* Employee e =new Employee();
	      e.setFirstName("Isuru");
e.setLastName("Nishan");
	e.setId(165);
	//e.setVersion(2);
	
	ME.saveOrUpdate(e);*/
	}

	private static String getNote1() {
		//CascadeType.
		StringBuilder b = new StringBuilder();
		for(int i=0;i<10000000;i++) {
			b.append("Hello");
		}
		
		System.out.println("Sent"+b.toString().length());
		
		return b.toString();
	}
	
	public void saveOrUpdate(Employee e) {
		
		 Session session = factory.openSession();
	      Transaction tx = null;
	      
	      try {
	         tx = session.beginTransaction();
	         session.saveOrUpdate(e);
	        
	         
	         tx.commit();
	      } catch (HibernateException ee) {
	         if (tx!=null) tx.rollback();
	         ee.printStackTrace(); 
	      } finally {
	         session.close(); 
	      }
	      
	     
		
	}
	
	
	/* Method to CREATE an employee in the database */
	   public Integer addEmployee(String fname, String lname, int salary, String notes){
	      Session session = factory.openSession();
	      Transaction tx = null;
	      Integer employeeID = null;
	      
	      try {
	         tx = session.beginTransaction();
	         Employee employee = new Employee(fname, lname, salary,notes);
	         Set t = new HashSet();
	         String note = "note";
	         Task t1 = new Task("t1",note);
	         Task t2 = new Task("t2",note);
	         
	         Set c= new HashSet();
	         Course c1 = new Course("c1","desc");
	         Course c2 = new Course("c2","desc");
	         c.add(c1);
	         c.add(c2);
	         employee.setCourses(c);
	      //   t1.setEmployee(employee);
	      //   t2.setEmployee(employee);
	         t.add(t1);
	         t.add(t2);
	         employee.setTaskList(t);
	         employeeID = (Integer) session.save(employee); 
	         tx.commit();
	      } catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      } finally {
	         session.close(); 
	      }
	      return employeeID;
	   }
	   
	   
	   
	   public Employee findEmployee(Integer id) {
		   Session session = factory.openSession();
		      Transaction tx = null;
		      Employee e = null;
		      try {
		         tx = session.beginTransaction();
		        e =   session.find(Employee.class,id);
		        
		         
		         tx.commit();
		      } catch (HibernateException ee) {
		         if (tx!=null) tx.rollback();
		         ee.printStackTrace(); 
		      } finally {
		         session.close(); 
		      }
		      
		      return e;
	   }
	   
	   /* Method to  READ all the employees */
	   public void listEmployees( ){
	      Session session = factory.openSession();
	      Transaction tx = null;
	      
	      try {
	         tx = session.beginTransaction();
	         List employees = session.createQuery("FROM Employee").list(); 
	         for (Iterator iterator = employees.iterator(); iterator.hasNext();){
	            Employee employee = (Employee) iterator.next(); 
	            System.out.print("First Name: " + employee.getFirstName()); 
	            System.out.print("  Last Name: " + employee.getLastName()); 
	            System.out.println("  Salary: " + employee.getSalary()); 
	         }
	         tx.commit();
	      } catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      } finally {
	         session.close(); 
	      }
	   }
	   
	   /* Method to UPDATE salary for an employee */
	   public void updateEmployee(Integer EmployeeID, int salary ){
	      Session session = factory.openSession();
	      Transaction tx = null;
	      
	      try {
	         tx = session.beginTransaction();
	         Employee employee = (Employee)session.get(Employee.class, EmployeeID); 
	         employee.setSalary( salary );
			 session.update(employee); 
	         tx.commit();
	      } catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      } finally {
	         session.close(); 
	      }
	   }
	   
	   /* Method to DELETE an employee from the records */
	   public void deleteEmployee(Integer EmployeeID){
	      Session session = factory.openSession();
	      Transaction tx = null;
	      
	      try {
	         tx = session.beginTransaction();
	         Employee employee = (Employee)session.get(Employee.class, EmployeeID); 
	         session.delete(employee); 
	         tx.commit();
	      } catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      } finally {
	         session.close(); 
	      }
	   }
	}

