#!/bin/bash
# Script to import coffee data to production database

echo "This will import the coffee data to your production PostgreSQL database."
echo ""
echo "You have two options:"
echo ""
echo "1. Use Render Dashboard Console:"
echo "   - Go to: https://dashboard.render.com/web/srv-d3oosi3ipnbc739damp0"
echo "   - Click 'Shell' in the top menu"
echo "   - Run: bundle exec rails db:import_from_sqlite"
echo ""
echo "2. Use Render CLI (if installed):"
echo "   - Run: render shell coffee_tracker"
echo "   - Then: bundle exec rails db:import_from_sqlite"
echo ""
echo "The import will create 1 coffee review with all the data from your development database."
