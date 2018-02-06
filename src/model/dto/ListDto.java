package model.dto;

import java.util.Date;

public class ListDto {
    String borrower;
    String name;
    String no;
    Date outDate;
    Date dueDate;
    Date returnDate;
    String returnType;

    public ListDto(String borrower, String name, String no) {
        this.borrower = borrower;
        this.name = name;
        this.no = no;
    }

    public ListDto(String borrower, String name, String no, Date outDate, Date dueDate, Date returnDate, String returnType) {
        this.borrower = borrower;
        this.name = name;
        this.no = no;
        this.outDate = outDate;
        this.dueDate = dueDate;
        this.returnDate = returnDate;
        this.returnType = returnType;
    }

    public String getBorrower() {
        return borrower;
    }

    public void setBorrower(String borrower) {
        this.borrower = borrower;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public Date getOutDate() {
        return outDate;
    }

    public void setOutDate(Date outDate) {
        this.outDate = outDate;
    }

    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    public Date getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(Date returnDate) {
        this.returnDate = returnDate;
    }

    public String getReturnType() {
        return returnType;
    }

    public void setReturnType(String returnType) {
        this.returnType = returnType;
    }

    @Override
    public String toString() {
        return "ListDto{" +
                "borrower='" + borrower + '\'' +
                ", name='" + name + '\'' +
                ", no='" + no + '\'' +
                ", outDate=" + outDate +
                ", dueDate=" + dueDate +
                ", returnDate=" + returnDate +
                ", returnType='" + returnType + '\'' +
                '}';
    }
}
