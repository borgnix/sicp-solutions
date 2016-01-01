#lang racket
(define (pascal-triangle level index)
  (if (or (= level 1)
             (= index 1)
             (= level index))
      1
      (+ (pascal-triangle (- level 1) (- index 1))
         (pascal-triangle (- level 1) index))))

(pascal-triangle 5 3)