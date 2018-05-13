package com.hibernate;

public class Task {
	  private int id;
	  private int version; 
	 private  Employee employee;
	 private String notes;
	 private String taskName;
	  public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	
	  public Task() {
		  
	  }
	  
	public Task(String taskName,String notes) {
		
		
		this.taskName = taskName;
		this.notes = notes;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
}
