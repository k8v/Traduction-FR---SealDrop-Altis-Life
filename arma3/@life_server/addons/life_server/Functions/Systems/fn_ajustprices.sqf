/*
File: fn_Ajustprices.sqf
Author: worldtrade1101

Description:
Sends a request to update and adjust the price of stuff in the DB.
*/

//[[0,player,life_shop_type,_amount,_price,_var],"TON_fnc_Adjustprices",false,false] spawn life_fnc_MP;
private["_type","_side","_data","_unit","_ret","_tickTime","_queryResult","_var","_price","_amount"];
_type = [_this,0,0,[0]] call BIS_fnc_param;
_unit = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_data = [_this,2,"",[""]] call BIS_fnc_param;
_amount = [_this,3,0,[0]] call BIS_fnc_param;
_price = [_this,4,0,[0]] call BIS_fnc_param;
_var = [_this,5,"",[""]] call BIS_fnc_param;


if( (_data == "") OR (isNull _unit)) exitWith {};
_unit = owner _unit;
_randomnumber = random 100;

if (_randomnumber < 60) exitwith {diag_log "This transaction doesn't update the price!"};
_query = format["SELECT factor FROM economy WHERE ressource='%1'",_var];
_queryResult = [_query,2,true] call DB_fnc_asyncCall;
if(((_queryResult select 0) select 0) == 0) exitwith {};//the factor 0 is not a real group
_group = ((_queryResult select 0) select 0);

_query = format["SELECT ressource, buyprice, sellprice, varprice, minprice, maxprice FROM economy WHERE factor='%1'",_group];

if(_query == "Error") exitWith {};

_queryResult = [_query,2,true] call DB_fnc_asyncCall;
_sellingfactor =((count _queryResult)-1);
_query ="";
_queryArray = [];
_AllOk = TRUE;
{
_ressource = _x select 0;
_buyprice =  (_x select 1);
_sellprice =  (_x select 2);
_varprice =  (_x select 3);
_minprice = (_x select 4);
_maxprice = (_x select 5);

if (_ressource == _var) then { //C'est l'item vendu ou achete
if (_type == 0) then {//si on vend l'item
if (_buyprice != 0) then {if( (_buyprice - (_varprice * _amount)) > _minprice) then {_buyprice= _buyprice - (_varprice * _amount);}else {_allOk = false;};};
if ((_sellprice - (_varprice * _amount *_sellingfactor)) > _minprice) then {_sellprice = _sellprice - (_varprice * _amount *_sellingfactor);}else {_allOk = false;};
if (_buyprice != 0) then {if ((_sellprice >= _buyprice)) then {_buyprice=_sellprice + 15};};
} else {//si on achete l'item
if (_buyprice != 0) then {if( (_buyprice + (_varprice * _amount)) < (_maxprice+15)) then {_buyprice = _buyprice + (_varprice * _amount);}else {_allOk = false;};};
if ((_sellprice + (_varprice * _amount)) < _maxprice) then {_sellprice = _sellprice + (_varprice * _amount);}else {_allOk = false;};
};

} else {
if (_type == 0) then {//si on a vendu un autre item on augmente le prix
if (_buyprice != 0) then {if( (_buyprice + (_varprice * _amount)) < (_maxprice)) then {_buyprice = _buyprice + (_varprice * _amount);}else {_allOk = false;};};
if ((_sellprice + (_varprice * _amount)) < _maxprice) then {_sellprice = _sellprice + (_varprice * _amount);} else {_allOk = false;};

} else { //si on achete un autre item on baisse le prix
if (_buyprice != 0) then {if( (_buyprice - (_varprice * _amount)) > _minprice ) then {_buyprice= _buyprice - (_varprice * _amount);} else {_allOk = false;};};
if ((_sellprice - (_varprice * _amount)) > _minprice) then {_sellprice = _sellprice - (_varprice * _amount);}else {_allOk = false;};
};
};
_query =format["UPDATE economy SET buyprice='%1', sellprice='%2' WHERE ressource='%3'",_buyprice,_sellprice,_ressource];
_queryArray set [count _queryArray,_query];

}foreach _queryResult;
if (_AllOk) then { //We update the prices!
{
_queryResult = [_x,1] call DB_fnc_asyncCall;
}foreach _queryArray;
};