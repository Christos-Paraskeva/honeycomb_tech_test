## Technologies and Approach

This application is built with:
- Ruby

And tested with:
- Rspec
- Coveralls

## To use

- Clone this repo
- Once the repo has been cloned, go to project root
- You should first install and run bundle to install all gems in the gem file needed for the program to function correctly.

```
$ bundler install
$ bundle
```
- Run 'ruby run.rb' to see a print out of the order template

![printout_example](https://github.com/Christos-Paraskeva/honeycomb_tech_test/blob/master/screenshots/printout.jpg)


**Useful information:**

The delivery class takes 4 parameters:
- Name
- Price
- Optional: discount condition (how many uses of this delivery method will constitute a discount) - This must be an Integer value
- Optional: discount cost (discount condition must be defined otherwise this will be ignored)

**To run tests:**

- Ensure the correct gems are installed
- Run 'rspec' in the project root
```
$ rspec
```

## Approach

Pondered over the task and how to begin, and whether I should start from scratch or expand upon the example code provided.  I felt that the phrasing of the question suggested that the new feature should be implemented on the current example codebase.

- Set up coveralls
- Wrote some tests - which I felt were missing in the example code  
- Made sure that all the tests were passing
- Began implementing features given in app spec
- Refactored Discount methods: moving them from a private method in the order class, to it’s own class.  I felt this was necessary, and allows for new types of discount classes to easily be created and passed into the order upon instantiation.
- Refactored Print method: separated it out, then moved to it’s own class
- Added an extra feature
- Maintained a TDD approach throughout the whole project

Once I was happy with how the code was set up, and all the tests were passing, I began to implement the new features

## Techniques

### User stories for features

```
As a company
I want to be able to apply discounts to postage
So that I can encourage more customers

As a company
I want to be able to apply discounts to total cost
So that I can encourage even more customers!
```

I spent some time visualizing how I would implement this given that the tech-test spec stated that the discount methods needed to be flexible, as the promotions would be constantly changing.  I decided to implement a feature that would allow a discount to be set every time a new delivery method is created.

### Advantages of this:  
- Simple to make changes
- Case by case basis for each delivery method
- No blanket discount method that needed to be tweaked every time something changed.

Decided to also implement a feature, based on my own user story, as it felt this would be a useful function of a real world application of this type.

```
As a user
I want to be able to remove last item from basket
So that I don't make a mistake when ordering
```

Towards the end of the project, I wanted to visualize how this application will work in a real world situation. I pondered for quite a while whether to implement a method that will reset everything after the order had been checked out. Most notably in regards to the postage, which needs to be reset back to original price after each order is made otherwise any active discount will be carried over to next order.

I did initially implement an each loop to reset the postage costs back, but this approach felt wrong and messy to me, and I eventually decided that it makes more sense to visualize each individual order as a new instance of the Order class, which takes fresh postage methods / a new Material, etc.


# Instructions for this exercise:  

## The challenge

We have a system that delivers advertising materials to broadcasters.

Advertising Material is uniquely identified by a 'Clock' number e.g.

* `WNP/SWCL001/010`
* `ZDW/EOWW005/010`

Our sales team have some new promotions they want to offer so
we need to introduce a mechanism for applying Discounts to orders.

Promotions like this can and will change over time so we need the solution to be flexible.

### Broadcasters

These are the Broadcasters we deliver to

* Viacom
* Disney
* Discovery
* ITV
* Channel 4
* Bike Channel
* Horse and Country


### Delivery Products

* Standard Delivery: $10
* Express Delivery: $20

### Discounts

* Send 2 or more materials via express delivery and the price for express delivery drops to $15
* Spend over $30 to get 10% off

### What we want from you

Provide a means of defining and applying various discounts to the cost of delivering material to broadcasters.

We don't need any UI for this, we just need you to show us how it would work through its API.

## Examples

Based on the both Discounts applied, the following examples should be valid:

* send `WNP/SWCL001/010` to Disney, Discovery, Viacom via Standard Delivery and Horse and Country via Express Delivery
    based on the defined Discounts the total should be $45.00

* send `ZDW/EOWW005/010` to Disney, Discovery, Viacom via Express Delivery
     based on the defined Discounts the total should be $40.50
