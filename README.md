# GeocodingApp

A Ruby on Rails application running in a Dockerized development environment.

## Prerequisites

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Setup

1. **Clone the repository**  
   ```sh
   git clone https://github.com/mgharbik/geocodingapp.git
   cd geocodingapp

2. **Build and start the containers**  
   ```sh
   docker-compose up --build

3. **Setup the database**  
   ```sh
   docker-compose run --rm app bin/rails db:create db:migrate

4. **Access the application**  
  - Open http://localhost:3000 in your browser.

5. **Stopping the application**  
   ```sh
   docker-compose down --volumes --remove-orphans

6. **Run all tests**  
   ```sh
   docker-compose run --rm -e "RAILS_ENV=test" app bundle exec rspec
