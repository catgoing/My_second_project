package com.bookstore.model.vo;

public class Employee {
	private String COMMISSION_PCT;
	private String DEPARTMENT_ID;
	private String EMAIL;
	private String EMPLOYEE_ID;
	private String FIRST_NAME;
	private String HIRE_DATE;
	private String JOB_ID;
	private String LAST_NAME;
	private String MANAGER_ID;
	private String PHONE_NUMBER;
	private String SALARY;

	public Employee() {
	}
	

	public Employee(String cOMMISSION_PCT, String dEPARTMENT_ID, String eMAIL, String eMPLOYEE_ID, String fIRST_NAME,
			String hIRE_DATE, String jOB_ID, String lAST_NAME, String mANAGER_ID, String pHONE_NUMBER, String sALARY) {
		super();
		COMMISSION_PCT = cOMMISSION_PCT;
		DEPARTMENT_ID = dEPARTMENT_ID;
		EMAIL = eMAIL;
		EMPLOYEE_ID = eMPLOYEE_ID;
		FIRST_NAME = fIRST_NAME;
		HIRE_DATE = hIRE_DATE;
		JOB_ID = jOB_ID;
		LAST_NAME = lAST_NAME;
		MANAGER_ID = mANAGER_ID;
		PHONE_NUMBER = pHONE_NUMBER;
		SALARY = sALARY;
	}


	@Override
	public String toString() {
		return "Employee [COMMISSION_PCT=" + COMMISSION_PCT + ", DEPARTMENT_ID=" + DEPARTMENT_ID + ", EMAIL=" + EMAIL
				+ ", EMPLOYEE_ID=" + EMPLOYEE_ID + ", FIRST_NAME=" + FIRST_NAME + ", HIRE_DATE=" + HIRE_DATE
				+ ", JOB_ID=" + JOB_ID + ", LAST_NAME=" + LAST_NAME + ", MANAGER_ID=" + MANAGER_ID + ", PHONE_NUMBER="
				+ PHONE_NUMBER + ", SALARY=" + SALARY + "]";
	}

	public String getCOMMISSION_PCT() {
		return COMMISSION_PCT;
	}

	public void setCOMMISSION_PCT(String cOMMISSION_PCT) {
		COMMISSION_PCT = cOMMISSION_PCT;
	}

	public String getDEPARTMENT_ID() {
		return DEPARTMENT_ID;
	}

	public void setDEPARTMENT_ID(String dEPARTMENT_ID) {
		DEPARTMENT_ID = dEPARTMENT_ID;
	}

	public String getEMAIL() {
		return EMAIL;
	}

	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}

	public String getEMPLOYEE_ID() {
		return EMPLOYEE_ID;
	}

	public void setEMPLOYEE_ID(String eMPLOYEE_ID) {
		EMPLOYEE_ID = eMPLOYEE_ID;
	}

	public String getFIRST_NAME() {
		return FIRST_NAME;
	}

	public void setFIRST_NAME(String fIRST_NAME) {
		FIRST_NAME = fIRST_NAME;
	}

	public String getHIRE_DATE() {
		return HIRE_DATE;
	}

	public void setHIRE_DATE(String hIRE_DATE) {
		HIRE_DATE = hIRE_DATE;
	}

	public String getJOB_ID() {
		return JOB_ID;
	}

	public void setJOB_ID(String jOB_ID) {
		JOB_ID = jOB_ID;
	}

	public String getLAST_NAME() {
		return LAST_NAME;
	}

	public void setLAST_NAME(String lAST_NAME) {
		LAST_NAME = lAST_NAME;
	}

	public String getMANAGER_ID() {
		return MANAGER_ID;
	}

	public void setMANAGER_ID(String mANAGER_ID) {
		MANAGER_ID = mANAGER_ID;
	}

	public String getPHONE_NUMBER() {
		return PHONE_NUMBER;
	}

	public void setPHONE_NUMBER(String pHONE_NUMBER) {
		PHONE_NUMBER = pHONE_NUMBER;
	}

	public String getSALARY() {
		return SALARY;
	}

	public void setSALARY(String sALARY) {
		SALARY = sALARY;
	}
}
