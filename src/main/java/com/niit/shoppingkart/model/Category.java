package com.niit.shoppingkart.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
@Table
@Entity
public class Category {
	@Id
	@GeneratedValue
	private int cid;
	private String cname;
	private String cdescription;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCdescription() {
		return cdescription;
	}
	public void setCdescription(String cdescription) {
		this.cdescription = cdescription;
	}

}
