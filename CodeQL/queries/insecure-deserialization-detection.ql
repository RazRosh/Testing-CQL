import javascript

from DataFlow::PathNode source, DataFlow::PathNode sink
where
  source instanceof JavaScript::FunctionCallNode and
  source.getEnclosingCallable().toString().matches(".*\\b(JSON\\.parse|deserialize)\\b.*") and
  sink instanceof JavaScript::FunctionCallNode and
  sink.getEnclosingCallable().toString().matches(".*\\b(eval|exec|Function)\\b.*") and
  source = sink
select source, sink, "Potential insecure deserialization"
