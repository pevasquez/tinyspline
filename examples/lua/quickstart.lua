local ts = require("tinysplinelua")

-- Create a clamped spline of degree 3 in 2D consisting of 7 control points.
spline = ts.BSpline(3, 2, 7, ts.TS_CLAMPED)

-- Setup the control points.
ctrlp = spline.ctrlp
ctrlp[1]  = -1.75 -- x0
ctrlp[2]  = -1.0  -- y0
ctrlp[3]  = -1.5  -- x1
ctrlp[4]  = -0.5  -- y1
ctrlp[5]  = -1.5  -- x2
ctrlp[6]  =  0.0  -- y2
ctrlp[7]  = -1.25 -- x3
ctrlp[8]  =  0.5  -- y3
ctrlp[9]  = -0.75 -- x4
ctrlp[10] =  0.75 -- y4
ctrlp[11] =  0.0  -- x5
ctrlp[12] =  0.5  -- y5
ctrlp[13] =  0.5  -- x6
ctrlp[14] =  0.0  -- y6
spline.ctrlp = ctrlp

-- Evaluate `spline` at u = 0.4
result = spline:evaluate(0.4).result
print("x = ", result[1], "y = ", result[2]);

-- Derive `spline` and subdivide it into a sequence of Bezier curves.
beziers = spline:derive():toBeziers()

-- Evaluate `beziers` at u = 0.3
result = beziers(0.3).result -- you can use '()' instead of 'evaluate'
print("x = ", result[1], "y = ", result[2]);
