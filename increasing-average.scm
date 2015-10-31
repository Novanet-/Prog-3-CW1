#lang scheme

(define increasing-average
  (lambda (lst)
    (if (null? lst)
     (error "No average")
     (if (checkAverage lst 0 (car lst))
        (newline) 
        #f))))
        
(define checkAverage
  (lambda (lst n prevAvg)
    (if (< (calculate-average lst n) prevAvg)
    #f
    (if (= n (- (length lst) 1))
     (display (calculate-average lst n))
     (checkAverage lst (+ n 1) (calculate-average lst n))))))
        
(define calculate-average
  (lambda (lst n)
   (/ (sum-numbers lst n 0) (+ n 1))))

(define sum-numbers
  (lambda (lst n acc)
    (if (> acc n)
        0
        (+ (list-ref lst acc) (sum-numbers lst n (+ acc 1))))))