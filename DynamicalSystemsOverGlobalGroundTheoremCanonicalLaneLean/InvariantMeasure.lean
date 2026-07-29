import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean

structure InvariantMeasurePackage where
  phaseSpace : Type u
  flow : phaseSpace → ℝ → phaseSpace
  sigmaAlgebra : Type v
  measure : phaseSpace → ℝ
  invarianceProperty : Prop
  ergodicity : Prop
  mixing : Prop

structure InvariantMeasureEvidence (I : InvariantMeasurePackage) where
  invariancePropertyClosed : I.invarianceProperty
  ergodicityClosed : I.ergodicity
  mixingClosed : I.mixing

def InvariantMeasureClosed (I : InvariantMeasurePackage) : Prop :=
  I.invarianceProperty ∧ I.ergodicity ∧ I.mixing

theorem invariant_measure_closed_from_evidence (I : InvariantMeasurePackage)
    (E : InvariantMeasureEvidence I) : InvariantMeasureClosed I := by
  exact And.intro E.invariancePropertyClosed
    (And.intro E.ergodicityClosed E.mixingClosed)

end DynamicalSystemsOverGlobalGroundTheoremCanonicalLaneLean
end HautevilleHouse
