import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean

structure PellEquationPackage where
  d : ℕ
  fundamentalSolution : ℤ × ℤ
  infiniteSolutions : Prop
  convergentsYieldSolutions : Prop

structure PellEquationEvidence (P : PellEquationPackage) where
  fundamentalSolutionClosed : P.fundamentalSolution.1^2 - P.d * P.fundamentalSolution.2^2 = 1
  infiniteSolutionsClosed : P.infiniteSolutions
  convergentsYieldSolutionsClosed : P.convergentsYieldSolutions

def PellEquationClosed (P : PellEquationPackage) : Prop :=
  P.infiniteSolutions ∧ P.convergentsYieldSolutions

theorem pell_equation_closed_from_evidence (P : PellEquationPackage) (E : PellEquationEvidence P) : PellEquationClosed P :=
  And.intro E.infiniteSolutionsClosed E.convergentsYieldSolutionsClosed

end ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean
end HautevilleHouse
