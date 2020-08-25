package com.oracle.vo;
import java.util.*;
public class DutyManagement {
	int	DUTYMANAGEMENT_ID;
	Date START;
	Date END;
	String MEMBERS;
	String LEAD;
	public int getDUTYMANAGEMENT_ID() {
		return DUTYMANAGEMENT_ID;
	}
	public void setDUTYMANAGEMENT_ID(int dUTYMANAGEMENT_ID) {
		DUTYMANAGEMENT_ID = dUTYMANAGEMENT_ID;
	}
	public Date getSTART() {
		return START;
	}
	public void setSTART(Date sTART) {
		START = sTART;
	}
	public Date getEND() {
		return END;
	}
	public void setEND(Date eND) {
		END = eND;
	}
	public String getMEMBERS() {
		return MEMBERS;
	}
	public void setMEMBERS(String mEMBERS) {
		MEMBERS = mEMBERS;
	}
	public String getLEAD() {
		return LEAD;
	}
	public void setLEAD(String lEAD) {
		LEAD = lEAD;
	}
	
	
}
