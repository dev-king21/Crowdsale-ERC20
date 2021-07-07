pragma solidity ^0.4.24;

import "./OptimusERC20.sol";
import "./RefundableCrowdsale.sol";
import "./MintedCrowdsale.sol";


contract OptimusCrowdsale is RefundableCrowdsale, MintedCrowdsale  {

  constructor(
    uint256 rate,
    address wallet,
    OptimusERC20 token,
    uint256 goal_in_eth,
    uint256 openingtime,
    uint256 closingtime
    
  )
    public
    Crowdsale(rate, wallet, token)
    RefundableCrowdsale(goal_in_eth*10**18)
    TimedCrowdsale(openingtime,closingtime)

  {
    //As goal needs to be met for a successful crowdsale
    //the value needs to less or equal than a cap which is limit for accepted funds
    
  }
  
    function gettimestamp() public view returns(uint256) {
    return now;
  }
}
