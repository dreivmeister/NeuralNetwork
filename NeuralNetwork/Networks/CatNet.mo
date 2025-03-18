within NeuralNetwork.Networks;

block CatNet1 "Cat Network 1"
  // parameter Integer R "Number of reservoir neurons";
  // parameter Integer N "Dimension of input signal";
  // parameter Integer M "Dimension of output signal";

  replaceable function f = NeuralNetwork.ActivationFunctions.Tanh;
  replaceable function g = NeuralNetwork.ActivationFunctions.Id;

  // still needs to be created
  parameter Real W_in[:, :] "Input weight matrix"; // R, N
  parameter Real W_out[:, :] "Output weight matrix"; // M, R + N

  RealInput u[:] "Input signal"; // N
  RealOutput y[:] "Output signal"; // M
algorithm
  y := g(W_out * cat(1, f(W_in * u), u));
end CatNet1;

block CatNet2 "Cat Network 2"
  // parameter Integer H "Number of hidden neurons";
  // parameter Integer N "Dimension of input signal";
  // parameter Integer M "Dimension of output signal";

  replaceable function f = NeuralNetwork.ActivationFunctions.Tanh;
  replaceable function g = NeuralNetwork.ActivationFunctions.Id;

  // still needs to be created
  parameter Real W_in[:, :] "Input weight matrix"; // H, N
  parameter Real W_out[:, :] "Output weight matrix"; // M, H
  parameter Real W_u[:, :] "Input projection matrix"; // H, N

  RealInput u[:] "Input signal"; // N
  RealOutput y[:] "Output signal"; // M
algorithm
  y := g(W_out * (f(W_in * u) + W_u * u));
end CatNet2;

block CatNet3 "Cat Network 3"
  // parameter Integer H "Number of hidden neurons";
  // parameter Integer N "Dimension of input signal";
  // parameter Integer M "Dimension of output signal";

  replaceable function f = NeuralNetwork.ActivationFunctions.Tanh;
  replaceable function g = NeuralNetwork.ActivationFunctions.Id;

  // still needs to be created
  parameter Real W_in[:, :] "Input weight matrix"; // H, N
  parameter Real W_out[:, :] "Output weight matrix"; // M, H
  parameter Real W_u[:, :] "Input projection matrix"; // H, N

  RealInput u[:] "Input signal"; // N
  RealOutput y[:] "Output signal"; // M
algorithm
  y := g(W_out * (f(W_in * u) .* (W_u * u)));
end CatNet3;

block CatNet4 "Cat Network 4"
  // parameter Integer H "Number of hidden neurons";
  // parameter Integer N "Dimension of input signal";
  // parameter Integer M "Dimension of output signal";

  replaceable function f = NeuralNetwork.ActivationFunctions.Tanh;
  replaceable function g = NeuralNetwork.ActivationFunctions.Id;

  // still needs to be created
  parameter Real W_in[:, :] "Input weight matrix"; // H, N
  parameter Real W_out[:, :] "Output weight matrix"; // M, H

  RealInput u[:] "Input signal"; // N
  RealOutput y[:] "Output signal"; // M
algorithm
  y := g(W_out * f(W_in * u));
end CatNet4;