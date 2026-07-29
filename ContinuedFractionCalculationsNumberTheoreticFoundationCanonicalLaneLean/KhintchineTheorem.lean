import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean

structure KhintchineConstant where
  constantValue : ℝ
  averageConverges : Prop

structure KhintchineTheoremPackage where
  constant : KhintchineConstant
  forAlmostAll : Prop
  ergodicArgument : Prop

structure KhintchineEvidence (K : KhintchineTheoremPackage) where
  forAlmostAllClosed : K.forAlmostAll
  ergodicArgumentClosed : K.ergodicArgument

def KhintchineClosed (K : KhintchineTheoremPackage) : Prop :=
  K.forAlmostAll ∧ K.ergodicArgument

theorem khintchine_closed_from_evidence (K : KhintchineTheoremPackage)
    (E : KhintchineEvidence K) : KhintchineClosed K := by
  exact And.intro E.forAlmostAllClosed E.ergodicArgumentClosed

end ContinuedFractionCalculationsNumberTheoreticFoundationCanonicalLaneLean
end HautevilleHouse