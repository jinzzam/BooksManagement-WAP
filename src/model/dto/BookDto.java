package model.dto;

import java.sql.Date;

public class BookDto {
    String bigField;
    String no;
    String smField;
    String name;
    String author;
    String translator;
    String publisher;
    Date checkOutDate;
    String available;

    public BookDto(String bigField, String no, String smField, String name, String author, String translator, String publisher) {
        this.bigField = bigField;
        this.no = no;
        this.smField = smField;
        this.name = name;
        this.author = author;
        this.translator = translator;
        this.publisher = publisher;
    }

    public BookDto(String bigField, String no, String smField, String name, String author, String translator, String publisher, Date checkOutDate, String available) {
        this.bigField = bigField;
        this.no = no;
        this.smField = smField;
        this.name = name;
        this.author = author;
        this.translator = translator;
        this.publisher = publisher;
        this.checkOutDate = checkOutDate;
        this.available = available;
    }

    public String getBigField() {
        return bigField;
    }

    public void setBigField(String bigField) {
        this.bigField = bigField;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getSmField() {
        return smField;
    }

    public void setSmField(String smField) {
        this.smField = smField;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getTranslator() {
        return translator;
    }

    public void setTranslator(String translator) {
        this.translator = translator;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public Date getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(Date checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    public String getAvailable() {
        return available;
    }

    public void setAvailable(String available) {
        this.available = available;
    }

    @Override
    public String toString() {
        return "BookDto{" +
                "bigField='" + bigField + '\'' +
                ", no='" + no + '\'' +
                ", smField='" + smField + '\'' +
                ", name='" + name + '\'' +
                ", author='" + author + '\'' +
                ", translator='" + translator + '\'' +
                ", publisher='" + publisher + '\'' +
                ", checkOutDate=" + checkOutDate +
                ", available='" + available + '\'' +
                '}';
    }
}
