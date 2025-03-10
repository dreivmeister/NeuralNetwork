within NeuralNetwork.ActivationFunctions;

function SeLu
  extends ActivationFunction;
algorithm
  y := lambda * (if u > 0 then u else (alpha * (exp(u) - 1)));
end SeLu;