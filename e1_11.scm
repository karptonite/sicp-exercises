(define (fun n)
  (cond ((< n 3) n)
        (else (+ (fun (- n 1))
                 (* 2 (fun (- n 2)))
                 (* 3 (fun (- n 3)))))))

(define (fun-im n) (fun-iter 0 1 2 n))
(define (fun-iter a b c n)
  (cond ((< n 2) n)
    ((= n 2) c)
    (else (fun-iter b c (+ c (* 2 b) (* 3 a)) (- n 1)))))
