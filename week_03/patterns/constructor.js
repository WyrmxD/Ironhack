function Car(model, year, miles){
   this.model = model;
   this.year    = year;
   this.miles  = miles;
   this.whatCar = function(){
     console.log(this.model);
  };
}

var civic = new Car("Honda Civic", 2009, 20000);
var mondeo = new Car("Ford Mondeo", 2010, 5000);

var Klass, cat, civic;

Klass = function(model) {
  var key, value;
  for (key in model) {
    value = model[key];
    this[key] = value;
  }
  return this;
};

civic = new Klass({
  motor: 1.6,
  hybrid: false
});

cat = new Klass({
  type: "persa",
  color: "black"
});