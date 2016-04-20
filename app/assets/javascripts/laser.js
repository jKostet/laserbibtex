/**
 * Created by jkostet on 19/04/16.
 */

var mycanvas;
var mystarfield;
var stars = 700;
var canvas_x = 200;
var canvas_y = 200;

init();

function init(){
    mycanvas = new canvas(canvas_x, canvas_y, "main");
    mystarfield = new starfield3D(mycanvas, stars, 15, canvas_x, canvas_y, canvas_x*2, canvas_y*2,'red', 10,10,10);
    pewpew();
}

function pewpew(){
    mycanvas.fill('black');
    mystarfield.draw();
    requestAnimFrame(pewpew);
}