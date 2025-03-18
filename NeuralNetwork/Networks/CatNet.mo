within NeuralNetwork.Networks;

block CatNet "Cat Network"
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
end CatNet;