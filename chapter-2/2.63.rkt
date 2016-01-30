#lang racket
(provide (rename-out
          [tree->list-2
           tree->list]))

(require "binary_tree.rkt")

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1
                     (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list
                             (right-branch tree)
                             result-list)))))
  (copy-to-list tree '()))

(define test-tree
  (make-tree 3
             (make-tree 2
                        (make-tree 1 '() '())
                        (make-tree 2.5 '() '()))
             (make-tree 4
                        (make-tree 3.5 '() '())
                        (make-tree 5 '() '()))))


;They produce same result, but tree->list-2 will grow more slowly since it's iterative rather than recusive.
