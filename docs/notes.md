# Freecyclery Change

Feature Request:
integrate functionality from the application program:
  - caseworkers can log into a dashboard
  - caseworkers get a fixed number of applicatnts
  - anyone can create a user
  - users might need to be merged
  - admin (tz) can view a dashboard of applications
  - currently admin copies things from vapply to bikes n clients
  - caseworker should tell us how we will get the $ for the lock and
    helmet - there are about five different scenarios
  - generate a template for the caseworker when the bike is done that
    reiterates expectations for helmet and lock $
  - enter pronouns in application
  - don't make price a necessary field on freecyclery applications

being able to export clients to CSV with associated bike info would be
nice
cursor starts in 'brand' field when creating a new bike
tabbing through the bike form skips the select fields in safari

currently for a bike it states:
Will pay 25$ for lock & helmet: []

proposed change:

Who will make payment? [drop down with 2 options, client/agency]
Payment status? [drop down with 2 options, paid/unpaid]

code organization: pull out all views that just filter the bikes some
way into their own controller, rather than cluttering up model
controllers. 

remove bike_index functionality because its unused.
bike_assigned_at update should be in callback, not in clients controller

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
