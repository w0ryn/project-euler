; returns a list containing the prime factors of a number
(defun factorize (num)
  (setq i 3 maxFactor (sqrt num))
  ; factor out all the twos
  (setq factors (loop while (= (mod num 2) 0)
		      do (setq num (/ num 2))
		      collect 2))
  ; after all twos are factored out, every possible remaining prime is odd
  (loop while (and (<= i maxFactor) (> num 2)); search every odd divisor less than the square root of the original number
	do (if (= (mod num i) 0); check to see if (i) is a new factor
	     (setq
	       factors (append factors (list i)); add the new factor to the list
	       num (/ num i)))
	     (setq i (+ i 2))); check the next odd divisor if the current (i) is not a factor
  ; any non-1 remainder must also be a prime factor
  (if (> num 1)
    (setq factors (append factors (list num))))
  factors); return the list of prime factors

(defun main ()
  (setq myNumber 600851475143); number from problem definition
  (time (setq primeFactors (factorize myNumber))); time the calculation
  (format t "
	  ~%List of all prime factors for the number ~D: ~%~D~%
	  ~%Largest prime factor: ~%~D~%"
	  myNumber primeFactors (last primeFactors))); user-friendly output :)

(main)
