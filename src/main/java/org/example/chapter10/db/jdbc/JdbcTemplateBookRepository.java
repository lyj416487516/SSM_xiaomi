package org.example.chapter10.db.jdbc;

import org.example.chapter10.db.BookRepository;
import org.example.chapter10.domain.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

@Repository//该类添加了@Repository注解，以便Spring能够扫描到将其注册为bean
public class JdbcTemplateBookRepository implements BookRepository {
    private static final String SQL_INSERT_BOOK =
            "INSERT INTO book(book_name, author, create_by, create_time, modify_by, modify_time) VALUES (?,?,?,?,?,?);";

    @Autowired
    private JdbcOperations jdbcOperations;
    @Autowired
    private BookRepository bookRepository;

    @Override
    public void addBook(Book book) {
        jdbcOperations.update(SQL_INSERT_BOOK, book.getBookName(),
                book.getAuthor(),
                book.getCreateBy(),
                new Date(System.currentTimeMillis()),
                book.getModifyBy(),
                new Date(System.currentTimeMillis()));
    }
    private static final String SQL_UPDATE_BOOK =
            "UPDATE Book SET book_name = ?,author = ?,modify_by = ?,modify_time=? WHERE book_id = ?;";

    @Override
    public void updateBook(Book book) {
        jdbcOperations.update(SQL_UPDATE_BOOK, book.getBookName(),
                book.getAuthor(),
                book.getModifyBy(),
                new Timestamp(System.currentTimeMillis()),
                book.getBookId());
    }
    private static final String SQL_SELECT_BOOK =
            "SELECT book_id,book_name,author,create_by,create_time,modify_by,modify_time FROM book WHERE book_id = ?;";

    @Override
    public Book findBook(long bookId) {
        return jdbcOperations.queryForObject(SQL_SELECT_BOOK, new BookRowMapper(), bookId);
    }

    private static final class BookRowMapper implements RowMapper<Book> {

        @Override
        public Book mapRow(ResultSet resultSet, int i) throws SQLException {
            Book book = new Book();
            book.setBookId(resultSet.getLong("book_id"));
            book.setBookName(resultSet.getString("book_name"));
            book.setAuthor(resultSet.getString("author"));
            book.setCreateBy(resultSet.getString("create_by"));
            book.setCreateTime(resultSet.getTimestamp("create_time"));
            book.setModifyBy(resultSet.getString("modify_by"));
            book.setModifyTime(resultSet.getTimestamp("modify_time"));


            return book;
        }
    }
}