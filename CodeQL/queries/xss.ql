import javascript

from DataFlow::PathNode source, DataFlow::PathNode sink
where
  source instanceof JavaScript::FunctionCallNode and
  source.getEnclosingCallable().toString().matches(".*\\b(innerHTML|textContent)\\b.*") and
  sink instanceof JavaScript::PropertyAccessNode and
  sink.getPropertyName() = "innerHTML" and
  source = sink
select source, sink, "Possible XSS vulnerability"
