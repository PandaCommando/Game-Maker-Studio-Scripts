///scr_snap_ext(x,y,originx,originy,angle,amount,0[x]/1[y])
/*
BY: Pandacommando

This script will return the position of 
coordinates snapped to an imaginary grid at any angle.

x = input x.
y = input y.
originx = the x origin of the virtual grid.
originy = the y origin of the virtual grid.
angle = angle of virtual grid.
amount = the distance between virtual cells in virtual grid.
0[x]/1[y] = enter 0 to return x value, enter 1 to return y value.
*/



var X = argument0;
var Y = argument1;
var origin_x = argument2;
var origin_y = argument3;
var angle = argument4;
var amount = argument5;
var return_type = argument6;


//get radial position of coords relative to virtual origin
var len = point_distance(origin_x,origin_y,X,Y);
var dir = point_direction(origin_x,origin_y,X,Y) - angle;

//get virtual coordinate values from radial values
var vx = lengthdir_x(len,dir);
var vy = lengthdir_y(len,dir);

//snap to virtual grid
var vxs = round(vx/amount)*amount;
var vys = round(vy/amount)*amount;

//get radial position of new coords
var lens = point_distance(0,0,vxs,vys);
var dirs = point_direction(0,0,vxs,vys) + angle;

//convert coords relative to global origin
var final_x = origin_x + lengthdir_x(lens,dirs);
var final_y = origin_y + lengthdir_y(lens,dirs);


//return values
if(return_type)return(final_y);
else return(final_x);
