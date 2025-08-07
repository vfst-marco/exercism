(ns leap)

(defn leap-year?
  "Determine if a year is a leap year"
  [year]
  (and (zero? (mod year 4))
       (or (not (zero? (mod year 100)))
           (zero? (mod year 400)))
  ))
