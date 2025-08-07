module LogLevels

let message (logLine: string): string =
  let m = (logLine.Split ":")[1]
  m.Trim ()

let logLevel(logLine: string): string = 
  let t1 = logLine.Split "["
  let t1 = t1[1].Split "]"
  t1[0].ToLower ()

let reformat(logLine: string): string = sprintf "%s (%s)" (message logLine) (logLevel logLine)
