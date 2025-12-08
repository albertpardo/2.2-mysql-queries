## 📄 Description - Exercise Statement

This is the second task for **Sprint 2 Databases** in the **Backend Java Course** in ITAcademy (Barcelona, Spain).
There are 3 levels with exercises.

### Description

**Database Store**

We have the product and manufacturer tables, each with the following fields:

-   product (code, name, price, manufacturer\_code)
-   manufacturer (code, name) The field 'manufacturer\_code' from the product entity is related to the field 'code' from the manufacturer entity. Please execute the following queries:

1.  List the name of all products in the product table.
2.  List the names and prices of all products in the product table.
3.  List all columns from the product table.
4.  List the names of the products, the price in euros, and the price in US dollars (USD).
5.  List the names of the products, the price in euros, and the price in US dollars (USD). Use the following aliases for the columns: product\_name, euros, dollars.
6.  List the names and prices of all products in the product table, converting the names to uppercase.
7.  List the names and prices of all products in the product table, converting the names to lowercase.
8.  List the names of all manufacturers in one column, and in another column obtain the first two characters of the manufacturer's name in uppercase.
9.  List the names and prices of all products in the product table, rounding the price value.
10.  List the names and prices of all products in the product table, truncating the price value to show it without any decimal digits.
11.  List the code of manufacturers that have products in the product table.
12.  List the code of manufacturers that have products in the product table, removing any duplicate codes.
13.  List the names of manufacturers sorted in ascending order.
14.  List the names of manufacturers sorted in descending order.
15.  List the names of products ordered first by name in ascending order and second by price in descending order.
16.  Return a list with the first 5 rows from the manufacturer table.
17.  Return a list with 2 rows starting from the fourth row of the manufacturer table. The fourth row should also be included in the response.
18.  List the name and price of the cheapest product. (Only use the ORDER BY and LIMIT clauses). **NOTE:** You cannot use MIN(price) here; you need GROUP BY.
19.  List the name and price of the most expensive product. (Only use the ORDER BY and LIMIT clauses). **NOTE:** You cannot use MAX(price) here; you need GROUP BY.
20.  List the name of all products from the manufacturer whose manufacturer code is equal to 2.
21.  Return a list with the name of the product, price, and manufacturer name of all products in the database.
22.  Return a list with the name of the product, price, and manufacturer name of all products in the database. Sort the result by manufacturer's name in alphabetical order.
23.  Return a list with the product code, product name, manufacturer code, and manufacturer name for all products in the database.
24.  Return the name of the product, its price, and the name of its manufacturer for the cheapest product.
25.  Return the name of the product, its price, and the name of its manufacturer for the most expensive product.
26.  Return a list of all products from the manufacturer Lenovo.
27.  Return a list of all products from the manufacturer Crucial that have a price greater than 200 €.
28.  Return a list of all products from the manufacturers Asus, Hewlett-Packard, and Seagate without using the IN operator.
29.  Return a list of all products from the manufacturers Asus, Hewlett-Packard, and Seagate using the IN operator.
30.  Return a list with the name and price of all products from manufacturers whose names end with the vowel e.
31.  Return a list with the name and price of all products whose manufacturer's name contains the character w in its name.
32.  Return a list with the product name, price, and manufacturer name of all products that have a price greater than or equal to 180 €. Sort the result, first by price (in descending order) and second by name (in ascending order).
33.  Return a list with the code and name of the manufacturer, only for those manufacturers that have associated products in the database.
34.  Return a list of all manufacturers that exist in the database, along with the products each of them has. The list should also show those manufacturers that do not have associated products.
35.  Return a list that only includes those manufacturers that do not have any associated products.
36.  Return all products from the manufacturer Lenovo. (Without using INNER JOIN).
37.  Return all data from products that have the same price as the most expensive product of the manufacturer Lenovo. (Without using INNER JOIN).
38.  List the name of the most expensive product from the manufacturer Lenovo.
39.  List the name of the cheapest product from the manufacturer Hewlett-Packard.
40.  Return all products from the database that have a price greater than or equal to the most expensive product from the manufacturer Lenovo.
41.  List all products from the manufacturer Asus that have a price higher than the average price of all their products.

**Database University**

Please download the database from the file schema\_universidad.sql, view the E-R diagram in an editor, and execute the following queries:

