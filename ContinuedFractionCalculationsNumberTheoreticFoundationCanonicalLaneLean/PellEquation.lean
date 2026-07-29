import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean

structure PellEquationPackage where
  d : ℕ
  fundamentalSolution : ℤ × ℤ
  infiniteSolutions : Prop
  solutionFromCF : Prop
  fundamentalFromCF : Prop

structure PellEquationEvidence (P : PellEquationPackage) where
  infiniteSolutionsClosed : P.infiniteSolutions
  fundamentalFromCFClosed : P.fundamentalFromCF

def PellEquationClosed (P : PellEquationPackage) : Prop :=
  P.infiniteSolutions ∧ P.fundamentalFromCF

theorem pell_equation_closed_from_evidence (P : PellEquationPackage)
    (Ev : PellEquationEvidence P) : PellEquationClosed P := by
  exact And.intro Ev.infiniteSolutionsClosed Ev.fundamentalFromCFClosed

end ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean
end HautevilleHouse