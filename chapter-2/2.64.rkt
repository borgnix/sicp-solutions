#lang racket
(require "binary_tree.rkt")
(require "2.63.rkt")
(provide list->tree)

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result
               (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result
                   (partial-tree
                    (cdr non-left-elts)
                    right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts
                     (cdr right-result)))
                (cons (make-tree this-entry
                                 left-tree
                                 right-tree)
                      remaining-elts))))))))

;partial-tree takes a list and divided it into four parts:
;1. left part, whose size is (n - 1) / 2.
;2. the remaining part
;2.1 first element of the remaining part is the entry of current node, and it's also the middle element
;2.2 the rest
;2.2.1 (n - (left-size + 1) elements in the left part
;2.2.2 the rest is remaining element.
;and continue to apply the partial-tree to left-tree and right-tree.
;
; O(n)