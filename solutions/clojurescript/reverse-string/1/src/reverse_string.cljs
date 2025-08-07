(ns reverse-string
  (:require [clojure.string :as str]))

(defn reverse-string [s] ;; arguments vector...
  (str/join (reverse s))
  )
