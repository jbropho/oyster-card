[![Build Status](https://travis-ci.org/jbropho/oyster-card.svg?branch=master)](https://travis-ci.org/jbropho/oyster-card)
# Oyster Card 
## Week long task to create a mock oyster card application in ruby
[Specification](https://github.com/makersacademy/course/tree/master/oystercard)

## Usage 
      ```
      $ irb 
      2.5.0 :001 > require './lib/station.rb'
      => true
      2.5.0 :002 > require './lib/oyster_card.rb'
      => true
      2.5.0 :003 > card = OysterCard.new
      => #<OysterCard:0x00007f9bcb050ff0 @balance=0, @journey_log=#<JourneyLog:0x00007f9bcb050
      fa0 @history=[]>>
      2.5.0 :004 > card.top_up 10
      => 10
      2.5.0 :005 > hampstead = Station.new(:hampstead, 3)
      => #<Station:0x00007f9bca08a350 @name=:hampstead, @zone=3>
      2.5.0 :006 > whitechapel = Station.new(:whitechapel, 1)
      => #<Station:0x00007f9bca11b6c0 @name=:whitechapel, @zone=1>
      2.5.0 :007 > card.touch_in hampstead
      => #<Station:0x00007f9bca08a350 @name=:hampstead, @zone=3>
      2.5.0 :008 > card.touch_out whitechapel
      => false
      2.5.0 :009 > card.balance
      => 7
      2.5.0 :010 >
      ```
## Approach
My focus was on translating the requirments into a simple plan and writing clean,
test driven code.

## Positives 
* Test coverage > 95% 
* Spent time learning pry
* Simple methods no longer than 3 lines

## Goals 
* Understand the debate surrounding testing/ not testing private methods
