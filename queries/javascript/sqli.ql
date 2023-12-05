import javascript

from DataFlow::PathNode source, DataFlow::PathNode sink
where
  source instanceof JavaScript::FunctionCallNode and
  source.getEnclosingCallable().toString().matches(".*\\b(query|execute|exec|sql)\\b.*") and
  sink instanceof JavaScript::FunctionCallNode and
  sink.getEnclosingCallable().toString().matches(".*\\b(prepare|execute|query)\\b.*") and
  source = sink
select source, sink, "Possible SQL Injection vulnerability"
