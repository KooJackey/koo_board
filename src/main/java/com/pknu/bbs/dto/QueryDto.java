package com.pknu.bbs.dto;

public class QueryDto {
	private String table;
	private int startRow;
	private int endRow;
	private Object table2;
	
	public Object getTable2() {
		return table2;
	}
	public void setTable2(Object table2) {
		this.table2 = table2;
	}
	public String getTable() {
		return table;
	}
	public void setTable(String table) {
		this.table = table;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	@Override
	public String toString() {
		return "QueryDto [table=" + table + ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}
	
	
}
