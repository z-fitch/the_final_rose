# The Final Rose

This Rails application is intended to be used as a practice challenge for Mod 2.

The Final Rose is an application that displays past Bachelorette's, their contestants, and the outings (dates) that the contestants went on while on the show. Bachelorettes have many contestants, contestants belong to a bachelorette (that feels not great to type), contestants can have many outings that they go on and an outing can have more than one contestant on it (this is a real thing that happens on the show). Before getting started, think about what this relationship will look like between Bachelors, Contestants, and Outings.

## Be sure to read all user stories BEFORE beginning your work
---

## Setup

* Clone this repository onto your local computer
* Perform the usual setup steps after cloning a Rails application:
  - `bundle install`
  - `bundle update`
  - `rails db:{drop,create,migrate,seed}`
---

### Requirements

* TDD all new work; any model METHODS you write must be fully tested.
---
### Not Required

* No visual stylins is required or expected
* You do not have to test for or create any model validations (though you can if you want to practice). 
---
### Before Starting User Stories

* This challenge uses a one-to-many and a many-to-many relationship. Your one-to-many is already set up for you. You will need to create the many-to-many relationship (and be sure to test it all).
* You will have 2 passing model tests to start.

---

## User Stories
* Note: There are more user stories here than a normal assessment. You do not need to complete ALL of these practice stories. Rather, read through them all and find the one(s) you'd like to practice the most. 

```
User Story 1 of 7 - Bachelorette Show Page & Bachelorette's Contestants Index

As a visitor,
When I visit '/bachelorettes/:id',
I see that bachelorette's:
-Name
-Season Number
-Description of Season that they were on
(e.g.             
                  Hannah Brown
    Season 15 - The Most Dramatic Season Yet!
  )
I also see a link to see that bachelorette's contestants
When I click on that link
I'm taken to "/bachelorettes/:bachelorette_id/contestants"
and I can see only that bachelorette's contestants
```

```
User Story 2 of 7 - Bachelorette's Contestants Index

As a visitor,
When I visit a bachelorette's contestants index '/bachelorettes/:bachelorette_id/contestants',
I see the names of that bachelorette's contestants along with the following information:
-Age
-Hometown
(e.g. "Name: Pilot Pete, Age: 34, Hometown: Irving, TX")
And I can click on any contestants name (as a link) to go to that contestants show page "/contestants/:id"
```

```
User Story 3 of 7 - Contestant's Show Page

As a visitor,
When I visit a contestants show page,
I see that contestants name as well as the season number and season description that this contestant was on.
I also see a list of names of the outings that this contestant has been on while on the show.
(e.g.
                        Ben Higgins
Season 20 - No wait, THIS is the most dramatic season yet

Outings: Kickball
        Hot Springs
        Helicopter Ride
)
When I click on an outing name, I'm taken to that outings show page
```

```
User Story 4 of 7 - Outings Show Page

As a visitor,
When I visit an outings show page,
I see that outings name, location, and date
And I see a total count of contestants that were on this outing
And I see a list of all names of the contestants that went on this outing

(e.g.       Helicopter Ride
            Location: Bali
            Date: 09/12/19
          Count of Contestants: 3
Contestants: JoJo Fletcher, Kaitlyn Bristowe, Hannah Brown)
```

```
User Story 5 of 7 - Remove a Contestant from an Outing

As a visitor, 
When I visit an outings show page, 
I see a link next to each contestant's name that says "Remove"
When I click that link, I am redirected to the outings show page
Where I no longer see the name of that contestant listed. 
When I visit a different outings show page with that contestant, 
I still see that contestant's name listed. 
```

```
User Story 6 of 7 - Bachelorette Show Page: Average age

As a visitor,
When I visit a bachelorette show page
I see the average age of all of that bachelorette's contestants

(e.g. "Average Age of Contestants: 29.5")
```

```
User Story 7 of 7 - Bachelorette's Contestants Index: unique hometowns

As a visitor,
When I visit a bachelorette's contestants index '/bachelorettes/:bachelorette_id/contestants',

I see a UNIQUE list of all of the hometowns that these contestants are from.

(e.g. "These Contestants are from these hometowns: Denver, Aurora, San Diego, Boston")
```
