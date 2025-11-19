model IshigamiFunction

  final parameter Real a = 7;

  final parameter Real b = 0.05;

  parameter Real x1 = 1;

  parameter Real x2 = 1;

  parameter Real x3 = 1;

  Real f;

equation

  f = sin(x1) + a * sin(x2)^2 + b * x3^4 * sin(x1);

end IshigamiFunction;