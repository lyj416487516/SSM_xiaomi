package org.example.dao;

public class TestDaoImpl implements TestDao {

    private String bookName;
    private String author;

    @Override
    public void sayHello() {
        System.out.println("Hello Spring!");
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getBookName() {
        return bookName;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getAuthor() {
        return author;
    }

    public void printBookInfo() {
        System.out.println("Book Name：" + this.bookName + ",Author：" + this.author);
    }
}
