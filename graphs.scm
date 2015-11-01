#lang scheme

;;Checks if the graph is null, if so then returns an empty list, if map is null, return graph
;;else calculate the result of applying the map to the graph
(define graph-mapper
  (lambda (graph m)
    (cond ((null? graph) '())
          ((null? m) '())
          (else (calculate-graph graph m)))))

;;If there are no more edges left to applying the map to, then return the empty list
;;Otherwise, create a list of pairs, where each pair is an edge in the original graph, that has had all the
;;functions in the map applied to it
(define calculate-graph
  (lambda (graph m)
    (if (null? graph)
        '()
        (cons (apply-map (car graph) m) (calculate-graph (cdr graph) m) ))))

;;If the given edge of the graph, or the map is empty, then return the empty list
;;Otherwise, apply the map functions in the map to the edge, replacing nodes according to the map
(define apply-map
  (lambda (edge m)
    (cond ((or (null? edge) (null? m)) '())
         ;; (else (replace-nodes edge (car m))))))
          (else (if (and (node-in-map? (sourcenode edge) m)
                         (node-in-map? (destnode edge) m))                 
                    (cons (replace-node (sourcenode edge) m) (replace-node (destnode edge) m))
                    '()
                    )))))

(define replace-node
  (lambda (node m)
  (cond ((null? m) '())
        ((eqv? node (sourcenode (car m))) (destnode (car m)))
         (else (replace-node node (cdr m))))))

(define node-in-map?
  (lambda (node m)
    (cond ((null? m) #f)
          ((eqv? node (sourcenode (car m))) #t)
          (else (node-in-map? node (cdr m))))))

(define sourcenode
  (lambda (edge)
    (car edge)))

(define destnode
  (lambda (edge)
    (if (list? (cdr edge))
        (car (cdr edge))
        (cdr edge))))

;;(load "graphs.scm")

;;Passes first two tests, fails last three
;;> (graph-mapper *graph1* *map1*)
;;((a . b) (b . b) (b . a))
;;> (graph-mapper *graph1* *map2*)
;;((a1 . b1) (b1 . c1) (c1 . a1))
;;> (graph-mapper *graph1* *map3*)
;;((a . b) (b . c) (c . a))
;;> (graph-mapper *graph1* *map4*)
;;((a . b) (b . c) (c . a))
;;> (graph-mapper *graph1* *map5*)
;;((a b) (b c) (c a))
    
    
        