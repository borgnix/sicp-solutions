#lang racket
(require (rename-in "2.62.rkt"
                    [union union-n]))
(require "2.63.rkt")
(require "2.64.rkt")

(define (union set1 set2)
  (list->tree
   (union-n
    (tree->list
     set1)
    (tree->list
     set2))))

;same with intersection.