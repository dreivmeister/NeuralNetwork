within NeuralNetwork.Networks;

block EchoStateNetwork "Echo State Network"
  // parameter Integer R "Number of reservoir neurons";
  // parameter Integer N "Dimension of input signal";
  // parameter Integer M "Dimension of output signal";

  replaceable function f = NeuralNetwork.ActivationFunctions.Tanh;
  replaceable function g = NeuralNetwork.ActivationFunctions.Id;

  // still needs to be created
  parameter Real W[:, :] "Reservoir weight matrix"; // R, R
  parameter Real W_in[:, :] "Input weight matrix"; // R, N
  parameter Real W_out[:, :] "Output weight matrix"; // M, R + N

  RealInput u[:] "Input signal"; // N
  RealOutput y[:] "Output signal"; // M

protected
  discrete Real x[N] "Reservoir state";

algorithm
  x := f(W * x + W_in * u);
  y := g(W_out * cat(1, x, u));
end EchoStateNetwork;


//EchoStateNetwork esn(R=100, N=10, M=1);