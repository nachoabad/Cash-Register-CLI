# Ruby Cash Register CLI

The Ruby Cash Register CLI is a simple command-line application that simulates a basic cash register system. It allows users to add products to an order, apply discounts, and calculate the total amount due.

## Features

- Add products to an order using product codes
- Increment quantities of existing products in the order
- Apply discounts based on predefined rules
- Calculate and display the total amount due

## Getting Started

To get started with the Ruby Cash Register CLI, clone this repository to your local machine and navigate to the project directory.

```
git clone https://github.com/nachoabad/cash_register_cli.git
cd cash_register_cli
bundle install
```

### Prerequisites

This application assumes Ruby to be installed on your system.


## Running the Application

To run the Cash Register CLI, execute the main script from the command line:

`ruby bin/cash_register`


Follow the on-screen prompts to add products, increment quantities, and calculate totals.

## Running Tests

This project uses RSpec for testing. To run the test suite, ensure you are in the project directory and execute:

`rspec`

## TO DOs

- This application needs error handling: it assumes you will only input correct product codes found in `lib/cash_register/config.rb`

- Although fully tested in the End-to-End feature spec, the Discount classes need unit testing for future refactoring.

## Showcase video
