<!-- TABLE OF CONTENTS -->
## Table of Contents
  <ol>
      <ul>
        <li><a href="#about-the-project">About The Project</a></li>
        <li><a href="#database-schema">Database Schema</a></li>
        <li><a href="backend-repository-installation">Backend Repository Installation</a></li>
        <li><a href="#challenges">Challenges</a></li>
        <li><a href="#future-improvements">Future Improvements</a></li>
      </ul>
  </ol>


<!-- ABOUT THE PROJECT -->
## About The Project

Tea Subsciption is a backend service that can be used for consumption by a frontend applicaiton. The service is built with Ruby on Rails and its goal is to demostrate competency for employment.

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- Database Schema -->
### Database Schema

<img src=" " alt="Database-Schema" width="90%" height="90%">

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- Backend Repository Installation -->
### Backend Repository Installation

1. Clone the repository.
1. cd into the target directory.
1. Install gem packages: `bundle install`.
1. Setup the database: `rails db:{create,migrate,seed}`.
1. To run local RSpec test suite: `bundle exec rspec`, all tests should be passing.

### Gems Utilized

- [Factory Bot Rails](https://github.com/thoughtbot/factory_bot_rails)
- [Faker](https://github.com/vajradog/faker-rails)
- [Pry](https://github.com/pry/pry)
- [Pry Rails](https://github.com/pry/pry-rails)
- [RSpec Rails](https://github.com/rspec/rspec-rails)
- [SimpleCov](https://github.com/simplecov-ruby/simplecov)
- [Shoulda-Matchers](https://github.com/thoughtbot/shoulda-matchers)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- Available Endpoints -->
## Available Endpoints

### <ins>Customer Subscription Endpoints</ins>
<details close>
  <summary>Find All Customer's Subscriptions</summary><br>

Returns a list of all current customers subscriptions in database.<br>

Example endpoint:
```
GET /api/v1/customers/1/subscriptions
```

Expected Response:

 ```json
{
    "data": [
        {
            "id": "5",
            "type": "subscriptions",
            "attributes": {
                "title": "eum",
                "price": 25.15
            }
        }
    ]
}
```
</details><br>

<details close>
  <summary>Create a Customer Subscription</summary><br>

Creates a relationship between an existing customer and an existing subscription.<br>

Example endpoint:
```
POST /api/v1/subscription_customers
```

Example Request Body:
```json
{
  "customer_id": 1,
  "subscription_id": 1,
  "frequency": "weekly",
  "status": "active"
}
```

Expected Response:

```json
{ 
  "message": "Customer Successfully Subscribed" 
}
```
</details><br>

<details close>
  <summary>Cancelling a Customer's Subscription</summary><br>

Deletes the relationship between a customer and subscription.<br>

Example Endpoint: 

```
DELETE /api/v1/subscription_customers/1
```

Expected Response:

```json
{ 
  "message": "Customer Successfuly Unsubscribed" 
}
```
</details><br>

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- Challenges -->
## Challenges
- Slowing down
- Refactoring controllers 
- Sad path testing

<!-- Future Improvements -->
## Future Improvements
- Refactoring routes to be more RESTful
- Include more sad path testing
- Create CRUD endpoints
