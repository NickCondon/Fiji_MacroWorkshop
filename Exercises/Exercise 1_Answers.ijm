//resets log window
print("\\Clear");

//prints defined string
print("Hello World");

//prints variable
usrName = "Ernst";
print("Hi, my name is "+usrName);

//prints integer + string together
print(32+" years");

//performs calculation and prints integeer and string together
print(32*12+" months");

//defines two variables, performs calculation and prints resulting integer + string
distance = 100;
time = 40;
print(distance/time+ "m/s");

//prints a spacer
print("");

//defines array and prints both whole array and single array element
cities = newArray("Brisbane", "Sydney", "Melbourne");
print("My top 3 Australian cities are:");
Array.print(cities);
print("My abosolute favourite is: "+cities[0]);	
