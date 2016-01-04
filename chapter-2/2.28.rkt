#lang racket
(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1)
            (append (cdr list1)
                    list2))))

(define (fringe list)
  (cond [(null? list)
         list]
        [(pair? (car list))
         (append (fringe (car list))
                 (fringe (cdr list)))]
        [else
         (cons (car list)
               (fringe (cdr list)))]))
    
    
    
(define x (list (list 1 2) (list 3 4)))
(fringe x)
(fringe (list x x))

    
    
    
    
    
    
    