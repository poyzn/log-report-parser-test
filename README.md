### Ruby Developer Test 

#### Task

Create a parser which parses log file. Parser should
be run via CLI and a file should be passed as argument.

Example of content of the valid log file:

```
/about/2 444.701.448.104
/about/2 543.910.244.929
/contact 235.313.352.950
/home 646.865.545.408
/home 382.335.626.855
/index 929.398.951.889
/index 715.156.286.412
/help_page/1 382.335.626.855
```

#### Solution

A parser created in Ruby language. Ruby version `2.7.1`.
Before running the parser install required gems:

`bundle install`

To parse file run the parser from command line and pass 
the file with logs as argument:

`./parser.rb webserver.log`

Tests are written with `rspec`. To run tests:

`rspec`

To check styles with rubocop run:

`rubocop`

#### Features of the parser app

- Modular and maintainable structure
- A number of service object with single responsibility
- IPv4 and path validators
- Exception processing with friendly messages
- Tests coverage

#### Report example

Successfull parser's run output example:

```
Visits
/about/2 90 visits
/contact 89 visits
/index 82 visits
/about 81 visits
/help_page/1 80 visits
/home 78 visits
Users
/index 23 unique views
/home 23 unique views
/contact 23 unique views
/help_page/1 23 unique views
/about/2 22 unique views
/about 21 unique views
Average
/about/2 4 user per view
/about 3 user per view
/index 3 user per view
/home 3 user per view
/contact 3 user per view
/help_page/1 3 user per view
```

