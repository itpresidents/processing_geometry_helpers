# ITP Residents Geometry Helpers README


## What's in Here

Examples that cover basic math and geometry concepts including:
* Using addition, multiplication and exponents to vary speed
* Polar Coordinates 
* Using sin and cos to vary speed
* "Photoshoppy" effects using sin/cos
* Animating in a circle with rotate and sin/cos


## Rune Madsen's Printing Code examples
* Lots of great examples of using polar coordinates to create complex polygons and interactive bezier curves
* https://github.com/runemadsen/printing-code-2012/tree/master/class_code/form

## Chris Kairalla's Polar Coordinate examples:
Polar Coordinate system example:
The polar coordinates (radius, angle) are another way to define a point in space.  Processing uses cartesian (x,y) coordinates for drawing so we will need to convert from polar to cartesian if we want to draw the object to the screen.  These examples will show how to find the angle and radius between 2 points, and then convert it to x,y for drawing.
http://itp.nyu.edu/~ck987/fxf/simple_polar/

Example from Dan Shiffman that just shows conversion from polar to cartesian:
http://www.learningprocessing.com/examples/chapter-13/example-13-5-polar-to-cartesian/

"Point At" example:
This example will calculate the angle between two points and will orient a pointer in the direction of the second point.  You can move the pointer around to show that the two points are arbitrary.  The data on the bottom of the screen is the angle as radians and degrees.
http://itp.nyu.edu/~ck987/fxf/simple_pointer/

"Auto-orient" example
This example will rotate a box along the angle between 2 points.  You can move the points around the screen to visualize that the box will automatically orient to the new angle between the points.
http://itp.nyu.edu/~ck987/fxf/auto_orient/

"Look At" example
Baby will always look at the mouse.  This is a practical application of the concepts above.  We want the eyes to move in the direction of the pointer, but only up to a limited distance.  We also don't want to rotate the eyes, just move them along the angle between the eye and mouse.
http://itp.nyu.edu/~ck987/fxf/baby_eyes/

All of these examples use the functions "calcRotation()" and "polarToCartesian()".  The functions are very simple, but can also be copy/pasted into your own code if you want to use them.