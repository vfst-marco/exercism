(ns two-fer)

(defn two-fer 
  ( [] ;; <-- arguments come here.
   (two-fer "you")) 
  ([name] ;; <-- arguments come here.
   (str "One for " name ", one for me.")
   ))