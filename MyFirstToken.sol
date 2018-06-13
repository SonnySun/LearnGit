pragma solidity ^0.4.0;

import "Token.sol"
import "ERC20.sol"
import "ERC223.sol"
import "ERC223ReceivingContract.sol"

contract MyFirstToken is Token("MFT","My First Token",18,1000),ERC20,ERC223{
	using SaftMath for unit;

	function MyFirstToken() public{
		_balanceOf[msg.sender] = _totalSupply;
	}

	function totalSupply() public constant returns(uint){
		return _totalSupply;
	}

	function balanceOf(address _addr) public constant returns (uint){
		return _balanceOf[_addr];
	}

	function transfer(address _to, uint _value) public returns (bool){
		if (_value >0 &&
			_value <= _balanceOf[msg.sender] &&
			!isContract(_to)){
			_balanceOf[msg.sender].sub(value);
			_balanceOf[_to].add(_value);
			Transfer(msg.sender,_to,_value);
			return true;
		}
		return false;
	}

	function transfer(address _to,uint _value,bytes _data) public returns(bool){
		if (_value > 0 &&
			_value <= _balanceOf[msg.sender] &&
			isContract(_to)){
			_balanceOf[msg.sender].sub(_value);
			_balanceOf[_to].add(_value);

		}
	}



}