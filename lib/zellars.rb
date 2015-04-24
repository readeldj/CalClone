
class Zellers

	def zellers_congruence(q, m, K, J)
	  # h = #day of the week (0 = Saturday, 1 = Sunday, 2 = Monday, ..., 6 = Friday)
	  # q = #day of the month
	  # m = #month (3 = March, 4 = April, 5 = May, ..., 14 = February)
	  # K = #year of the century (year \mod 100).
	  # J = #zero-based century (actually \lfloor year/100 \rfloor) For example, the zero-based centuries for 1995 and 2000 are 19 and 20 respectively (to not be confused with the common ordinal century enumeration which indicates 20th for both cases).
	  h = (q + ((13 * (m + 1)) / 5).floor + K + (K / 4).floor + (J / 4).floor + (5 * J))%7
	end

end