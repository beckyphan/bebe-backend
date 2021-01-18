# Bebe Backend

Bebe Backend is a rails API that works in conjunction with BeBe Frontend. It holds users, bebes, days, and tracking data that the frontend references.

## Installation

This project has been built to run locally on your computer and uses a Postgres database. Be sure to initialize the database, run migrations, and then start the rails server on localhost:3000 (or otherwise edit configurations on frontend)

## Usage
Once you have your rails server successfully running, that's all there is to it! Everything you do to read/create/update data will be from your frontend.

The current abilities include:
- Register Users/Authenticate Users (Log In)
- Users can create Bebes, edit Bebe attributes, and delete Bebes
- Users can add days to Bebes
- Users can add/delete tracking data belonging to each day
- Users can delete their accounts

Update controller actions and corresponding actions in frontend if you want additional functionality.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)
