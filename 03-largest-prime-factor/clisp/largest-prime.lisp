; recursive! stack overflow when processing large numbers
(defun recFactorize (num &optional (i 2) (maxFactor (sqrt num)))
  (if (and (> maxFactor i) (> num 2))
      (if (= (mod num i) 0); if 'i' is a factor, add it to the list; otherwise, try the next potential prime
          (cons i (factorize (/ num i) i maxFactor))
          (factorize num (if (= i 2) 3 (+ i 2)) maxFactor)); note: 'i' is ugly here to account for the first iteration when 'i=2'
      (list num))); any non-1 remainder is also a prime factor

; not recursive, but I'm not sure if this is necessarily in the spirit of LISP
(defun factorize (num)
  (setq i 3 maxFactor (sqrt num))
  ; factor out all the twos
  (setq factors (loop while (= (mod num 2) 0)
	      do (setq num (/ num 2))
	      collect 2))

  ; after all twos are factored out, every possible remaining prime is odd
  ; search for all primes less than the square root of the original
  (loop while (and (<= i maxFactor) (> num 2))
	do (if (= (mod num i) 0)
	     (progn
	       (setq factors (append factors (list i)))
	       (setq num (/ num i)))
	     (setq i (+ i 2))))

  ; any non-1 remainder is also a prime factor
  (if (> num 1)
    (setq factors (append factors (list num))))

  ; return the list of prime factors
  factors)
  

(defun main ()
  (setq myNumber 6008514722372248)
  (time (setq primeFactors (factorize myNumber)))
  (format t "~%~%List of all prime factors for the number ~D: ~%~D~%"
	  myNumber primeFactors)
  (format t "~%Largest prime factor: ~%~D~%" (last primeFactors)))

(main)
