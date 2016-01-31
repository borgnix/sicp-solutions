(define (get-record employee division_file)
  ((get division 'record) division_file))

(define (get-salary employee divison_file)
  ((get employee 'salary) division_file))

(define (find-employee-record employee list)
  (if (null? list)
      #f
      (append (get-recode employee (car list))
              (find-employee-recode employee (cdr list)))))

;4.It should put a new way of get-salary or find employee's record.