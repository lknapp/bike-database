# Features 
- search bikes via brand, make, or serial number.
- add mechanics table and change text input to a dropdown
- flash message after a bike is logged should include the bike log
  number
- unique index on log number for bikes
- Use hyphens for dates instead of backslashes
- Autopopulate fields like model, brand, color based on what exists in
  db
- use fixed-bike form with checkboxes to autopopulate 'work done' and
  'new parts' section (this is especially useful for the characteristics
"overhauled" and below
- ability to print a receipt from the bike page would be helpful
- list of freecyclery clients should be chronological, ideally by date
  of bike assignment, otherwise at least by application date
- assign a bike from the available freecyclery bikes page
- there should be nice feedback indicating that the bike was sold
- order agencies by name
- restyle agencies page to not have show or destroy links

# Bugs
- printing a single freecyclery receipt from the client page uses the
  old styling
- reports are broken
- parsing of date from string to datetime in controllers prevents
  multiple calls to bike_params

# Tech debt
- price is a string
- non restful routes (eg 'bikes/mark_as_sold')

# Tech
- clients should require a name
- eliminate duplication between client receipts and freecyclery receipts
- use log number in bike url instead of id
- paginate 'all clients' page
- convert to bootstrap-less
- integrate with autocomplete to get manufacturers & models
- enable posting to bike index when a bike is created
- add tests to ensure that pages render

# Other
Reports
  General Reports
    bikes donated per year
  Yearly Reports
    bikes sold by month. (Bar graph for extra points!)
    bikes donated by year or month. (With bar graph!?)
    bikes donated according to agency. (Graph?)

Improve form layouts
make navigation always on the left side of the page
refactor index - move unsold bikes to model
add recyclery logos & bike memorabilia pics all over app
