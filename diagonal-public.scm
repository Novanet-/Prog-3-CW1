(load "diagonal.scm")
+++

(diagonal '((10)))
$diagonal-1
(10)

(diagonal '((1 2) (3 4)))
$diagonal-2
(1 4)

(diagonal '((1 2 3) (a b c) (4 5 6)))
$diagonal-3
(1 b 6)

(diagonal '())
$diagonal-0
() ;; base case, empty matrix


(diagonal '((1 2 3) (a b c)))
$diagonal-not-square0
(1 b)

(diagonal '((1 2) (a b) (foo far)))
$diagonal-not-square1
+++

(diagonal '((1 2) (a b) (foo far))) ;;; test added following suggestion on 15/10/2015
$diagonal-not-square1-more-strict
(1 b)
