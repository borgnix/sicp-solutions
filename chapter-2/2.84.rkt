#lang racket
(put 'lower 'integer 'rational)
(put 'upper 'integer 'none)
(put 'lower 'rational 'real)
(put 'upper 'rational 'integer)
(put 'lower 'real 'complex)
(put 'upper 'real 'rational)
(put 'lower 'complex 'none)
(put 'upper 'complex 'real)


(define (type1-lower-than-type2? type1 type2)
  (let ((upper-type (get 'upper type1)))
    (cond [(eq? upper-type 'none) #f]
          [(eq? upper-type type2) #t]
          [else
           (type1-lower-than-type2? upper-type type2)])))

(define (raise-type1->type2 type1 type2)
  (if (eq? type1 type2)
      type1
      (raise-type1->type2 (raise type1) type2)))


(define (apply-generic op . args)
  (let ((type-tags (map (type-tag args))))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                (if (eq? type1 type2)
                    (error "No method for these types")
                    (if (type1-lower-than-type2? type1 type2)
                        (apply-generic op (raise-type1->type2 a1 a2) a2)
                        (apply-generic op a1 (raise-type1->type2 a2 a1)))))
              (error "No method for these types"
                     (list op type-tags)))))))
