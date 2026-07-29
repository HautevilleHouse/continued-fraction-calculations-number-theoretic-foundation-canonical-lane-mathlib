import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean.ContinuedFractionConvergence

namespace HautevilleHouse
namespace ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean

structure DiophantineApproximationPackage {E : EuclideanAlgorithmPackage}
    (C : ContinuedFractionPackage E) where
  realNumber : ℝ
  rationalApproximations : List (ℚ × ℚ)
  dirichletTheorem : Prop
  hurwitzTheorem : Prop
  liouvilleNumber : Prop

structure DiophantineApproximationEvidence {E : EuclideanAlgorithmPackage}
    {C : ContinuedFractionPackage E} (D : DiophantineApproximationPackage C) where
  dirichletTheoremClosed : D.dirichletTheorem
  hurwitzTheoremClosed : D.hurwitzTheorem
  liouvilleNumberClosed : D.liouvilleNumber

def DiophantineApproximationClosed {E : EuclideanAlgorithmPackage}
    {C : ContinuedFractionPackage E} (D : DiophantineApproximationPackage C) : Prop :=
  D.dirichletTheorem ∧ D.hurwitzTheorem ∧ D.liouvilleNumber

theorem diophantine_approximation_closed_from_evidence {E : EuclideanAlgorithmPackage}
    {C : ContinuedFractionPackage E} (D : DiophantineApproximationPackage C)
    (ev : DiophantineApproximationEvidence D) : DiophantineApproximationClosed D :=
  And.intro ev.dirichletTheoremClosed (And.intro ev.hurwitzTheoremClosed ev.liouvilleNumberClosed)

end ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean
end HautevilleHouse
