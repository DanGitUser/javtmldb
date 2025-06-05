package my_proxy;

public class Circle {
	
	double r;
	
	double pie = Math.PI;
	
	public Circle(double r) {
		this.r = r;
	}
	
	Circle area() {
		System.out.println(pie * r * r);
		return this;
	}
	Circle round() {
		System.out.println(pie * r * 2);
		return this;
	}
	Circle setR(double r) {
		this.r = r;
		return this;
	}
}
