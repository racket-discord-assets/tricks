(require pict
         pict/balloon
         racket/draw)

(define raw-text
  (cond
    [reply-contents reply-contents]
    [else string-args]))

(define temperature
  (string->number raw-text))

(define a-pict
  (thermometer #:height-% temperature
    #:stem-height 90
    #:bottom-circle-diameter 40
    #:top-circle-diameter 20
    #:mercury-inset 4))

((call-trick 'libshowpng #f) a-pict)
