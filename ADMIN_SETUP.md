# Admin Authentication Setup

## Overview

The Coffee Tracker app now has a simple authentication system:

- **Read-only access**: Everyone can view all coffee reviews
- **Admin access**: Login required to create, edit, or delete coffee reviews

## Admin Login

1. Click "Admin Login" in the top-right corner of the homepage
2. Enter the admin password
3. Once logged in, you'll see "Logout (Admin)" and can access all edit features

## Admin Password

The admin password is set via the `ADMIN_PASSWORD` environment variable.

### Production (Render)
The password has been set in your Render environment variables to: `SecureAdminPass2025!`

You can update it anytime in the Render dashboard:
- Go to your service settings
- Navigate to Environment
- Update the `ADMIN_PASSWORD` variable

### Development
Set the password in your `.env` file:
```
ADMIN_PASSWORD=your_dev_password
```

Or use the default password: `changeme123`

## Data Import

To import the coffee data from SQLite to PostgreSQL in production:

```bash
# SSH into Render (or use Render dashboard console)
bundle exec rails db:import_from_sqlite
```

This will import your existing coffee review from the development database.

## Features

- Session-based authentication (stored in Rails session)
- No user accounts needed - single admin password
- Automatic UI hiding for non-admin users:
  - "Add New Coffee" button hidden
  - "Edit" buttons hidden
  - "Delete" buttons hidden
- Admin status shown in header when logged in
