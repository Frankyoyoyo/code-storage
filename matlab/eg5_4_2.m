y=dsolve('Dy=y^2-y^3','y(0)=0.005');
y=simplify(y)
pretty(y)
ezplot(y,0,300)