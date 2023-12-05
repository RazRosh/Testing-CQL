import javascript

from DataFlow::PathNode source, DataFlow::PathNode sink
where
  source instanceof JavaScript::FunctionCallNode and
  source.getEnclosingCallable().toString().matches(".*\\b(fetch|request|ajax)\\b.*") and
  sink instanceof JavaScript::PropertyAccessNode and
  sink.getPropertyName().matches(".*\\b(password|token|secret|apikey)\\b.*") and
  source = sink
select source, sink, "Potential sensitive data exposure"
