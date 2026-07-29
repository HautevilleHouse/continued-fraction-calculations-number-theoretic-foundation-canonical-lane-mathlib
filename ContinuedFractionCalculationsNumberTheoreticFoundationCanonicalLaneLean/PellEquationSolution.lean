import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean.QuadraticIrrationalPeriodicity

namespace HautevilleHouse
namespace ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean

structure PellEquationPackage {E : EuclideanAlgorithmPackage}
    {C : ContinuedFractionPackage E} (Q : QuadraticIrrationalPackage C) where
  d : Nat
  minimalSolution : Nat × Nat
  fundamentalSolution : Nat × Nat
  brahmaguptaIdentity : Prop

structure PellEquationEvidence {E : EuclideanAlgorithmPackage}
    {C : ContinuedFractionPackage E} {Q : QuadraticIrrationalPackage C}
    (P : PellEquationPackage Q) where
  minimalSolutionClosed : IsSolution P.d P.minimalSolution
  fundamentalSolutionClosed : IsPositiveSolution P.d P.fundamentalSolution
  brahmaguptaIdentityClosed : P.brahmaguptaIdentity

def PellEquationClosed {E : EuclideanAlgorithmPackage}
    {C : ContinuedFractionPackage E} {Q : QuadraticIrrationalPackage C}
    (P : PellEquationPackage Q) : Prop :=
  IsSolution P.d P.minimalSolution ∧ IsPositiveSolution P.d P.fundamentalSolution ∧
  P.brahmaguptaIdentity

theorem pell_equation_closed_from_evidence {E : EuclideanAlgorithmPackage}
    {C : ContinuedFractionPackage E} {Q : QuadraticIrrationalPackage C}
    (P : PellEquationPackage Q) (ev : PellEquationEvidence P) : PellEquationClosed P :=
  And.intro ev.minimalSolutionClosed (And.intro ev.fundamentalSolutionClosed ev.brahmaguptaIdentityClosed)

end ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean
end HautevilleHouse
