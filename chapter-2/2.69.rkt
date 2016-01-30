#lang racket
(require "huffman_tree.rkt")
(provide generate-huffman-tree)
(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge set)
  (if (null? (cdr set))
      (car set)
      (successive-merge 
       (adjoin-set
        (make-code-tree (car set) (cadr set))
        (cddr set)))))

(define sample-pairs '((A 4) (B 2) (C 1) (D 1)))

(define sample-tree (generate-huffman-tree sample-pairs))

