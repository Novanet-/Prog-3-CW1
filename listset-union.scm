#lang scheme

(begin
  (define listset-add
    (lambda (element set)
      (if (member element set)
          set
          (cons element set))))


  (define listset-empty '())
  (define listset-null?
    (lambda (set)
      (equal? set listset-empty)))

  (define listset-first car)
  (define listset-rest cdr)

  (define listset-included?
    (lambda (set1 set2)
      (if (listset-null? set1)
          #t
          (if (member (listset-first set1) set2)
              (listset-included? (listset-rest set1) set2)
              #f))))

  (define listset-equal?
    (lambda (set1 set2)
      (and (listset-included? set1 set2)
           (listset-included? set2 set1)))))

(begin
  (define set1 (listset-add '1 listset-empty))
  (define set2 (listset-add '2 set1))
  (define set3 (listset-add '3 set2))
  
  (define seta (listset-add 'a listset-empty))
  (define setb (listset-add 'b seta))
  (define setc (listset-add 'c setb))
  (define setd (listset-add 'd setc)))

(define listset-union
  (lambda (set1 set2)
    (cond ((listset-null? set1) set2)
          ((listset-null? set2) set1)
          ((listset-equal? set1 set2) set1)
          (else
               (compute-union set1 set2)))))

(define compute-union
  (lambda (set1 set2)
    (cond ((listset-null? set2) set1)
          ((member (listset-first set2) set1) (compute-union set1 (listset-rest set2)))
          (else (compute-union (listset-add (listset-first set2) set1) (listset-rest set2))))))

;;(load "listset-union.scm")
;;(listset-union set3 setd)

