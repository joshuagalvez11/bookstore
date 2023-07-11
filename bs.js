require('dotenv').config();
const mysql = require('mysql');
const inquirer = require('inquirer');

  // create the connection information for the sql database
  const connection = mysql.createConnection({
    host: 'localhost',

  
    // Your username
    user: 'root',
  
    // Your password
    password: 'potato',
    database: 'bookstore',
  });

  const readLocations = () => {
    connection.query('SELECT * FROM locations', (err, res) => {
      if (err) throw err;
  
      // Log all results of the SELECT statement
      console.log(res);
      inquirerMenu(); 
    })
  };
  const readEmployees = () => {
    connection.query('SELECT * FROM employees', (err, res) => {
      if (err) throw err;
  
      // Log all results of the SELECT statement
      console.log(res);
      inquirerMenu(); 
    })
  };
  const readAuthors = () => {
    connection.query('SELECT * FROM authors', (err, res) => {
      if (err) throw err;
  
      // Log all results of the SELECT statement
      console.log(res);
      inquirerMenu(); 
    })
  };
  const readPublishers = () => {
    connection.query('SELECT * FROM publishers', (err, res) => {
      if (err) throw err;
  
      // Log all results of the SELECT statement
      console.log(res);
      inquirerMenu(); 
    })
  };
  const readCustomers = () => {
    connection.query('SELECT * FROM customers', (err, res) => {
      if (err) throw err;
  
      // Log all results of the SELECT statement
      console.log(res);
      inquirerMenu(); 
    })
  };
  const readBooks = () => {
    connection.query('SELECT * FROM books', (err, res) => {
      if (err) throw err;
  
      // Log all results of the SELECT statement
      console.log(res);
      inquirerMenu(); 
    })
  };
  const readRentals = () => {
    connection.query('SELECT * FROM rentals', (err, res) => {
      if (err) throw err;
  
      // Log all results of the SELECT statement
      console.log(res);
      inquirerMenu(); 
    })
  };
  const readPurchases = () => {
    connection.query('SELECT * FROM purchases', (err, res) => {
      if (err) throw err;
  
      // Log all results of the SELECT statement
      console.log(res);
      inquirerMenu(); 
    })
  };

  const insertLoc = () => {
    connection.query("INSERT INTO locations (location_id, adress, mo_op,tu_op,we_op,th_op,fr_op,sa_op,su_op,mo_cl,tu_cl,we_cl,th_cl,fr_cl,sa_cl,su_cl) VALUES (8, '889 8 st', 8,8,8,8,8,8,0,17,17,17,17,17,17,0);", (err, res) => {
      if (err) throw err;
  
      // Log all results of the SELECT statement
      console.log(res);
      inquirerMenu(); 
    })
  };
  const upLoc = () => {
    connection.query("UPDATE locations SET adress='888 8 st' WHERE location_id = 8;", (err, res) => {
      if (err) throw err;
  
      // Log all results of the SELECT statement
      console.log(res);
      inquirerMenu(); 
    })
  };
  const view1Loc = () => {
    connection.query('SELECT * FROM locations WHERE location_id = 8;', (err, res) => {
      if (err) throw err;
  
      // Log all results of the SELECT statement
      console.log(res);
      inquirerMenu(); 
    })
  };


  const locationZip = () => {
    connection.query('SELECT * FROM locations WHERE zip = 91402', (err, res) => {
      if (err) throw err;
  
      // Log all results of the SELECT statement
      console.log(res);
      inquirerMenu(); 
    })
  };

  const empHours = () => {
    connection.query('SELECT employee_id, employees.location_id, name, (mo_end - mo_st + tu_end - tu_st + we_end - we_st + th_end - th_st + fr_end - fr_st + sa_end - sa_st + su_end - su_st) AS total_hours FROM employees INNER JOIN locations ON locations.location_id = employees.location_id WHERE locations.location_id = 1 ORDER BY total_hours DESC;', (err, res) => {
      if (err) throw err;
  
      // Log all results of the SELECT statement
      console.log(res);
      inquirerMenu(); 
    })
  };

  const empMonday = () => {
    connection.query('SELECT employee_id, employees.location_id, name, mo_end , mo_st FROM employees INNER JOIN locations ON locations.location_id = employees.location_id WHERE locations.location_id = 1 AND (mo_end - mo_st) > 0;', (err, res) => {
      if (err) throw err;
  
      // Log all results of the SELECT statement
      console.log(res);
      inquirerMenu(); 
    })
  };

  const empMonth = () => {
    connection.query('SELECT employee_id, employees.location_id, name, (mo_end - mo_st + tu_end - tu_st + we_end - we_st + th_end - th_st + fr_end - fr_st + sa_end - sa_st + su_end - su_st) AS total_hours FROM employees INNER JOIN locations ON locations.location_id = employees.location_id ORDER BY total_hours DESC LIMIT 1;', (err, res) => {
      if (err) throw err;
  
      // Log all results of the SELECT statement
      console.log(res);
      inquirerMenu(); 
    })
  };

  const empOT = () => {
    connection.query('SELECT employee_id, employees.location_id, name, (mo_end - mo_st + tu_end - tu_st + we_end - we_st + th_end - th_st + fr_end - fr_st + sa_end - sa_st + su_end - su_st) AS total_hours FROM employees INNER JOIN locations ON locations.location_id = employees.location_id WHERE (mo_end - mo_st + tu_end - tu_st + we_end - we_st + th_end - th_st + fr_end - fr_st + sa_end - sa_st + su_end - su_st) > 40 ORDER BY total_hours DESC;', (err, res) => {
      if (err) throw err;
  
      // Log all results of the SELECT statement
      console.log(res);
      inquirerMenu(); 
    })
  };

  const payBal = () => {
    connection.query('UPDATE customers SET balance = 0 WHERE customer_id = 10;', (err, res) => {
      if (err) throw err;
  
      // Log all results of the SELECT statement
      console.log(res);
      inquirerMenu(); 
    })
  };

  const custAuth = () => {
    connection.query('SELECT purchases.customer_id, customers.name, title, author_id FROM purchases INNER JOIN customers ON purchases.customer_id = customers.customer_id INNER JOIN books ON purchases.book_id = books.book_id WHERE books.author_id = 5;', (err, res) => {
      if (err) throw err;
  
      // Log all results of the SELECT statement
      console.log(res);
      inquirerMenu(); 
    })
  };

  const custMultLoc = () => {
    connection.query('SELECT customers.customer_id, locations.location_id FROM rentals INNER JOIN customers ON rentals.customer_id = customers.customer_id INNER JOIN books ON rentals.book_id = books.book_id INNER JOIN locations ON books.location_id = locations.location_id GROUP BY customers.customer_id, locations.location_id ;', (err, res) => {
      if (err) throw err;
  
      // Log all results of the SELECT statement
      console.log(res);
      inquirerMenu(); 
    })
  };

  const custBySpend = () => {
    connection.query('SELECT purchases.customer_id, name, SUM(price) AS total_spent FROM purchases INNER JOIN customers ON purchases.customer_id = customers.customer_id INNER JOIN books ON purchases.book_id = books.book_id GROUP BY customer_id ORDER BY total_spent DESC;', (err, res) => {
      if (err) throw err;
  
      // Log all results of the SELECT statement
      console.log(res);
      inquirerMenu(); 
    })
  };

  const booksByAuth = () => {
    connection.query('SELECT * FROM books WHERE author_id = 2;', (err, res) => {
      if (err) throw err;
  
      // Log all results of the SELECT statement
      console.log(res);
      inquirerMenu(); 
    })
  };
  const booksByGenre = () => {
    connection.query("SELECT * FROM books WHERE genre = 'romance'", (err, res) => {
      if (err) throw err;
  
      // Log all results of the SELECT statement
      console.log(res);
      inquirerMenu(); 
    })
  };
  const bookRentHistory = () => {
    connection.query('SELECT * FROM rentals WHERE book_id = 1;', (err, res) => {
      if (err) throw err;
  
      // Log all results of the SELECT statement
      console.log(res);
      inquirerMenu(); 
    })
  };
  const bookAvail = () => {
    connection.query('SELECT * from books WHERE NOT book_id IN (SELECT book_id FROM rentals WHERE returned = 0) AND location_id = 2;', (err, res) => {
      if (err) throw err;
  
      // Log all results of the SELECT statement
      console.log(res);
      inquirerMenu(); 
    })
  };
  const rentalLate = () => {
    connection.query('SELECT rental_id, date_rented, date_due, rentals.customer_id, name, balance FROM rentals INNER JOIN customers ON customers.customer_id = rentals.customer_id WHERE returned = 0 and date_due < current_date();', (err, res) => {
      if (err) throw err;
  
      // Log all results of the SELECT statement
      console.log(res);
      inquirerMenu(); 
    })
  };
  const rentalReturn = () => {
    connection.query('UPDATE rentals SET returned = 1 WHERE customer_id = 3;', (err, res) => {
      if (err) throw err;
  
      // Log all results of the SELECT statement
      console.log(res);
      inquirerMenu(); 
    })
  };
  const purchByCust = () => {
    connection.query('SELECT * FROM purchases WHERE customer_id = 1;', (err, res) => {
      if (err) throw err;
  
      // Log all results of the SELECT statement
      console.log(res);
      inquirerMenu(); 
    })
  };
  const purchaseByBook = () => {
    connection.query('SELECT * FROM purchases WHERE book_id = 1;', (err, res) => {
      if (err) throw err;
  
      // Log all results of the SELECT statement
      console.log(res);
      inquirerMenu(); 
    })
  };




  function inquirerMenu(){
    var menuOptions = ["View all Locations", "Quit"];
    var quit = 0;
    inquirer.prompt([
        {
            type: 'list',
              message: 'what would you like to do: ',
              name: 'menu',
              choices: ["View all Locations","View all Employees","View all Authors","View all Publishers","View all Customers","View all Books","View all Rentals","View all Purchases", "Insert New Location", "Update Location", "View individual Location", "View Locations by zip", "All Employees ordered by total hours by location", "View Employees Scheduled On Monday", "Get Employee of the Month", "Get Employees who worked overtime", "Customer Pay off Balance", "All customers books for a certain author", "Customer who rented from more than 1 location", "Customers organized by total spending", "Books by certain author", "Books by certain genre", "Books rental history", "Check book avaialablity at a certain location", "View rentals past due", "Return a book rental", "View purchases by customer", "View purchases by book", "Quit"]
            },
    ]).then( async (response) => {
        const choice = response.menu;
        let cont = -1;
        if(choice === "View all Locations"){
            await readLocations();
      
        }else if(choice === "View all Employees"){
          await readEmployees();
          //cont = 1;
        }else if(choice === "View all Authors"){
          await readAuthors();
          //cont = 1;
        }else if(choice === "View all Publishers"){
            await readPublishers();
            //cont = 1;
        }else if(choice === "View all Customers"){
            await readCustomers();
            //cont = 1;
        }else if(choice === "View all Books"){
          await readBooks();
          //cont = 1;
        }else if(choice === "View all Rentals"){
            await readRentals();
            //cont = 1;
        }else if(choice === "View all Purchases"){
          await readPurchases();
          //cont = 1;
        }
        else if(choice === "Insert New Location"){
          await insertLoc();
          //cont = 1;
        }
        else if(choice === "Update Location"){
          await upLoc();
          //cont = 1;
        }
        else if(choice === "View individual Location"){
          await view1Loc();
          //cont = 1;
        }
        else if(choice === "View Locations by zip"){
          await locationZip();
          //cont = 1;
        }
        else if(choice === "All Employees ordered by total hours by location"){
          await empHours();
          //cont = 1;
        }
        else if(choice === "View Employees Scheduled On Monday"){
          await empMonday();
          //cont = 1;
        }
        else if(choice === "Get Employee of the Month"){
          await empMonth();
          //cont = 1;
        }
        else if(choice === "Get Employees who worked overtime"){
          await empOT();
          //cont = 1;
        }
        else if(choice === "Customer Pay off Balance"){
          await payBal();
          //cont = 1;
        }
        else if(choice === "All customers books for a certain author"){
          await custAuth();
          //cont = 1;
        }
        else if(choice === "Customer who rented from more than 1 location"){
          await custMultLoc();
          //cont = 1;
        }
        else if(choice === "Customers organized by total spending"){
          await custBySpend();
          //cont = 1;
        }
        else if(choice === "Books by certain author"){
          await booksByAuth();
          //cont = 1;
        }
        else if(choice === "Books by certain genre"){
          await booksByGenre();
          //cont = 1;
        }
        else if(choice === "Books rental history"){
          await bookRentHistory();
          //cont = 1;
        }
        else if(choice === "Check book avaialablity at a certain location"){
          await bookAvail();
          //cont = 1;
        }
        else if(choice === "View rentals past due"){
          await rentalLate();
          //cont = 1;
        }
        else if(choice === "Return a book rental"){
          await rentalReturn();
          //cont = 1;
        }
        else if(choice === "View purchases by customer"){
          await purchByCust();
          //cont = 1;
        }
        else if(choice === "View purchases by book"){
          await purchaseByBook();
          //cont = 1;
        }
        else if(choice === "Quit"){
            quit = 1;
            console.log("bye now");
            connection.end();
        }
    }
    )
  }

  

  connection.connect((err) => {
    if (err) throw err;
    console.log(`connected as id ${connection.threadId}\n`);
    inquirerMenu();
  });