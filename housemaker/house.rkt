#lang racket

(provide house-scene)

(require 2htdp/image)

(define (roof a)
  (isosceles-triangle 60 120 "solid" a))
(define (door b)
  (rectangle 20 35 'solid b))
(define (window c)
  (square 25 'solid c))
(define (body e)
  (rectangle 100 80 'solid e))

(define (tree d)
  (circle 40 "solid" d))
(define (truck f)
  (rectangle 20 50 "solid" f))
  
 
(define (house-scene a b c d e f)
  (beside
   (above
    (roof a)
    (overlay/offset (window c) 20 20
                    (overlay/offset (window c) -20 20
                                    (overlay/offset (door b) 0 -20
                                                    (body e)))))



   (above (tree d)
          (truck f))))

(house-scene "pink" "blue" "lightyellow" "green" "gray" "purple") 