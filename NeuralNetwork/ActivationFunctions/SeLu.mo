within NeuralNetwork.ActivationFunctions;

function SeLu
  extends ActivationFunction;
protected
  constant Real lambda = 1.0507009873554804934193349852946;
  constant Real alpha = 1.6732632423543772848170429916717;
algorithm
  y := lambda * (if u > 0 then u else (alpha * (exp(u) - 1)));
end SeLu;