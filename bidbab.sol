pragma solidity ^0.4.0;

contract bidbab {
    struct space {
        struct Location {
          uint32 lat; //times 1/100000
          uint32 long; //times 1/100000
      }
        
        struct startStopDate {
          uint fromDate;
          uint toDate;
        }
      
      address listedBy = msg.sender;
      uint startdate = now; //set via function
      uint enddate = now; //set via function
        
        struct Bid {
            address placedBy;
            uint amount;
            startStopDate[] calendar;
        }
      
        Bid[] private bids;
      Bid public currentbid;
    }
  
    struct bidder {
        uint8 stars;
    }
  
    mapping(address=>bidder) public bidders;
    
    struct host {
        uint8 stars;
    }
    
    mapping(address=>host) public hosts;
    
    function validDate(uint _date) private returns (bool) {
        if(_date < now) {
            return false;
        }
    } 
         
    function dateCollision(uint _start, uint _toDate, Space _space) private returns (bool)
    {
        startStopDate booked = getCalendar(_space);
        for (uint i = 0; i< booked.length(); i++) {
          uint bookedStart = booked[i];
          uint end = bookedi[i];
          if(_start < bookedStart && bookedStart < _toDate)
            {
              return true;
            }
          else if(end > _start && end < _toDate)
            {
              return true;
            }
          else if(bookedStart < _start && end > _toDate)
            {
              return true;
            }
        }
        return false;
    }
    
    //this returns a binary array representing the calendar of the space
    function getCalendar(struct _space) private returns (struct)
    {
        returns _space.bid.startStopDates;
    }
    
    function placeBid (struct _space, uint _start, uint _toDate, _amount) internal
    {
        StartStopDate cal = getCalendar();
        _space.Bid userBid;
        userBid.placedBy = msg.sender;
        userBid.amount = _amount;
        userBid.startStopDate = cal;
        _space.bids.push(userBid);
    }
    
    //returns false if there is no other bids during that time
    function Bid(uint _start, uint _toDate, Space _space, _amount) private returns (bool)
    {
        uint durationOfStay = _toDate - _start;
        if(dateCollision(_start, _toDate, _space))
        {
          placeBid(_start, _toDate, _space, _amount);
          return true;
        }
        else
        {
          placeBid(_start, _toDate, _space, _amount);
          return false;
        }
    }
}