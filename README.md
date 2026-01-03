# Shopping Cart Project

## Requirements
- PHP 8.2
- Node > 20
- Composer
- Node.js & NPM
- MySQL
- Laravel 10

---

## Setup Instructions

### 1. Clone the Project
Clone the project from GitHub (replace `<your-repo-url>` with your repository link):

```bash
git clone <your-repo-url>
cd <project-folder>



composer install


npm install



cp .env.example .env


DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=cart
DB_USERNAME=root
DB_PASSWORD=

APP_URL=https://localhost/shopingcart/
ASSET_URL=https://localhost/shopingcart/public
VITE_SUB_URL="/shopingcart/"
VITE_API_BASE_URL="https://localhost/shopingcart"




php artisan key:generate
php artisan migrate
php artisan db:seed



npm run dev



