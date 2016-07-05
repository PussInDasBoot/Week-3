-- SELECT editions.isbn FROM publishers, editions WHERE publishers.id = editions.publisher_id AND publishers.name = 'Random House';

-- SELECT isbn, title FROM
-- (publishers JOIN editions ON (publishers.id = editions.publisher_id) join
-- books ON (books.id = editions.book_id)) WHERE publishers.name = 'Random House';

-- SELECT stock.isbn, title, stock, retail FROM
-- (publishers JOIN editions ON (publishers.id = editions.publisher_id) join
-- books ON (books.id = editions.book_id) join stock 
-- ON (stock.isbn = editions.isbn))
--  WHERE publishers.name = 'Random House';

-- SELECT stock.isbn, title, stock, retail FROM
-- (publishers JOIN editions ON (publishers.id = editions.publisher_id) join
-- books ON (books.id = editions.book_id) join stock 
-- ON (stock.isbn = editions.isbn))
--  WHERE publishers.name = 'Random House'
--  AND stock.stock != 0;

-- SELECT stock.isbn, title, stock, retail, CASE WHEN editions.type = 'h' THEN 'Hardback'
-- WHEN editions.type = 'p' THEN 'Paperback' END FROM
-- (publishers JOIN editions ON (publishers.id = editions.publisher_id) join
-- books ON (books.id = editions.book_id) join stock 
-- ON (stock.isbn = editions.isbn))
--  WHERE publishers.name = 'Random House'
--  AND stock.stock != 0;

-- SELECT title, publication
-- FROM books LEFT JOIN editions ON (editions.book_id = books.id);

-- -- Exercise 7
-- -- What's the total inventory of books in this library (i.e. how many total copies are in stock)?

-- SELECT SUM(stock) FROM stock;

-- Exercise 8
-- What is the overall average cost and retail price for all books for sale? Return three columns "Average cost", "Average Retail" and "Average Profit"

-- SELECT ROUND(AVG(cost),2) AS Average_cost, ROUND(AVG(retail),2) AS Average_Retail, ROUND((AVG(retail) - AVG(cost)),2) AS Average_profit FROM stock;

-- Exercise 9
-- Which book ID has the most pieces in stock?

-- Hints:

-- Use an aggregate function combined with LIMIT and ORDER BY clauses.
-- No need to join with the books table since we just want the ID which is already in the editions table.

-- SELECT editions.book_id, SUM(stock.stock) AS in_stock
-- FROM editions JOIN stock ON (editions.isbn = stock.isbn)
-- GROUP BY editions.book_id
-- ORDER BY SUM(stock.stock) DESC
-- LIMIT 1;

-- Exercise 10
-- List author ID along with the full name and the number of books they have written. Output 3 columns: "ID", "Full name" and "Number of Books"

SELECT authors.id AS "ID", (authors.first_name || ' ' || authors.last_name) AS "Full name", COUNT(books.id)
FROM authors JOIN books ON (authors.id = books.author_id)
GROUP BY authors.id;

-- Exericse 11
-- Order the result set above by number of books so that authors with most number of books appear atop the list (descending order).

SELECT authors.id AS "ID", (authors.first_name || ' ' || authors.last_name) AS "Full name", COUNT(books.id)
FROM authors JOIN books ON (authors.id = books.author_id)
GROUP BY authors.id
ORDER BY COUNT(books.id) DESC;