(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate
    +
    0
    (map 
      (lambda (el)
        (if (pair? el)
          (count-leaves el)
          1))
      t)))

(count-leaves (list 1 1 (list 3 4) 3 (list 5 6 (list 7))))
