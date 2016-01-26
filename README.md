# To Do List!

#### An app to track your daily tasks.

#### By Christopher Siems

## Description

The To Do List! will allow to track your daily tasks and create multiple category tags to organize them. You can also record the task's due date and whether or not the task has been completed.

## Setup/Installation Requirements

* Clone this repository.
* Make sure you have Gradle, Java and Postgres installed.
* In a terminal: Open `postgres`
* Open psql in a new tab
* Run the following command in psql to create the database
`CREATE DATABASE to_do`
* Navigate to your project directory in your terminal and run the following command to populate your database
`psql to_do < to_do.sql`
* In the top level of the cloned directory, run the following command in your terminal:
`gradle run`
* Open your web browser of choice to localhost:4567

## Technologies Used

Java, PostgreSQL, Spark, JUnit, Velocity, Bootstrap, FluentLenium

### License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Copyright (c) 2016 **_Christopher Siems_**
