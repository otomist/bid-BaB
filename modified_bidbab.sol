pragma solidity ^0.4.0;

contract bidbab {
    struct Location {
      uint32 lat; //times 1/100000
      uint32 long; //times 1/100000
    }
    
    struct StartStopDate {
        uint fromDate;
        uint toDate;
    }
        
    struct Bid {
        address placedBy;
        uint amount;
      	StartStopDate duration;
    }
    
    struct Space {
      
        address listedBy;//= msg.sender
        uint startdate;// = now; //set via function
        uint enddate;// = now; //set via function
        
        Bid[] bids;
        //Bid currentbid;
        StartStopDate[] freeSpace;
    }
    
    function validDate(uint _date) private returns (bool) {
        if(_date < now) {
            return false;
        }
    } 
         
    // function dateCollision(uint _start, uint _toDate, StartStopDate _durr,) private returns (bool)
    // {
    //     // uint[] memory starts;
    //     // uint[] memory stops;
    //     // (starts, stops) = getCalendar(_space);
    //     //StartStopDate storage booked;
    //   	StartStopDate otherBids = _space.bids;
    //     //StartStopDate[] booked = b.calendar;
    //     for (uint i = 0; i< otherBids.length(); i++) {
    //       uint bookedStart = otherBids[i].fromDate;
    //       uint end = otherBids[i].toDate;
    //       if(_start < bookedStart && bookedStart < _toDate)
    //         {
    //           return true;
    //         }
    //       else if(end > _start && end < _toDate)
    //         {
    //           return true;
    //         }
    //       else if(bookedStart < _start && end > _toDate)
    //         {
    //           return true;
    //         }
    //     }
    //     return false;
    // }
    
    //this returns a binary array representing the calendar of the space
    // function getCalendar(Space _space) private returns (uint[], uint[])
    // {
    //     StartStopDate dates = _space.bids.calendar[0];
    //     uint leng = dates.length();
    //     uint[] starts;//TODO Make these of length leng instead of infinite
    //     uint[] stops;
    //     for(uint x = 0; x < dates.length();x++)
    //     { 
    //         starts[x] = dates[x].fromDate;
    //         stops[x] = dates[x].toDate;
    //     }
    //     return (starts, stops);
    // }
    
    function placeBid (Space storage _space, uint _start, uint _toDate, uint _amount) internal
    {
        //StartStopDate cal = getCalendar();
        
        Bid storage userBid;
        userBid.placedBy = msg.sender;
        userBid.amount = _amount;
        userBid.duration.fromDate = _start;
        userBid.duration.toDate = _toDate;
        _space.bids.push(userBid);
    }
    
    // //returns false if there is no other bids during that time
    // function makeBid(uint _start, uint _toDate, Space _space, uint _amount) private returns (bool)
    // {
    //     uint durationOfStay = _toDate - _start;
    //     placeBid(_space, _start, _toDate, _amount);   
    //     // if(dateCollision(_start, _toDate, Space.))
    //     // {
    //     //   placeBid(_start, _toDate, _space, _amount);
    //     //   return true;
    //     // }
    //     // else
    //     // {
    //     //   placeBid(_start, _toDate, _space, _amount);
    //     //   return false;
    //     // }
    // }
}