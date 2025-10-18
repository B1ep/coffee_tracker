# Admin Access Instructions

## 🔐 Two-Layer Security

Your admin area is protected by **two layers of security**:

### Layer 1: Secret URL Path
- Admin pages are NOT at `/admin/login`
- They are at: `/brewmaster/login`
- Only you know this path - it's not linked anywhere on the site

### Layer 2: HTTP Basic Authentication
When you visit the secret URL, you'll see a browser popup asking for credentials:
- **Username:** `blep`
- **Password:** `brooklyn-celtics-espresso`

### Layer 3: Session Password
After passing HTTP Basic Auth, you'll see the login form:
- **Session Password:** Use the value from `ADMIN_PASSWORD` env variable (or `changeme123` locally)

## 📝 How to Access Admin

1. Go to: `https://colinallison.me/brewmaster/login`
2. Enter HTTP Basic Auth credentials in browser popup:
   - Username: `blep`
   - Password: `brooklyn-celtics-espresso`
3. Enter session password on the login form
4. You're in! Now you can add/edit/delete coffee entries

## 🚀 Production Setup

On Render, set these environment variables:
- `ADMIN_USERNAME` - HTTP Basic Auth username (default: `blep`)
- `ADMIN_HTTP_PASSWORD` - HTTP Basic Auth password (default: `brooklyn-celtics-espresso`)
- `ADMIN_PASSWORD` - Session password (required)

**Recommended:** Change the default passwords in production!

## 🔗 Admin URLs

All admin pages use the secret path prefix:
- Login: `/brewmaster/login`
- Logout: `/brewmaster/logout`
- Import data: `/brewmaster/import`
- Upload images: `/brewmaster/upload`

## 🔒 Security Features

- ✅ Secret URL path (not discoverable)
- ✅ No admin login link on public site
- ✅ HTTP Basic Authentication (browser-level)
- ✅ Session-based authentication (form password)
- ✅ Logout button only visible when logged in
- ✅ Environment variables for credentials

## 💡 Tips

- Bookmark the secret login URL for easy access
- Use a password manager to store all credentials
- Consider changing the secret path if it's ever exposed
- The HTTP Basic Auth credentials can be different from session password