1.  Return a list with the first surname, second surname, and the name of all students. The list should be ordered alphabetically from lowest to highest by the first surname, second surname, and name.
2.  Find the name and both surnames of students who have not registered their phone number in the database.
3.  Return the list of students born in 1999.
4.  Return the list of professors who have not registered their phone number in the database and whose NIF ends with K.
5.  Return the list of subjects taught in the first semester, in the third year of the degree with the identifier 7.
6.  Return a list of professors along with the name of the department to which they are linked. The list should return four columns: first surname, second surname, name, and department name. The result should be ordered alphabetically from lowest to highest by surname and name.
7.  Return a list with the name of the subjects, start year, and end year of the academic year for the student with NIF 26902806M.
8.  Return a list of all departments that have professors teaching any subjects in the Degree in Computer Engineering (Plan 2015).
9.  Return a list of all students who have enrolled in any subject during the academic year 2018/2019.

Resolve the following 6 queries using the LEFT JOIN and RIGHT JOIN clauses.

1.  Return a list with the names of all professors and the departments they are linked to. The list should also show those professors who do not have any associated department. The list should return four columns: department name, first surname, second surname, and professor's name. The result should be ordered alphabetically from lowest to highest by department name, surname, and name.
2.  Return a list of professors who are not associated with any department.
3.  Return a list of departments that do not have any associated professors.
4.  Return a list of professors who do not teach any subjects.
5.  Return a list of subjects that do not have an assigned professor.
6.  Return a list of all departments that have not taught any subjects in any academic year.

### Summary Queries:

1.  Return the total number of students.
2.  Calculate how many students were born in 1999.
3.  Calculate how many professors there are in each department. The result should only show two columns: one with the department name and another with the number of professors in that department. The result should only include departments that have associated professors and should be ordered from highest to lowest by the number of professors.
4.  Return a list of all departments and the number of professors in each of them. Keep in mind that there may be departments with no associated professors. These departments should also appear in the list.
5.  Return a list with the name of all degrees existing in the database and the number of subjects each has. Note that there may be degrees with no associated subjects. These degrees should also appear in the list. The result should be ordered from highest to lowest by the number of subjects.
6.  Return a list with the name of all degrees existing in the database and the number of subjects each has, for degrees that have more than 40 associated subjects.
7.  Return a list that shows the name of the degrees and the total number of credits for each type of subject. The result should have three columns: degree name, subject type, and the sum of credits for all subjects of that type.
8.  Return a list that shows how many students have enrolled in any subject during each academic year. The result should display two columns, one column with the start year of the academic year and another with the number of enrolled students.
9.  Return a list with the number of subjects each professor teaches. The list should take into account those professors who do not teach any subjects. The result will show five columns: id, name, first surname, second surname, and the number of subjects. The result should be ordered from highest to lowest by the number of subjects.
10.  Return all data for the youngest student.
11.  Return a list of professors who have an associated department and do not teach any subjects.

#### Level 1

You will certify your level 1 if you construct 37 correct queries, 20 of which must be from the University diagram.

#### Level 2

You will have level 2 if you construct between 37 and 56 correct queries, 20 of which must be from the University diagram.

#### Level 3

Level 3 if you successfully construct more than 56 correct queries (20 of them must be from the University diagram)!!!


## 📋 Requirements

- MySQL Workbench 8.0 Community
- MySql 9.5 ( Workbench give a Warning because is not supported . But in my test it works)

## 🛠️ Installation

Fork or download this repo. 

## ▶️ Execution

If you do not have MySQL and MySQL Workbench, you can use docker.

I have use `Docker version 29.1.2, build 890dcca`

Here is the `compose.yml` that I used (**Don not Use in production**)
```yaml
services:
  db:
    image: mysql:9.5
    container_name: mysql-container
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: example
    ports:
      - "3306:3306"
    volumes:
      - mysql-data:/var/lib/mysql
    networks:
      - my-network

  workbench:
    image: lscr.io/linuxserver/mysql-workbench:latest
    container_name: mysql-workbench
    restart: unless-stopped
    environment:
      PUID: 1000
      PGID: 1000
      TZ: Etc/UTC
    ports:
      - "3000:3000"
      - "3001:3001"
    volumes:
      - ./workbench/config:/config
    cap_add:
      - IPC_LOCK
    shm_size: "1gb"
    networks:
      - my-network

volumes:
  mysql-data:

networks:
  my-network:
     driver: bridge
```

The line ` MYSQL_ROOT_PASSWORD: example`  contains the root password for MySql DB.

Run the container with: `docker compose up -d`

To accest to Workbench use your web browser to acces to `http://localhost:3000/`

Stop containers with : `docker compose down`
