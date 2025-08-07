(ns cars-assemble)

(defn success-rate
  "Returns the success rate of the assembly line as a percentage"
  [speed]
  (cond
    (<= speed 0) 0
    (<= speed 4) 1.0
    (<= speed 8) 0.9
    (<= speed 9) 0.8
    (<= speed 10) 0.77))

(defn production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  [speed]
  (let [base-rate 221
        success-rate (success-rate speed)]
    (* base-rate speed success-rate)))

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (let [production-rate (production-rate speed)]
    (int (/ production-rate 60))))

