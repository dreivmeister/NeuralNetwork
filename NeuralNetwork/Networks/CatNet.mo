within NeuralNetwork.Networks;

block EchoStateNetwork "Cat Network"
  import Modelica.Blocks.Interfaces.RealInput;
  import Modelica.Blocks.Interfaces.RealOutput;
  import Modelica.Math.Matrices;

  parameter Integer R "Number of reservoir neurons";
  parameter Integer N "Dimension of input signal";
  parameter Integer M "Dimension of output signal";

  replaceable function f = NeuralNetwork.ActivationFunctions.Tanh;
  replaceable function g = NeuralNetwork.ActivationFunctions.Id;

  // still needs to be created
  parameter Real W_in[R, N] "Input weight matrix";
  parameter Real W_out[M, R + N] "Output weight matrix";

  RealInput u[N] "Input signal";
  RealOutput y[M] "Output signal";
algorithm
  y := g(W_out * cat(1, f(W_in * u), u));
end EchoStateNetwork;


//EchoStateNetwork esn(R=100, N=10, M=1);