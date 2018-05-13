package com.hibernate;

import java.util.Set;

public class Employee {
	   private int id;
	   private String firstName; 
	   private String lastName;   
	   private int salary;  
	   private int version; 
	   private String notes;
	   private Set taskList;
	   private Set courses;

	   public Employee() {}
	   public Employee(String fname, String lname, int salary,String notes) {
	      this.firstName = fname;
	      this.lastName = lname;
	      this.salary = salary;
	      this.notes=notes;
	   }
	   
	   public int getId() {
	      return id;
	   }
	   
	   public void setId( int id ) {
	      this.id = id;
	   }
	   
	   public String getFirstName() {
	      return firstName;
	   }
	   
	   public void setFirstName( String first_name ) {
	      this.firstName = first_name;
	   }
	   
	   public String getLastName() {
	      return lastName;
	   }
	   
	   public void setLastName( String last_name ) {
	      this.lastName = last_name;
	   }
	   
	   public int getSalary() {
	      return salary;
	   }
	   
	   public void setSalary( int salary ) {
	      this.salary = salary;
	   }
	public int getVersion() {
		return version;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public void setVersion(int version) { 
		this.version = version;
	}
	public Set getTaskList() {
		return taskList;
	}
	public void setTaskList(Set taskList) {
		this.taskList = taskList;
	}
	public Set getCourses() {
		return courses;
	}
	public void setCourses(Set courses) {
		this.courses = courses;
	}
	}