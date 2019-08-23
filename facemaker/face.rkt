#lang racket

(provide face)
 
(require 2htdp/image rackunit)

;; String -> Image        ;signature
;; customize skin color      ;purpose
(define (skin a)
  (circle 50 "solid" a))

;; String -> Image        ;signature
;; customize eye color         ;purpose
(define (eye b c)
  (overlay (eyeball c)
  (circle 10 "solid" b)))

;; String -> Image        ;signature
;; customize eyeball color        ;purpose
(define (eyeball c)
  (circle 2 "solid" c)
  )

;; String -> Image        ;signature
;; customize mouth color         ;purpose
(define (mouth d)
  (circle 10 "solid" d))

;; String -> Image        ;signature
;; customize skin color       ;purpose
(define (mouthtop e)
  (rectangle 20 10 "solid" e))

;; String -> Image        ;signature
;; customize both eyeballs       ;purpose

;; String -> Image        ;signature
;; customize both eyes       ;purpose
(define (eyes b c)
  (beside (eye b c) 
                  (eye b c)))
;; String -> Image        ;signature
;; customize eye color         ;purpose
(define (hair f)
  (beside

                (add-curve (rectangle 30 100 "solid" "transparent")                   
                                             50 20 0 -2/3
                                             0 100 0 -1/4
                                            
                                             (make-pen f 32 "solid" "round" "round"))
                (add-curve (rectangle 50 100 "solid" "transparent")                   
                             -10 20 0 2/3
                             60 100 0 1/3
                             (make-pen f 32 "solid" "round" "round"))
                ))

;; String, String, String -> Image        ;signature
;; customize face         ;purpose
(define (face a b c d f)

  (overlay/offset (hair f) -10 20
   (overlay/offset (eyes b c) 0 10
                   (overlay/offset (mouthtop a) 0 -10
                                   (overlay/offset (mouth d) 0 -15
                                                   (skin a)
                                                   )))))
  (face "yellow" "white" "black" "black" "black" )
(module+ test
  (face "yellow" "white" "black" "black" "black" )

  (check-equal? (image-width (skin "red"))
                100)
  (check-equal? (image-width (eye "red" "blue"))
                20)
  (check-equal? (image-width(eyeball "red"))
                 4)
  (check-equal? (image-width (mouth "red"))
                20)
  (check-equal? (image-width(mouthtop "red"))
                20)
 (check-equal?(image-width (face "red" "green" "blue" "blue"))
                100)
  )

