within NeuralNetwork.Examples.Utilities;

block EchoStateNetwork "Echo State Network"
  import Modelica.Blocks.Interfaces.RealInput;
  import Modelica.Blocks.Interfaces.RealOutput;
  import Modelica.Math.Matrices;

  parameter Integer R "Number of reservoir neurons";
  parameter Integer N "Dimension of input signal";
  parameter Integer M "Dimension of output signal";

  replaceable function f = NeuralNetwork.ActivationFunctions.Tanh;
  replaceable function g = NeuralNetwork.ActivationFunctions.Id;

  // still needs to be created
  parameter Real W[R, R] "Reservoir weight matrix";
  parameter Real W_in[R, N] "Input weight matrix";
  parameter Real W_out[M, R + N] "Output weight matrix";

  RealInput u[N] "Input signal";
  RealOutput y[M] "Output signal";

protected
  discrete Real x[N] "Reservoir state";

algorithm
  x := f(W * x + W_in * u);
  y := g(W_out * cat(1, x, u));
end EchoStateNetwork;


//EchoStateNetwork esn(R=100, N=10, M=1);