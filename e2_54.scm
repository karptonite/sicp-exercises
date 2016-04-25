(define (equal? item1 item2)
  (cond
    ((and (pair? item1) (pair? item2))
     (and (equal? (car item1) (car item2))
          (equal? (cdr item1) (cdr item2))))
    ((or (pair? item1) (pair? item2)) #f)
    (else (eq? item1 item2))))

